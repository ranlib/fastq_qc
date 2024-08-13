version 1.0

task task_recentrifuge {
    input {
        String docker_image
        String input_file
        String output_file
        String generic_format
        String output_type
        String scoring
        Int controls_number
        Int number_y
        Int taxid_x
        Int taxid_i
        Int number_z
        Int int_w
        String summary_behavior
    }

    command {
        rcf \
        --format ${generic_format} \
        -f ${input_file} \
        -o ${output_file} \
        -e ${output_type} \
        -s ${scoring} \
        -c ${controls_number} \
        -y ${number_y} \
        -x ${taxid_x} \
        -i ${taxid_i} \
        -z ${number_z} \
        -w ${int_w} \
        -u ${summary_behavior}
    }

    output {
        File output_file = "${output_file}"
    }

    runtime {
        docker: docker_image
        memory: "4G"
        cpu: 2
    }
}
