version 1.0

task task_bbduk {
  input {
    File read1
    File read2
    File contamination # fasta
    String samplename
    String docker = "staphb/bbtools:39.01"
    String memory = "8GB"
    Int threads = 1
    Int disk_size = 100
    Int number_of_retries = 1
  }

  String java_mem = "-Xmx" + sub(memory,"GB","g")

  command <<<
    set -ex
    bbduk.sh ~{java_mem} threads=~{threads} \
    in1=~{read1} \
    in2=~{read2} \
    out1=~{samplename}_clean_1.fastq.gz \
    out2=~{samplename}_clean_2.fastq.gz \
    outm=~{samplename}_matched.fastq.gz \
    stats=~{samplename}.stats.txt \
    ref=~{contamination} \
    k=31 hdist=1
  >>>

  output {
    File read1_clean = "${samplename}_clean_1.fastq.gz"
    File read2_clean = "${samplename}_clean_2.fastq.gz"
    File reads_match = "${samplename}_matched.fastq.gz"
    File stats = "${samplename}.stats.txt"
  }

  runtime {
    docker: docker
    memory: memory
    cpu: threads
    disks: "local-disk " + disk_size + " SSD"
    maxRetries: number_of_retries
    preemptible: 0
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Decontamination with bbduk"
  }

  parameter_meta {
    ## inputs
    read1: {description: "fastq file with forward reads.", category: "required"}
    read2: {description: "fastq file with reverse reads.", category: "required"}
    contamination: {description: "Input gzipped tar file with fasta files of reference genomes for species considered contaminants.", category: "optional"}

    ## outputs
    read1_clean: {description: "Cleaned output fastq file for forward reads."}
    read2_clean: {description: "Cleaned output fastq file for reverse reads."}
  }
}
