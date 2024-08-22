version 1.0

task task_filter_bracken_output {
  input {
    File bracken_file
    Array[Int] taxid_exclude
    Array[Int] taxid_include
    String bracken_file_filtered
    String docker = "dbest/krakentools:v1.2"
    String memory = "10GB"
    Int disk_size = 100
  }

  command <<<
    set -ex
    filter_bracken.out.py \
    --input-file ~{bracken_file} \
    --output ~{bracken_file_filtered} \
    --exclude ~{sep="" taxid_exclude} \
    --include ~{sep="" taxid_include}
  >>>

  output {
    File output_file = bracken_file_filtered
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Filter out taxids from bracken classification output"
  }
  
  parameter_meta {
    # inputs
    bracken_file: {description: "Classification result from bracken.", category: "required"}
    bracken_file_filtered: {description: "Name of output file.", category: "required"}
    taxid_exclude: {description: "List of taxids to be included or excluded. Can be empty list.", category: "required"}
    taxid_include: {description: "List of taxids to be included or excluded. Can be empty list.", category: "required"}

    memory: {description: "The amount of memory available to the job.", category: "advanced"}
    docker: {description: "The docker image used for this task. Changing this may result in errors which the developers may choose not to address.", category: "advanced"}
    
    # outputs
  }
}
