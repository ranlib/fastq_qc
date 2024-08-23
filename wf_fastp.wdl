version 1.0

import "./task_fastp.wdl" as task_fastp

workflow wf_fastp {
  input {
    File read1
    File read2
    File? adapter_fasta
    String samplename
  }
  
  call task_fastp.task_fastp {
    input:
    samplename = samplename,
    read1 = read1,
    read2 = read2,
    adapter_fasta = adapter_fasta
  }
  
  output {
    File read1_trimmed = task_fastp.read1_trimmed
    File read2_trimmed = task_fastp.read2_trimmed
    File read1_unpaired = task_fastp.unpaired1_file
    File read2_unpaired = task_fastp.unpaired2_file
    File log_file = task_fastp.log_file
    File html_file = task_fastp.html_file
    File json_file = task_fastp.json_file
  }
}
