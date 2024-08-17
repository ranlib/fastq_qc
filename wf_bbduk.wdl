version 1.0

import "./task_bbduk.wdl" as bbduk

workflow wf_bbduk {
  input {
    File forwardReads
    File reverseReads
    File contamination
    String samplename
    String memory = "6GB"
    Int disk_size = 100
    Int threads = 1
  }

  call bbduk.task_bbduk {
    input:
    read1 = forwardReads,
    read2 = reverseReads,
    contamination = contamination,
    samplename = samplename,
    disk_size = disk_size,	
    threads = threads,
    memory = memory
  }

  output {
    File read1_clean = task_bbduk.read1_clean
    File read2_clean = task_bbduk.read2_clean
    File reads_match = task_bbduk.reads_match
    File stats = task_bbduk.stats
  }

}
