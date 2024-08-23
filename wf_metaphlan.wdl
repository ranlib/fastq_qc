version 1.0
import "./task_metaphlan.wdl" as metaphlan

workflow wf_metaphlan {
  input {
    File read1
    File read2
    String samplename
    String bowtie2db
    String bowtie2index
  }
  
  call metaphlan.task_metaphlan {
    input:
    read1 = read1,
    read2 = read2,
    samplename = samplename,
    bowtie2db = bowtie2db,
    bowtie2index = bowtie2index
  }
  
  output {
    File result = task_metaphlan.output_file
  }
}
