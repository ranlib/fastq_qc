# wf_fastq_qc


## Inputs

### Required inputs
<p name="wf_fastq_qc.bracken_file_filtered">
        <b>wf_fastq_qc.bracken_file_filtered</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.controls_number">
        <b>wf_fastq_qc.controls_number</b><br />
        <i>Int &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.database">
        <b>wf_fastq_qc.database</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.exclude">
        <b>wf_fastq_qc.exclude</b><br />
        <i>Boolean &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.format">
        <b>wf_fastq_qc.format</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.html_report">
        <b>wf_fastq_qc.html_report</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.indexFiles">
        <b>wf_fastq_qc.indexFiles</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.json_report">
        <b>wf_fastq_qc.json_report</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.log">
        <b>wf_fastq_qc.log</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.names_dump">
        <b>wf_fastq_qc.names_dump</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.nodes_dump">
        <b>wf_fastq_qc.nodes_dump</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.outprefix">
        <b>wf_fastq_qc.outprefix</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.output_type">
        <b>wf_fastq_qc.output_type</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1">
        <b>wf_fastq_qc.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1_out">
        <b>wf_fastq_qc.read1_out</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1_trimmed">
        <b>wf_fastq_qc.read1_trimmed</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2">
        <b>wf_fastq_qc.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2_out">
        <b>wf_fastq_qc.read2_out</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2_trimmed">
        <b>wf_fastq_qc.read2_trimmed</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.samplename">
        <b>wf_fastq_qc.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.taxid">
        <b>wf_fastq_qc.taxid</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.taxid_exclude">
        <b>wf_fastq_qc.taxid_exclude</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.taxid_include">
        <b>wf_fastq_qc.taxid_include</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_fastq_qc.wf_centrifuge.task_centrifuge.docker">
        <b>wf_fastq_qc.wf_centrifuge.task_centrifuge.docker</b><br />
        <i>String &mdash; Default: "dbest/centrifuge:v1.0.4"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_fastq_qc.wf_kraken2.task_kraken2.docker">
        <b>wf_fastq_qc.wf_kraken2.task_kraken2.docker</b><br />
        <i>String &mdash; Default: "staphb/kraken2:2.1.3"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_fastq_qc.adapter_fasta">
        <b>wf_fastq_qc.adapter_fasta</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastq_qc.disk_multiplier">
        <b>wf_fastq_qc.disk_multiplier</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_fastq_qc.disk_size">
        <b>wf_fastq_qc.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_fastq_qc.memory">
        <b>wf_fastq_qc.memory</b><br />
        <i>String &mdash; Default: "250GB"</i><br />
        ???
</p>
<p name="wf_fastq_qc.read_length">
        <b>wf_fastq_qc.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_extract_kraken_reads.disk_size">
        <b>wf_fastq_qc.task_extract_kraken_reads.disk_size</b><br />
        <i>String &mdash; Default: "100"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_extract_kraken_reads.docker">
        <b>wf_fastq_qc.task_extract_kraken_reads.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_extract_kraken_reads.memory">
        <b>wf_fastq_qc.task_extract_kraken_reads.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.average_qual">
        <b>wf_fastq_qc.task_fastp.average_qual</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.cut_mean_quality">
        <b>wf_fastq_qc.task_fastp.cut_mean_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.cut_window_size">
        <b>wf_fastq_qc.task_fastp.cut_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.deduplication">
        <b>wf_fastq_qc.task_fastp.deduplication</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.docker">
        <b>wf_fastq_qc.task_fastp.docker</b><br />
        <i>String &mdash; Default: "dbest/fastp:v0.23.4"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.low_complexity_threshold">
        <b>wf_fastq_qc.task_fastp.low_complexity_threshold</b><br />
        <i>Int &mdash; Default: 30</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.memory">
        <b>wf_fastq_qc.task_fastp.memory</b><br />
        <i>String &mdash; Default: "12GB"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.min_read_length">
        <b>wf_fastq_qc.task_fastp.min_read_length</b><br />
        <i>Int &mdash; Default: 50</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.n_base_limit">
        <b>wf_fastq_qc.task_fastp.n_base_limit</b><br />
        <i>Int &mdash; Default: 5</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.overrepresentation_analysis">
        <b>wf_fastq_qc.task_fastp.overrepresentation_analysis</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.poly_x_min_len">
        <b>wf_fastq_qc.task_fastp.poly_x_min_len</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_fastp.verbose">
        <b>wf_fastq_qc.task_fastp.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_filter_bracken_output.disk_size">
        <b>wf_fastq_qc.task_filter_bracken_output.disk_size</b><br />
        <i>String &mdash; Default: "100"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_filter_bracken_output.docker">
        <b>wf_fastq_qc.task_filter_bracken_output.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_filter_bracken_output.memory">
        <b>wf_fastq_qc.task_filter_bracken_output.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_fastq_qc.task_recentrifuge.docker_image">
        <b>wf_fastq_qc.task_recentrifuge.docker_image</b><br />
        <i>String &mdash; Default: "dbest/recentrifuge:v1.14.1"</i><br />
        ???
</p>
<p name="wf_fastq_qc.threads">
        <b>wf_fastq_qc.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_fastq_qc.threshold">
        <b>wf_fastq_qc.threshold</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_fastq_qc.wf_centrifuge.task_kreport.docker">
        <b>wf_fastq_qc.wf_centrifuge.task_kreport.docker</b><br />
        <i>String &mdash; Default: "dbest/centrifuge:v1.0.4"</i><br />
        ???
</p>
<p name="wf_fastq_qc.wf_kraken2.task_bracken.docker">
        <b>wf_fastq_qc.wf_kraken2.task_bracken.docker</b><br />
        <i>String &mdash; Default: "staphb/bracken:2.9"</i><br />
        ???
</p>
<p name="wf_fastq_qc.wf_kraken2.task_kraken2.minimum_base_quality">
        <b>wf_fastq_qc.wf_kraken2.task_kraken2.minimum_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_fastq_qc.bracken_filtered">
        <b>wf_fastq_qc.bracken_filtered</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.brackenReport">
        <b>wf_fastq_qc.brackenReport</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="wf_fastq_qc.classificationTSV">
        <b>wf_fastq_qc.classificationTSV</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.classified">
        <b>wf_fastq_qc.classified</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="wf_fastq_qc.html_file">
        <b>wf_fastq_qc.html_file</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.json_file">
        <b>wf_fastq_qc.json_file</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.krakenOutput">
        <b>wf_fastq_qc.krakenOutput</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.krakenReport">
        <b>wf_fastq_qc.krakenReport</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.krakenStyleTSV">
        <b>wf_fastq_qc.krakenStyleTSV</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.log_file">
        <b>wf_fastq_qc.log_file</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.rcf_output">
        <b>wf_fastq_qc.rcf_output</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1_clean">
        <b>wf_fastq_qc.read1_clean</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1_output">
        <b>wf_fastq_qc.read1_output</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.read1_unpaired">
        <b>wf_fastq_qc.read1_unpaired</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2_clean">
        <b>wf_fastq_qc.read2_clean</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2_output">
        <b>wf_fastq_qc.read2_output</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.read2_unpaired">
        <b>wf_fastq_qc.read2_unpaired</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.summaryReportTSV">
        <b>wf_fastq_qc.summaryReportTSV</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastq_qc.unclassified">
        <b>wf_fastq_qc.unclassified</b><br />
        <i>Array[File]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
