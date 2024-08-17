version 1.0

task task_extract_kraken_reads {
  input {
    File kraken_file
    File read1
    File read2
    Array[Int] taxid
    String read1_out
    String read2_out
    String docker = "dbest/krakentools:v1.2"
    String memory = "10GB"
    String disk_size = "100"
    Boolean exclude = false
  }

  command <<<
    set -ex 

    extract_kraken_reads.py \
    -k  ~{kraken_file} \
    -t  ~{sep=" " taxid} \
    -s  ~{read1} \
    -s2 ~{read2} \
    -o  ~{read1_out} \
    -o2 ~{read2_out} \
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

}
