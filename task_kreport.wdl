version 1.0

#
# Task to generate a Kraken-style report from Centrifuge classification results.
#

task task_kreport {
  input {
    File classificationTSV
    Array[File]+ indexFiles
    String samplename
    String docker = "dbest/centrifuge:v1.0.4.1"
    String memory = "20GB"
    Int disk_size = 100
  }

  command <<<
    set -x
    indexBasename="$(basename ~{sub(indexFiles[0], '\.[0-9]\.cf', '')})"
    for file in ~{sep=" " indexFiles}
    do
       ln -s "${file}" "${PWD}/$(basename ${file})"
    done
    NLINES=$(wc -l < ~{classificationTSV})
    if [ -s ~{classificationTSV} ] && [ "${NLINES}" -gt 1 ]
    then
    centrifuge-kreport -x "${PWD}/${indexBasename}" ~{classificationTSV} 2> ~{samplename}.centrifuge.classification.kraken_style.err 1> ~{samplename}.centrifuge.classification.kraken_style.tsv
    else
    echo "ClassificationTSV file does not exist or is empty" > ~{samplename}.centrifuge.classification.kraken_style.err
    fi
  >>>

  output {
    File? krakenStyleTSV = "${samplename}.centrifuge.classification.kraken_style.tsv"
    File krakenStyleErr = "${samplename}.centrifuge.classification.kraken_style.err"
  }

  runtime {
    docker: docker
    memory: memory
    disks: "local-disk " + disk_size + " SSD"
  }
  
  meta {
    author: "Dieter Best"
    email: "dieter.best@cdph.ca.gov"
    description: "Wdl task to generate a Kraken-style report from Centrifuge classification results."
  }

  parameter_meta {
    # inputs
    classificationTSV: {
      description:  "The TSV file containing Centrifuge classification results."
    }
    indexFiles: {
      description: "Array of index files used by Centrifuge for classification."
    }
    samplename: {
      description:"The name of the sample being processed, used to generate output filenames."
    }
    docker: {
      description: "Docker image to be used for running the task. Default is dbest/centrifuge:v1.0.4.1."
    }
    memory: {
      description: "Memory allocation for the task. Default is 20GB."
    }
    disk_size: {
      description: "Disk size allocation for the task in GB. Default is 100GB."
    }

    # outputs
    krakenStyleTSV: {
      description: "The output file in Kraken-style TSV format."
    }
    krakenStyleErr: {
      description: "The error log file generated during processing."
    }
  }
}
