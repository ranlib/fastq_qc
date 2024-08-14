version 1.0

import "./task_multiqc.wdl" as multiQC

workflow wf_multiqc {
  input {
    Array[File] inputFiles
    String outputPrefix
  }

  call multiQC.task_multiqc {
    input:
    inputFiles = inputFiles,
    outputPrefix = outputPrefix
  }

  output {
    File report = task_multiqc.report
  }

}
