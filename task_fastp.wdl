version 1.0

task task_fastp {
  input {
    File read1
    File read2
    String out1
    String out2
    String html_report
    String json_report
    String memory = "12GB"
    String docker = "dbest/fastp:v0.23.4"
    Int threads = 3
  }
  
  command {
    fastp --in1 ${read1} --in2 ${read2} --out1 ${out1} --out2 ${out2} --json ${json_report} --html ${html_report} --thread ${threads}
  }
  
  output {
    File out1_file = "${out1}"
    File out2_file = "${out2}"
  }
  
  runtime {
    docker: docker
    memory: memory
    cpu: "${threads}"
  }
}

