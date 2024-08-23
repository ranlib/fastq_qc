version 1.0

task task_metaphlan {
  input {
    File read1
    File read2
    
    String samplename
    String bowtie2db
    String bowtie2index
    
    String input_type = "fastq"
    String analysis_type = "rel_ab"
    String docker = "dbest/metaphlan:v4.1.1"
    String memory = "12GB"
    String taxonomic_level = "a"
    String stat = "tavg_g"
    
    Int minimum_read_length = 70 # default
    Int? number_of_reads_used
    Int threads = 12
  }
  
  String bowtie2out_file_name = samplename + ".bowtie2out"
  String output_file_name = samplename + ".metaphlan.report"
    
  command <<<
    set -x
    metaphlan \
    -t ~{analysis_type} \
    ~{if defined(number_of_reads_used) then "--subsampling_paired" else "" } ~{number_of_reads_used} \
    --read_min_len ~{minimum_read_length} \
    --tax_lev ~{taxonomic_level} \
    --input_type ~{input_type} \
    --nproc ~{threads} \
    --stat ~{stat} \
    --bowtie2db ~{bowtie2db} \
    --index ~{bowtie2index} \
    --sample_id ~{samplename} \
    --bowtie2out ~{bowtie2out_file_name} \
    --output_file ~{output_file_name} \
    -1 ~{read1} -2 ~{read2}
  >>>

  output {
      File output_file = output_file_name
  }

  runtime {
      docker: docker
      memory: memory
      cpu: threads
  }

  meta {
    description: "run metaphlan"
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
  
