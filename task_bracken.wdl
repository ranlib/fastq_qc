version 1.0

task task_bracken {
    input {
      File kraken_report
      String docker = "staphb/bracken:2.9"
      String memory = "250GB"
      String samplename
      Int disk_size = 100
      Int read_length = 250
      Int threshold = 0
    }

    command <<<
      set -x
      if [ -s ~{kraken_report} ]
      then
          for alevel in P C O F G S S1
          do
              bracken -d "${PWD}/kraken" -i ~{kraken_report} -o ~{samplename}.${alevel}.bracken.report -r ~{read_length} -l ${alevel} -t ~{threshold}
          done
      else
          touch ~{samplename}.bracken.report
      fi
    >>>

    output {
      Array[File] bracken_report = glob("${samplename}.*.bracken.report")
    }
    
    runtime {
      docker: docker
      memory: memory
      disks: "local-disk " + disk_size + " SSD"
    }
}

