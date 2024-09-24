version 1.0

import "./task_cutadapt.wdl" as cutadapt

workflow wf_cutadapt {
    input {
        String adapt1         # Adapter for read 1
        String adapt2         # Adapter for read 2
        File in1_fastq        # Input FASTQ file 1
        File in2_fastq        # Input FASTQ file 2
        String output_prefix  # Prefix for output file names
        String docker_image   # Docker image for cutadapt
        String? options       # Optional cutadapt parameters
    }

    call cutadapt.task_cutadapt {
        input:
            adapt1 = adapt1,
            adapt2 = adapt2,
            in1_fastq = in1_fastq,
            in2_fastq = in2_fastq,
            output_prefix = output_prefix,
            docker_image = docker_image,
            options = options
    }

    output {
        File trimmed_out1 = task_cutadapt.out1_fastq
        File trimmed_out2 = task_cutadapt.out2_fastq
    }

    meta {
        author: "Dieter Best"
        description: "WDL workflow to run cutadapt and trim paired-end reads"
    }
}
