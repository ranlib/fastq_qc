version 1.0

import "./task_seqkit_stats.wdl" as stats

workflow SeqKitWorkflow {
    input {
      Array[File]+ input_files
      String seq_type = "auto"
      Int threads = 4
      String out_file = "seqkit_stats.txt"
      Boolean tabular = true
      Boolean basename = true
    }

    call stats.task_seqkit_stats {
      input:
      input_files = input_files,
      seq_type = seq_type,
      threads = threads,
      out_file = out_file,
      tabular = tabular,
      basename = basename
    }

    output {
        File stats_output = task_seqkit_stats.stats_output
    }
}
