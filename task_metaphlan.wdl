version 1.0

task task_metaphlan {
    input {
      File read1
      File read2

      String sample_name
      String output_file_name
      String bowtie2db
      String bowtie2index

      String input_type = "fastq"
      String analysis_type = "rel_ab"
      String docker = "biobakery/metaphlan:latest"
      String memory = "12GB"
      String taxonomic_level = "a"
      
      Int nproc = 12
    }

    command {
      set -x
      metaphlan \
      --tax_lev ~{taxonomic_level} \
      --input_type ~{input_type} \
      --nproc ~{nproc} \
      --bowtie2db ~{bowtie2db} \
      --index ~{bowtie2index} \
      --sample_id ~{sample_name} \
      -t ~{analysis_type} \
      -o ~{output_file_name} \
      ~{read1},~{read2}
    }

    output {
        File output_file = "~{output_file_name}"
    }

    runtime {
        docker: docker
        memory: memory
        cpu: nproc
    }
}
