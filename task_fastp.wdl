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
    Int poly_x_min_len = 10
    Int min_read_length = 50
    Int n_base_limit = 5
    Int average_qual = 10 # = 0 means no requirement
    Int cut_window_size = 4
    Int cut_mean_quality = 20
    Int low_complexity_threshold = 30 # 30% is the default
    
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
    --trim_poly_x \
    --poly_x_min_len ~{poly_x_min_len} \
    --length_required ~{min_read_length} \
    --n_base_limit ~{n_base_limit} \
    --low_complexity_filter \
    --complexity_threshold ~{low_complexity_threshold} \
    --average_qual ~{average_qual} \
    --cut_tail \
    --cut_window_size ~{cut_window_size} \
    --cut_mean_quality ~{cut_mean_quality} \
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

  meta {
    description: "run fastp"
  }
  
  parameter_meta {
    read1: {
      description: "fastq file with forward reads.",
      category: "required"
    }
    read2: {
      description: "fastq file with reverse reads.",
      category: "required"
    }
  }
  
}

