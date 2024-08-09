# wf_fastp


## Inputs

### Required inputs
<p name="wf_fastp.html_report">
        <b>wf_fastp.html_report</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.json_report">
        <b>wf_fastp.json_report</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.log">
        <b>wf_fastp.log</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.read1">
        <b>wf_fastp.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.read1_trimmed">
        <b>wf_fastp.read1_trimmed</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.read2">
        <b>wf_fastp.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.read2_trimmed">
        <b>wf_fastp.read2_trimmed</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.sample_name">
        <b>wf_fastp.sample_name</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_fastp.adapter_fasta">
        <b>wf_fastp.adapter_fasta</b><br />
        <i>File? &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.average_qual">
        <b>wf_fastp.task_fastp.average_qual</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.cut_mean_quality">
        <b>wf_fastp.task_fastp.cut_mean_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.cut_window_size">
        <b>wf_fastp.task_fastp.cut_window_size</b><br />
        <i>Int &mdash; Default: 4</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.deduplication">
        <b>wf_fastp.task_fastp.deduplication</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.docker">
        <b>wf_fastp.task_fastp.docker</b><br />
        <i>String &mdash; Default: "dbest/fastp:v0.23.4"</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.low_complexity_threshold">
        <b>wf_fastp.task_fastp.low_complexity_threshold</b><br />
        <i>Int &mdash; Default: 30</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.memory">
        <b>wf_fastp.task_fastp.memory</b><br />
        <i>String &mdash; Default: "12GB"</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.min_read_length">
        <b>wf_fastp.task_fastp.min_read_length</b><br />
        <i>Int &mdash; Default: 50</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.n_base_limit">
        <b>wf_fastp.task_fastp.n_base_limit</b><br />
        <i>Int &mdash; Default: 5</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.overrepresentation_analysis">
        <b>wf_fastp.task_fastp.overrepresentation_analysis</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.poly_x_min_len">
        <b>wf_fastp.task_fastp.poly_x_min_len</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.threads">
        <b>wf_fastp.task_fastp.threads</b><br />
        <i>Int &mdash; Default: 3</i><br />
        ???
</p>
<p name="wf_fastp.task_fastp.verbose">
        <b>wf_fastp.task_fastp.verbose</b><br />
        <i>Boolean &mdash; Default: false</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_fastp.log_file">
        <b>wf_fastp.log_file</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastp.read1_clean">
        <b>wf_fastp.read1_clean</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastp.read1_unpaired">
        <b>wf_fastp.read1_unpaired</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastp.read2_clean">
        <b>wf_fastp.read2_clean</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_fastp.read2_unpaired">
        <b>wf_fastp.read2_unpaired</b><br />
        <i>File</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
