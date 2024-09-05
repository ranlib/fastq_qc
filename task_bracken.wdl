version 1.0

task task_bracken {
    input {
      File kraken_report
      File database
      String docker = "staphb/bracken:2.9"
      String memory = "250GB"
      String samplename
      String level
      Int disk_size = 100
      Int read_length = 250
      Int threshold = 0
    }

    command <<<
      set -x
      mkdir -p "${PWD}/kraken"
      tar -C "${PWD}/kraken" -xvf ~{database}
      if [ -s ~{kraken_report} ]
      then
      N=$(cat ~{kraken_report} | awk 'BEGIN{s=0}{if($6 == '\"~{level}\"') s++}END{print s}')
      if [ $N -gt 0 ]
      then
      bracken -d "${PWD}/kraken" \
      -i ~{kraken_report} \
      -o ~{samplename}.~{level}.bracken.report \
      -r ~{read_length} \
      -l ~{level} \
      -t ~{threshold} 2> ~{samplename}.~{level}.bracken.err
      else
      touch ~{samplename}.~{level}.bracken.report
      echo "Number or lines in input file is $N" >> ~{samplename}.~{level}.bracken.err
      fi
      else
      touch ~{samplename}.~{level}.bracken.report
      echo "Number or lines in input file is $N" >> ~{samplename}.~{level}.bracken.err
      fi
    >>>

    output {
      File bracken_report = "${samplename}.${level}.bracken.report"
      File bracken_error = "${samplename}.${level}.bracken.err"
    }
    
    runtime {
      docker: docker
      memory: memory
      disks: "local-disk " + disk_size + " SSD"
    }
}

