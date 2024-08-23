version 1.0

import "./task_fastp.wdl" as fastp
import "./wf_kraken2.wdl" as kraken
import "./task_extract_kraken_reads.wdl" as extract_reads
import "./task_filter_bracken_output.wdl" as filter_bracken
import "./wf_centrifuge.wdl" as centrifuge
import "./task_recentrifuge.wdl" as recentrifuge
import "./task_metaphlan.wdl" as metaphlan
import "./task_multiqc.wdl" as multiqc

workflow wf_fastq_qc {
  input {
    # fastp
    File read1
    File read2
    File? adapter_fasta
    String samplename

    # kraken2
    File database

    # centrifuge
    Array[File]+ indexFiles

    # recentrifuge
    File nodes_dump
    File names_dump

    # metaphlan
    Boolean run_metaphlan = false
    String bowtie2db
    String bowtie2index
  }

  call fastp.task_fastp {
    input:
    samplename = samplename,
    read1 = read1,
    read2 = read2,
    adapter_fasta = adapter_fasta
  }

  call kraken.wf_kraken2 {
    input:
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read2_trimmed,
    database = database,
    samplename = samplename
  }

  call extract_reads.task_extract_kraken_reads {
    input:
    kraken_file = wf_kraken2.krakenReport,
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read2_trimmed,
    samplename = samplename
  }

  call filter_bracken.task_filter_bracken_output {
    input:
    bracken_file = wf_kraken2.brackenReport[5],
    samplename = samplename
  }
  
  call centrifuge.wf_centrifuge {
    input:
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read1_trimmed,
    samplename = samplename,
    indexFiles = indexFiles
  }

  call recentrifuge.task_recentrifuge {
    input:
    input_file = wf_centrifuge.classificationTSV,
    nodes_dump = nodes_dump,
    names_dump = names_dump,
    input_type = "centrifuge",
    outprefix = samplename
  }

  call recentrifuge.task_recentrifuge as kraken_recentrifuge {
    input:
    input_file = wf_kraken2.krakenOutput,
    nodes_dump = nodes_dump,
    names_dump = names_dump,
    input_type = "kraken2",
    outprefix = samplename
  }

  if ( run_metaphlan ) {
    call metaphlan.task_metaphlan {
      input:
      read1 = task_fastp.read1_trimmed,
      read2 = task_fastp.read2_trimmed,
      samplename = samplename,
      bowtie2db = bowtie2db,
      bowtie2index = bowtie2index
    }
  }
  
  #Array[File] allReports = [ task_fastp.json_file, wf_centrifuge.krakenStyleTSV, wf_kraken2.krakenReport, wf_kraken2.bracken_report_S ]
  Array[File] allReports = [ task_fastp.json_file, wf_kraken2.krakenReport ]
  if ( length(allReports) > 0 ) {
    call multiqc.task_multiqc {
      input:
      inputFiles = allReports,
      outputPrefix = samplename
    }
  }

  output {
    # fastp
    File read1_clean = task_fastp.read1_trimmed
    File read2_clean = task_fastp.read2_trimmed
    File read1_unpaired = task_fastp.unpaired1_file
    File read2_unpaired = task_fastp.unpaired2_file
    File log_file = task_fastp.log_file
    File html_file = task_fastp.html_file
    File json_file = task_fastp.json_file
    
    # kraken2
    File krakenReport = wf_kraken2.krakenReport
    File krakenOutput = wf_kraken2.krakenOutput
    Array[File] brackenReport = wf_kraken2.brackenReport
    Array[File] unclassified = wf_kraken2.unclassified
    Array[File] classified = wf_kraken2.classified

    # kraken filter
    File read1_output = task_extract_kraken_reads.read1_output
    File read2_output = task_extract_kraken_reads.read2_output
    # bracken filter
    File bracken_filtered = task_filter_bracken_output.output_file
    
    # centrifuge
    File classificationTSV = wf_centrifuge.classificationTSV
    File summaryReportTSV = wf_centrifuge.summaryReportTSV
    File krakenStyleTSV = wf_centrifuge.krakenStyleTSV

    # recentrifuge
    Array[File] rcf_output = task_recentrifuge.outputs
    Array[File] rcf_output_kraken = kraken_recentrifuge.outputs

    # metaphlan
    File? metaphlan_report = task_metaphlan.output_file
    
    # multiqc
    File? multiqc_report = task_multiqc.report
  }

}
