version 1.0

import "./task_seqkit_stats.wdl" as stats

workflow wf_seqkit_stats {
    input {
      Array[File]+ input_files
      String samplename
    }

    call stats.task_seqkit_stats {
      input:
      input_files = input_files,
      samplename = samplename
    }

    output {
        File stats_output = task_seqkit_stats.stats_output
    }
}
