version 1.0

import "./task_cutadapt.wdl" as cutadapt

workflow wf_cutadapt {
    input {
      String adapt1         # Adapter for read 1
      String adapt2         # Adapter for read 2
      String? cutadapt_options       # Optional cutadapt parameters
      String samplename     # Prefix for output file names
      File read1            # Input FASTQ file 1
      File read2            # Input FASTQ file 2
    }

    call cutadapt.task_cutadapt {
        input:
            adapt1 = adapt1,
            adapt2 = adapt2,
            read1 = read1,
            read2 = read2,
            samplename = samplename,
            cutadapt_options = cutadapt_options
    }

    output {
      File trimmed_1 = task_cutadapt.output_read1
      File trimmed_2 = task_cutadapt.output_read2
      File log = task_cutadapt.output_log
    }

    meta {
        author: "Dieter Best"
        description: "WDL workflow to run cutadapt and trim paired-end reads"
    }
}
