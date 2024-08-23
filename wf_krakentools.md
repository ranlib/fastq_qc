# wf_krakentools


## Inputs

### Required inputs
<p name="wf_krakentools.bracken_file">
        <b>wf_krakentools.bracken_file</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.exclude">
        <b>wf_krakentools.exclude</b><br />
        <i>Boolean &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.kraken_file">
        <b>wf_krakentools.kraken_file</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.read1">
        <b>wf_krakentools.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.read2">
        <b>wf_krakentools.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.samplename">
        <b>wf_krakentools.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.taxid">
        <b>wf_krakentools.taxid</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.taxid_exclude">
        <b>wf_krakentools.taxid_exclude</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.taxid_include">
        <b>wf_krakentools.taxid_include</b><br />
        <i>Array[Int] &mdash; Default: None</i><br />
        ???
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_krakentools.task_extract_kraken_reads.docker">
        <b>wf_krakentools.task_extract_kraken_reads.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_krakentools.task_extract_kraken_reads.memory">
        <b>wf_krakentools.task_extract_kraken_reads.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        The amount of memory available to the job.
</p>
<p name="wf_krakentools.task_filter_bracken_output.docker">
        <b>wf_krakentools.task_filter_bracken_output.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
<p name="wf_krakentools.task_filter_bracken_output.memory">
        <b>wf_krakentools.task_filter_bracken_output.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        The amount of memory available to the job.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_krakentools.task_extract_kraken_reads.disk_size">
        <b>wf_krakentools.task_extract_kraken_reads.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_krakentools.task_filter_bracken_output.disk_size">
        <b>wf_krakentools.task_filter_bracken_output.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_krakentools.bracken_filtered">
        <b>wf_krakentools.bracken_filtered</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_krakentools.read1_output">
        <b>wf_krakentools.read1_output</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_krakentools.read2_output">
        <b>wf_krakentools.read2_output</b><br />
        <i>File</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
