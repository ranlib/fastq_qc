version 1.0

task task_extract_kraken_reads {
  input {
    File kraken_file
    File read1
    File read2
    Array[Int] taxid # list of taxids to include or exclude
    String read1_out
    String read2_out
    String docker = "dbest/krakentools:v1.2"
    String memory = "10GB"
    Int disk_size = 100
    Boolean exclude = false
  }

  command <<<
    set -ex 

    extract_kraken_reads.py \
    -k  ~{kraken_file} \
    -s  ~{read1} \
    -s2 ~{read2} \
    --taxid   ~{sep=" " taxid} \
    --output  ~{read1_out} \
    --output2 ~{read2_out} \
    --noappend \
    --fastq-output \
    ~{if exclude then "--exclude" else ""}
    
    gzip ~{read1_out} ~{read2_out}
  >>>

  output {
    File read1_output = read1_out + ".gz"
    File read2_output = read2_out + ".gz"
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Filter out reads from input fastq file based on kraken2 classification"
  }
  
  parameter_meta {
    # inputs
    kraken_file: {description: "Classification result from kraken2.", category: "required"}
    read1: {description: "Input fastq file with forward reads.", category: "required"}
    read2: {description: "Input fastq file with reverse reads.", category: "required"}

    taxid: {description: "List of taxids to be included or excluded.", category: "optional"}

    memory: {description: "The amount of memory available to the job.", category: "advanced"}
    docker: {description: "The docker image used for this task. Changing this may result in errors which the developers may choose not to address.", category: "advanced"}

    
    # outputs
  }
}
