version 1.0

import "./task_extract_kraken_reads.wdl" as extract_reads
import "./task_filter_bracken_output.wdl" as filter_bracken

workflow wf_krakentools {
  input {
    # kraken
    File kraken_file
    File read1
    File read2

    String samplename
    
    # bracken
    File bracken_file
  }

  call extract_reads.task_extract_kraken_reads {
    input:
    kraken_file = kraken_file,
    samplename = samplename,
    read1 = read1,
    read2 = read2
  }

  call filter_bracken.task_filter_bracken_output {
    input:
    bracken_file = bracken_file,
    samplename = samplename
  }
  
  output {
    File read1_output = task_extract_kraken_reads.read1_output
    File read2_output = task_extract_kraken_reads.read2_output
    File bracken_filtered = task_filter_bracken_output.output_file
  }

}
