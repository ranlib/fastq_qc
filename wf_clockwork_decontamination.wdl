version 1.0

import "./task_clockwork_decontamination.wdl"  as cd

workflow wf_clockwork_decontamination {
  input {
    String sample_name
    File metadata_file
    File reference
    File input_reads_1
    File input_reads_2
    String output_bam = sample_name + "_clockwork_decontamination.bam"
    String output_file = sample_name + "_clockwork_decontamination.stats"
    String output_reads_1 = sample_name + "_clockwork_cleaned_1.fq.gz"
    String output_reads_2 = sample_name + "_clockwork_cleaned_2.fq.gz"
    Int threads = 1
  }

  call cd.map_reads {
    input:
    sample_name = sample_name,
    output_bam = output_bam,
    reference = reference,
    input_reads_1 = input_reads_1,
    input_reads_2 = input_reads_2,
    threads = threads
  }

  call cd.remove_contam {
    input:
    metadata_file = metadata_file,
    input_bam = map_reads.bam_file,
    output_file = output_file,
    output_reads_1 = output_reads_1,
    output_reads_2 = output_reads_2
  }

  output {
    File stats = remove_contam.removed_contam_file
    File clean_reads_1 = remove_contam.cleaned_reads_1
    File clean_reads_2 = remove_contam.cleaned_reads_2
  }

  meta {
    author: "Dieter Best"
    email: "Dieter.Best@cdph.ca.gov"
    description: "## clockwork decontamination workflow \n This is from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork."
  }
  
  parameter_meta {
 
    input_reads_1: {
      description: "fastq file with forward reads.",
      category: "required"
    }
    input_reads_2: {
      description: "fastq file with reverse reads.",
      category: "required"
    }
    reference: {
      description: "Multi-fasta file of sequences that could be contaminants.",
      category: "required"
    }
    sample_name: {
      description: "Name of the sample.",
      category: "required"
    }
    metadata_file: {
      description: "tsv file with information about contaminants to check against, for example: \n https://raw.githubusercontent.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS/master/tools/clockwork-0.11.3/OUT/remove_contam_metadata.tsv",
      category: "required"
    }
    output_bam: {
      description: "Name for output alignement file of alignment procedure, aligner is minimap2.",
      category: "optional"
    }
    output_file: {
      description: "Name for file with decontamination statistics.",
      category: "optional"
    }
    output_reads_1: {
      description: "Name of cleaned output fastq file for forward reads.",
      category: "optional"
    }
    output_reads_2: {
      description: "Name of cleaned output fastq file for reverse reads.",
      category: "optional"
    }
    # output
    stats: {description: "Output file for decontamination statistics."}
    clean_reads_1: {description: "Cleaned output fastq file for forward reads."}
    clean_reads_2: {description: "Cleaned output fastq file for reverse reads."}
  }

}
