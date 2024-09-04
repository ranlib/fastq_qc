version 1.0

import "./task_bracken.wdl" as bracken

workflow wf_bracken {
  input {
    File kraken_report
    File database
    String samplename
  }

  Array[String] levels = ["P", "C", "O", "F", "G", "S", "S1"]
  
  scatter ( level in levels ) {
    call bracken.task_bracken {
      input:
      kraken_report = kraken_report,
      database = database,
      samplename = samplename,
      level = level
    }
  }
  
  output {
    Array[File] brackenReport = task_bracken.bracken_report
    Array[File] brackenError = task_bracken.bracken_error
  }
}
