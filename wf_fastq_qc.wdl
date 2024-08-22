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
    String read1_trimmed
    String read2_trimmed
    String json_report
    String html_report
    String samplename
    String log

    # kraken2
    #File read1
    #File read2
    File database
    #String samplename
    Int disk_size= 100
    Int disk_multiplier = 20
    Int threads = 1
    String memory = "250GB"
    # bracken
    Int read_length = 150
    Int threshold = 10
    
    # kraken filter
    #File kraken_file
    #File read1
    #File read2
    Array[Int] taxid
    String read1_out
    String read2_out
    Boolean exclude

    # bracken filter
    #File bracken_file
    Array[Int] taxid_exclude
    Array[Int] taxid_include
    String bracken_file_filtered

    # centrifuge
    Array[File]+ indexFiles

    # recentrifuge
    File nodes_dump
    File names_dump
    String format
    String outprefix
    String output_type
    Int controls_number

    # metaphlan
    String input_type = "fastq"
    String output_file_name = "metaphlan_output.txt"
    String bowtie2db
    String bowtie2index
    String analysis_type = "rel_ab"
  }

  call fastp.task_fastp {
    input:
    samplename = samplename,
    read1 = read1,
    read2 = read2,
    adapter_fasta = adapter_fasta,
    out1 = read1_trimmed,
    out2 = read2_trimmed,
    json_report = json_report,
    html_report = html_report,
    log = log,
    threads = threads
  }

  call kraken.wf_kraken2 {
    input:
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read2_trimmed,
    database = database,
    samplename = samplename,
    disk_size = disk_size,
    disk_multiplier =  disk_multiplier,
    threads = threads,
    memory = memory,
    read_length = read_length,
    threshold = threshold
  }

  call extract_reads.task_extract_kraken_reads {
    input:
    kraken_file = wf_kraken2.krakenReport,
    taxid = taxid,
    read1 = read1,
    read2 = read2,
    read1_out = read1_out,
    read2_out = read2_out,
    exclude = exclude
  }

  call filter_bracken.task_filter_bracken_output {
    input:
    bracken_file = wf_kraken2.brackenReport[5],
    taxid_exclude = taxid_exclude,
    taxid_include = taxid_include,
    bracken_file_filtered = bracken_file_filtered
  }
  
  call centrifuge.wf_centrifuge {
    input:
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read1_trimmed,
    samplename = samplename,
    threads = threads,
    indexFiles = indexFiles,
    memory = memory,
    disk_size = disk_size,
    disk_multiplier = disk_multiplier
  }

  call recentrifuge.task_recentrifuge {
    input:
    input_file = wf_centrifuge.classificationTSV,
    outprefix = outprefix,
    format = format,
    nodes_dump = nodes_dump,
    names_dump = names_dump,
    output_type = output_type,
    controls_number = controls_number
  }
  
  call metaphlan.task_metaphlan {
    input:
    read1 = task_fastp.read1_trimmed,
    read2 = task_fastp.read2_trimmed,
    input_type = input_type,
    samplename = samplename,
    output_file_name = output_file_name,
    bowtie2db = bowtie2db,
    bowtie2index = bowtie2index,
    analysis_type = analysis_type,
    nproc = threads
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

    # metaphlan
    File metaphlan_report = task_metaphlan.output_file
    
    # multiqc
    File? multiqc_report = task_multiqc.report
  }

}
