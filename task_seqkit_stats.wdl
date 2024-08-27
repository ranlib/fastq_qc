version 1.0

task task_seqkit_stats {
    input {
      Array[File]+ input_files
      String seq_type = "auto"  # Default sequence type
      Int threads = 4  # Number of threads
      String out_file = "seqkit_stats.txt"  # Output file
      Boolean tabular = true  # Output in machine-friendly tabular format
      Boolean basename = true
    }

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
        docker: "dbest/seqkit:v2.8.2"
        memory: "2G"
        cpu: threads
    }
}
