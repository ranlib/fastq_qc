version 1.0

import "./task_fastp.wdl" as task_fastp

workflow wf_fastp {
  input {
    File read1
    File read2
    File? adapter_fasta
    String read1_trimmed
    String read2_trimmed
    String json_report
    String html_report
    String sample_name
    String log
  }
  
  call task_fastp.task_fastp {
    input:
    sample_name = sample_name,
    read1 = read1,
    read2 = read2,
    adapter_fasta = adapter_fasta,
    out1 = read1_trimmed,
    out2 = read2_trimmed,
    json_report = json_report,
    html_report = html_report,
    log = log
  }
  
  output {
    File read1_clean = task_fastp.out1_file
    File read2_clean = task_fastp.out2_file
    File read1_unpaired = task_fastp.unpaired1_file
    File read2_unpaired = task_fastp.unpaired2_file
    File log_file = task_fastp.log_file
  }
}
