version 1.0

task task_seqkit_stats {
    input {
      Array[File]+ input_files
      String samplename
      String seq_type = "auto"  # Default sequence type
      String memory = "4GB"
      String docker = "dbest/seqkit:v2.8.2"
      Int threads = 4  # Number of threads
      Boolean tabular = true  # Output in machine-friendly tabular format
      Boolean basename = true
    }

    String out_file = samplename + ".stats"
    
    command {
      seqkit stats \
      --all \
      --threads ~{threads} \
      --out-file ~{out_file} \
      --seq-type ~{seq_type} \
      ~{if tabular then "--tabular" else ""} \
      ~{if basename then "--basename" else ""} \
      ~{sep=" " input_files}
    }

    output {
        File stats_output = out_file
    }

    runtime {
        docker: docker
        memory: memory
        cpu: threads
    }
}
