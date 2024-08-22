version 1.0

task task_kraken2 {
  input {
    File read1
    File read2
    File database
    String samplename
    String docker = "staphb/kraken2:2.1.3"
    String memory = "250GB"
    Int disk_size = 100
    Int threads = 1
    Int minimum_base_quality = 20
  }

  command <<<
    set -x
    mkdir -p "${PWD}/kraken"
    tar -C "${PWD}/kraken" -xvf ~{database}
    kraken2 \
    --db "${PWD}/kraken" \
    --threads ~{threads} \
    --output ~{samplename}.kraken.output \
    --report ~{samplename}.kraken.report \
    --unclassified-out ~{samplename}.unclassified#.fastq \
    --classified-out ~{samplename}.classified#.fastq \
    --minimum-base-quality ~{minimum_base_quality} \
    --minimum-hit-groups 3 \
    --report-minimizer-data \
    --gzip-compressed \
    --paired \
    ~{read1} ~{read2}

    gzip ~{samplename}.unclassified*.fastq ~{samplename}.classified*.fastq
  >>>

  output {
    File krakenReport = "${samplename}.kraken.report"
    File krakenOutput = "${samplename}.kraken.output"
    Array[File] unclassified = glob("${samplename}.unclassified*")
    Array[File] classified = glob("${samplename}.classified*")
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }

    meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "Run kraken2 taxonomy analysis on input fastq files"
  }

  parameter_meta {
    # inputs
    read1: {description: "Fastq file with forward reads.", category: "required"}
    read2: {description: "Fastq file with reverse reads.", category: "required"}
    samplename: {description: "Name of sample.", category: "required"}
    database: {description: "Input gzipped tak file with kraken2 databases.", category: "required"}
    disk_size: {description: "Disk size in GB needed for this job", category: "advanced"}
    threads: {description: "The number of threads to be used.", category: "advanced"}
    memory: {description: "The amount of memory available to the job.", category: "advanced"}
    docker: {description: "The docker image used for this task. Changing this may result in errors which the developers may choose not to address.", category: "advanced"}
    
    # outputs
    krakenReport: {description: "File with classification summary."}
    krakenOutput: {description: "File with classification of input reads."}
  }

}

