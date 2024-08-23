version 1.0

import "./task_recentrifuge.wdl" as recentrifuge

workflow wf_recentrifuge {
    input {
      File input_file
      File nodes_dump
      File names_dump

      String input_type
      String outprefix
    }
    
    call recentrifuge.task_recentrifuge {
      input:
      input_file = input_file,
      nodes_dump = nodes_dump,
      names_dump = names_dump,
      input_type = input_type,
      outprefix = outprefix
    }
    
    output {
        Array[File] rcf_output = task_recentrifuge.outputs
    }
}
