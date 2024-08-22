version 1.0

import "./task_kraken2.wdl" as kraken
import "./task_bracken.wdl" as bracken

workflow wf_kraken2 {
  input {
    File read1
    File read2
    File database
    String samplename
    Int disk_size = 100
    String memory = "250GB"
    Int disk_multiplier = 20
    Int threads = 1
    # bracken
    Int read_length = 150
    Int threshold = 10
  }

  Int dynamic_disk_size = disk_multiplier*ceil(size(read1, "GiB"))
  Int disk_size_gb = select_first([disk_size, dynamic_disk_size])

  call kraken.task_kraken2 {
    input:
    read1 = read1,
    read2 = read2,
    samplename = samplename,
    threads = threads,
    memory = memory,
    database = database,
    disk_size = disk_size_gb
  }

  call bracken.task_bracken {
    input:
    kraken_report = task_kraken2.krakenReport,
    samplename = samplename,
    database = database,
    memory = memory,
    read_length = read_length,
    threshold = threshold,
    disk_size = disk_size_gb
  }

  output {
    File krakenReport = task_kraken2.krakenReport
    File krakenOutput = task_kraken2.krakenOutput
    File bracken_report_S = task_bracken.bracken_report_S
    Array[File] brackenReport = task_bracken.bracken_report
    Array[File] unclassified = task_kraken2.unclassified
    Array[File] classified = task_kraken2.classified
  }
}
