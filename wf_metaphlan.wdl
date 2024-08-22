version 1.0
import "./task_metaphlan.wdl" as metaphlan

workflow wf_metaphlan {
  input {
    File read1
    File read2
    String samplename
    String input_type = "fastq"
    String output_file_name = "metaphlan_output.txt"
    String bowtie2db
    String bowtie2index
    String analysis_type = "rel_ab"
    Int nproc = 12
  }
  
  call metaphlan.task_metaphlan {
    input:
    read1 = read1,
    read2 = read2,
    input_type = input_type,
    samplename = samplename,
    output_file_name = output_file_name,
    bowtie2db = bowtie2db,
    bowtie2index = bowtie2index,
    analysis_type = analysis_type,
    nproc = nproc
  }
  
  output {
    File result = task_metaphlan.output_file
  }
}
