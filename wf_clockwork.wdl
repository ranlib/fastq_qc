version 1.0

task map_reads {
  input {
    String sample_name
    File reference
    File input_read_1
    File input_read_2
    String output_bam
  }

  command {
    clockwork map_reads --unsorted_sam ${sample_name} ${reference} ${output_bam} ${input_read_1} ${input_read_2}
  }
  
  output {
    File bam_file = output_bam
  }
  
  runtime {
    docker: "dbest/clockwork:v1.0.0"
  }
}

task remove_contam {
  input {
    File metadata_file
    File input_bam
    String output_file
    String output_read_1
    String output_read_2
  }

  command {
    clockwork remove_contam ${metadata_file} ${input_bam} ${output_file} ${output_read_1} ${output_read_2}
  }

  output {
    File removed_contam_file = output_file
    File cleaned_read_1 = output_read_1
    File cleaned_read_2 = output_read_2
  }

  runtime {
    docker: "dbest/clockwork:v1.0.0"
  }
}

workflow clockwork_workflow {
  input {
    String sample_name
    File metadata_file
    File reference
    File input_read_1
    File input_read_2
    String output_bam
    String output_file
    String output_read_1
    String output_read_2
  }
  
  call map_reads {
    input:
      sample_name = sample_name,
      output_bam = output_bam,
      reference = reference,
      input_read_1 = input_read_1,
      input_read_2 = input_read_2
  }

  call remove_contam {
    input:
    metadata_file = metadata_file,
    input_bam = map_reads.bam_file,
    output_file = output_file,
    output_read_1 = output_read_1,
    output_read_2 = output_read_2
  }

  output {
    File stats = remove_contam.removed_contam_file
    File clean_reads_1 = remove_contam.cleaned_read_1
    File clean_reads_2 = remove_contam.cleaned_read_2
  }

}
