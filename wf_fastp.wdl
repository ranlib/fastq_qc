version 1.0

import "./task_fastp.wdl" as task_fastp

workflow wf_fastp {
  input {
    File read1
    File read2
    String read1_trimmed
    String read2_trimmed
    String json_report
    String html_report
  }
  
  call task_fastp.task_fastp {
    input:
    read1 = read1,
    read2 = read2,
    out1 = read1_trimmed,
    out2 = read2_trimmed,
    json_report = json_report,
    html_report = html_report
  }
  
  output {
    File read1_clean = task_fastp.out1_file
    File read2_clean = task_fastp.out2_file
  }
}
