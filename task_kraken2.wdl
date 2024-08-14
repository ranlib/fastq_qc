version 1.0

task task_kraken2 {
  input {
    File read1
    File read2
    File database
    String samplename
    String docker = "staphb/kraken2:2.1.3"
    String memory = "250GB"
    Int threads = 1
    Int disk_size= 100
    Int minimum_base_quality = 20
  }

  command <<<
    set -x
    mkdir -p ${PWD}/kraken
    tar -C ${PWD}/kraken -xvf ~{database}
    kraken2 \
    --db ${PWD}/kraken \
    --threads ~{threads} \
    --output ~{samplename}.kraken.output \
    --report ~{samplename}.kraken.report \
    --unclassified-out ~{samplename}.unclassified#.fastq \
    --classified-out ~{samplename}.classified#.fastq \
    --minimum-base-quality ~{minimum_base_quality} \
    --use-names \
    --gzip-compressed \
    --paired \
    ~{read1} ~{read2}
  >>>

  output {
    File? krakenReport = "${samplename}.kraken.report"
    File? krakenOutput = "${samplename}.kraken.output"
    Array[File] unclassified = glob("${samplename}.unclassified*")
    Array[File] classified = glob("${samplename}.classified*")
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }
}

