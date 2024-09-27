version 1.0

import "./task_kreport.wdl" as kreport

workflow wf_kreport {
  input {
    File classificationTSV
    Array[File]+ indexFiles
    String samplename
    String docker = "dbest/centrifuge:v1.0.4.1"
    String memory = "20GB"
    Int disk_size = 100
  }

  call kreport.task_kreport {
    input:
      classificationTSV = classificationTSV,
      indexFiles = indexFiles,
      samplename = samplename,
      docker = docker,
      memory = memory,
      disk_size = disk_size
  }

  output {
    File? krakenStyleTSV = task_kreport.krakenStyleTSV
    File krakenStyleErr = task_kreport.krakenStyleErr
  }
}
