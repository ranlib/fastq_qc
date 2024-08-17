version 1.0

import "./task_extract_kraken_reads.wdl" as extract_reads
import "./task_filter_bracken_output.wdl" as filter_bracken

workflow wf_krakentools {
  input {
    # kraken
    File kraken_file
    File read1
    File read2
    Array[Int] taxid
    String read1_out
    String read2_out
    Boolean exclude

    # bracken
    File bracken_file
    Array[Int] taxid_exclude
    Array[Int] taxid_include
    String bracken_file_filtered
  }

  call extract_reads.task_extract_kraken_reads {
    input:
    kraken_file = kraken_file,
    taxid = taxid,
    read1 = read1,
    read2 = read2,
    read1_out = read1_out,
    read2_out = read2_out,
    exclude = exclude
  }

  call filter_bracken.task_filter_bracken_output {
    input:
    bracken_file = bracken_file,
    taxid_exclude = taxid_exclude,
    taxid_include = taxid_include,
    bracken_file_filtered = bracken_file_filtered
  }
  
  output {
    File read1_output = task_extract_kraken_reads.read1_output
    File read2_output = task_extract_kraken_reads.read2_output
    File bracken_filtered = task_filter_bracken_output.output_file
  }

}
