version 1.0

import "./task_recentrifuge.wdl" as recentrifuge

workflow wf_recentrifuge {
    input {
        String docker_image
        String input_file
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

    call recentrifuge.task_recentrifuge {
        input:
            docker_image = docker_image,
            input_file = input_file,
            output_file = "rcf_output.txt",
            generic_format = generic_format,
            output_type = output_type,
            scoring = scoring,
            controls_number = controls_number,
            number_y = number_y,
            taxid_x = taxid_x,
            taxid_i = taxid_i,
            number_z = number_z,
            int_w = int_w,
            summary_behavior = summary_behavior
    }

    output {
        File rcf_output = task_recentrifuge.output_file
    }
}
