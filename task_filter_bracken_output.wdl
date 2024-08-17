version 1.0

task task_filter_bracken_output {
  input {
    File bracken_file
    Array[Int] taxid_exclude
    Array[Int] taxid_include
    String bracken_file_filtered
    String docker = "dbest/krakentools:v1.2"
    String memory = "10GB"
    String disk_size = "100"
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
}
