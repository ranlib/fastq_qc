version 1.0

task task_recentrifuge {
    input {
      File input_file
      File nodes_dump
      File names_dump
      String docker_image = "dbest/recentrifuge:v1.14.1"
      String outprefix
      String format
      String output_type
      Int controls_number
    }

    command <<<
      set -x
      cp ~{nodes_dump} .
      cp ~{names_dump} . 
      rcf \
      -f ~{input_file} \
      --nodespath . \
      --format ~{format} \
      --extra ~{output_type} \
      --outprefix ~{outprefix} \
      --controls ~{controls_number}
    >>>

    output {
        Array[File] outputs = glob("${outprefix}*")
    }

    runtime {
        docker: docker_image
        memory: "4G"
        cpu: 2
    }
}
