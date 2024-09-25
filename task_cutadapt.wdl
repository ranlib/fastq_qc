version 1.0

task task_cutadapt {
    input {
      String adapt1         # Adapter sequence for read 1
      String adapt2         # Adapter sequence for read 2
      File read1            # Input FASTQ file 1
      File read2            # Input FASTQ file 2
      String samplename     # Prefix for output file names
      String? cutadapt_options       # Optional cutadapt parameters (e.g., quality thresholds)
      String docker = "dbest/cutadapt:v4.4"        # Docker image with cutadapt installed
    }

    String trimmed_1 = "${samplename}_trimmed_1.fastq.gz"
    String trimmed_2 = "${samplename}_trimmed_2.fastq.gz"
    String log = "${samplename}_cutadapt.log"
    
    command {
      cutadapt \
      -a ~{adapt1} \
      -A ~{adapt2} \
      ~{cutadapt_options} \
      -o ~{trimmed_1} \
      -p ~{trimmed_2} \
      ~{read1} ~{read2} > ~{log}
    }

    output {
      File output_read1 = "${trimmed_1}"
      File output_read2 = "${trimmed_2}"
      File output_log = "${log}"
    }

    runtime {
        docker: docker
        cpu: 2
        memory: "4G"
    }

    meta {
        author: "Dieter Best"
        email: "dieter.best@cdph.ca.gov"
        description: "WDL task for running cutadapt to trim adapters from paired-end FASTQ files"
    }

    parameter_meta {
        adapt1: {
            description: "Adapter sequence for the first read"
        }
        adapt2: {
            description: "Adapter sequence for the second read"
        }
        read1: {
            description: "Input FASTQ file 1"
        }
        read2: {
            description: "Input FASTQ file 2"
        }
        samplename: {
            description: "Prefix for naming output files"
        }
        cutadapt_options: {
            description: "Optional cutadapt parameters"
        }
        docker: {
            description: "Docker image containing cutadapt"
        }
    }
}
