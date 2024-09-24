version 1.0

task task_cutadapt {
    input {
        String adapt1         # Adapter sequence for read 1
        String adapt2         # Adapter sequence for read 2
        File in1_fastq        # Input FASTQ file 1
        File in2_fastq        # Input FASTQ file 2
        String output_prefix  # Prefix for output file names
        String? options       # Optional cutadapt parameters (e.g., quality thresholds)
        String docker_image   # Docker image with cutadapt installed
    }

    command {
        cutadapt \
        -a ~{adapt1} \
        -A ~{adapt2} \
        ~{options} \
        -o ~{output_prefix}_out1.fastq \
        -p ~{output_prefix}_out2.fastq \
        ~{in1_fastq} ~{in2_fastq}
    }

    output {
        File out1_fastq = "${output_prefix}_out1.fastq"
        File out2_fastq = "${output_prefix}_out2.fastq"
    }

    runtime {
        docker: docker_image
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
        in1_fastq: {
            description: "Input FASTQ file 1"
        }
        in2_fastq: {
            description: "Input FASTQ file 2"
        }
        output_prefix: {
            description: "Prefix for naming output files"
        }
        options: {
            description: "Optional cutadapt parameters"
        }
        docker_image: {
            description: "Docker image containing cutadapt"
        }
    }
}
