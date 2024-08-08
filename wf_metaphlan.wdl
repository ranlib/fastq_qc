version 1.0
import "./task_metaphlan.wdl" as task_metaphlan

workflow wf_metaphlan {
  input {
    File read1
    File read2
    String sample_name
    String input_type = "fastq"
    String output_file_name = "metaphlan_output.txt"
    String bowtie2db = "/path/to/bowtie2db"
    String analysis_type = "rel_ab"
    Int nproc = 12
  }
  
  call task_metaphlan.task_metaphlan {
    input:
    read1 = read1,
    read2 = read2,
    input_type = input_type,
    sample_name = sample_name,
    output_file_name = output_file_name,
    bowtie2db = bowtie2db,
    analysis_type = analysis_type,
    nproc = nproc
  }
  
  output {
    File result = task_metaphlan.output_file
  }
}
