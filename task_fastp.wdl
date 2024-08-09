version 1.0

task task_fastp {
  input {
    File read1
    File read2
    String out1
    String out2
    String html_report
    String json_report
    String sample_name
    String log
    
    String memory = "12GB"
    String docker = "dbest/fastp:v0.23.4"
    Int threads = 3
    
    File? adapter_fasta
    
    Boolean deduplication = false
    Boolean verbose = false
    Boolean overrepresentation_analysis = false
  }

  String unpaired1 = sample_name + "_unpaired_1.fastq.gz"
  String unpaired2 = sample_name + "_unpaired_2.fastq.gz"

  command <<<
    set -x
    
    if [ ! -z ~{adapter_fasta} ]
    then
    gunzip -c ~{adapter_fasta} > adapters.fa
    ADAPTERS="adapters.fa"
    else
    ADAPTERS=""
    fi
    
    fastp --in1 ~{read1} --in2 ~{read2} \
    --out1 ~{out1} \
    --out2 ~{out2} \
    --json ~{json_report} \
    --html ~{html_report} \
    --thread ~{threads} \
    --detect_adapter_for_pe \
    --unpaired1 ~{unpaired1} \
    --unpaired2 ~{unpaired2} \
    ~{true="--adapter_fasta" false="" defined(adapter_fasta)} "${ADAPTERS}" \
    ~{if verbose then '--verbose' else ''} \
    ~{if deduplication then '--dedup' else ''} \
    ~{if overrepresentation_analysis then '--overrepresentation_analysis' else ''} \
    2> ~{log}
  >>>
  
  output {
    File out1_file = "${out1}"
    File out2_file = "${out2}"
    File unpaired1_file = "${unpaired1}"
    File unpaired2_file = "${unpaired2}"
    File log_file = "${log}"
  }
  
  runtime {
    docker: docker
    memory: memory
    cpu: threads
  }
}

