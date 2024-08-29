version 1.0

import "./task_fastqc.wdl" as fastqc
import "./task_seqkit_stats.wdl" as stats
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
    # fastqc
    File read1
    File read2
    Boolean run_fastqc_after_cleanup = true
    Int minNumberReads = 1

    # fastp
    File? adapter_fasta
    String samplename
    Boolean run_fastp = false
    
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

  call fastqc.task_fastqc {
    input:
    forwardReads = read1,
    reverseReads = read2
  }

  call stats.task_seqkit_stats {
    input:
    input_files = [read1, read2],
    samplename = samplename
  }

  Boolean filter = task_fastqc.numberForwardReads > minNumberReads
  if ( filter ) {
    
    if ( run_fastp ) {
      call fastp.task_fastp {
	input:
	samplename = samplename,
	read1 = read1,
	read2 = read2,
	adapter_fasta = adapter_fasta
      }
    }
    
    call kraken.wf_kraken2 {
      input:
      read1 = select_first([task_fastp.read1_trimmed, read1]),
      read2 = select_first([task_fastp.read2_trimmed, read2]),
      database = database,
      samplename = samplename
    }
    
    call extract_reads.task_extract_kraken_reads {
      input:
      kraken_file = wf_kraken2.krakenReport,
      read1 = select_first([task_fastp.read1_trimmed, read1]),
      read2 = select_first([task_fastp.read2_trimmed, read2]),
      samplename = samplename
    }
    
    call filter_bracken.task_filter_bracken_output {
      input:
      bracken_file = wf_kraken2.brackenReport[5],
      samplename = samplename
    }
    
    call centrifuge.wf_centrifuge {
      input:
      read1 = select_first([task_fastp.read1_trimmed, read1]),
      read2 = select_first([task_fastp.read2_trimmed, read2]),
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
	read1 = select_first([task_fastp.read1_trimmed, read1]),
	read2 = select_first([task_fastp.read2_trimmed, read2]),
	samplename = samplename,
	bowtie2db = bowtie2db,
	bowtie2index = bowtie2index
      }
    }
  }
  
  Array[File] allReports = select_all([
  task_fastqc.forwardData,
  task_fastqc.reverseData,
  task_fastp.json_file,
  wf_kraken2.krakenReport,
  wf_centrifuge.krakenStyleTSV
  ])
  if ( length(allReports) > 0 ) {
    call multiqc.task_multiqc {
      input:
      inputFiles = allReports,
      outputPrefix = samplename
    }
  }

  output {
    # output from fastqc
    File forwardHtml = task_fastqc.forwardHtml
    File reverseHtml = task_fastqc.reverseHtml
    File forwardZip = task_fastqc.forwardZip
    File reverseZip = task_fastqc.reverseZip
    File forwardSummary = task_fastqc.forwardSummary
    File reverseSummary = task_fastqc.reverseSummary
    File forwardData = task_fastqc.forwardData
    File reverseData = task_fastqc.reverseData

    # seqkit
    File stats_output = task_seqkit_stats.stats_output

    # fastp
    File? read1_clean = task_fastp.read1_trimmed
    File? read2_clean = task_fastp.read2_trimmed
    File? read1_unpaired = task_fastp.unpaired1_file
    File? read2_unpaired = task_fastp.unpaired2_file
    File? log_file = task_fastp.log_file
    File? html_file = task_fastp.html_file
    File? json_file = task_fastp.json_file
    
    # kraken2
    File? krakenReport = wf_kraken2.krakenReport
    File? krakenOutput = wf_kraken2.krakenOutput
    Array[File]? brackenReport = wf_kraken2.brackenReport
    Array[File]? unclassified = wf_kraken2.unclassified
    Array[File]? classified = wf_kraken2.classified

    # kraken filter
    File? read1_output = task_extract_kraken_reads.read1_output
    File? read2_output = task_extract_kraken_reads.read2_output
    # bracken filter
    File? bracken_filtered = task_filter_bracken_output.output_file
    
    # centrifuge
    File? classificationTSV = wf_centrifuge.classificationTSV
    File? summaryReportTSV = wf_centrifuge.summaryReportTSV
    File? krakenStyleTSV = wf_centrifuge.krakenStyleTSV

    # recentrifuge
    Array[File]? rcf_output = task_recentrifuge.outputs
    Array[File]? rcf_output_kraken = kraken_recentrifuge.outputs

    # metaphlan
    File? metaphlan_report = task_metaphlan.output_file
    
    # multiqc
    File? multiqc_report = task_multiqc.report
  }

}
