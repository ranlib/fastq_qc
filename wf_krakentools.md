# wf_krakentools


## Inputs

### Required inputs
<p name="wf_krakentools.bracken_file">
        <b>wf_krakentools.bracken_file</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.bracken_file_filtered">
        <b>wf_krakentools.bracken_file_filtered</b><br />
        <i>String &mdash; Default: None</i><br />
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
<p name="wf_krakentools.read1_out">
        <b>wf_krakentools.read1_out</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.read2">
        <b>wf_krakentools.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_krakentools.read2_out">
        <b>wf_krakentools.read2_out</b><br />
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

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_krakentools.task_extract_kraken_reads.disk_size">
        <b>wf_krakentools.task_extract_kraken_reads.disk_size</b><br />
        <i>String &mdash; Default: "100"</i><br />
        ???
</p>
<p name="wf_krakentools.task_extract_kraken_reads.docker">
        <b>wf_krakentools.task_extract_kraken_reads.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        ???
</p>
<p name="wf_krakentools.task_extract_kraken_reads.memory">
        <b>wf_krakentools.task_extract_kraken_reads.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
        ???
</p>
<p name="wf_krakentools.task_filter_bracken_output.disk_size">
        <b>wf_krakentools.task_filter_bracken_output.disk_size</b><br />
        <i>String &mdash; Default: "100"</i><br />
        ???
</p>
<p name="wf_krakentools.task_filter_bracken_output.docker">
        <b>wf_krakentools.task_filter_bracken_output.docker</b><br />
        <i>String &mdash; Default: "dbest/krakentools:v1.2"</i><br />
        ???
</p>
<p name="wf_krakentools.task_filter_bracken_output.memory">
        <b>wf_krakentools.task_filter_bracken_output.memory</b><br />
        <i>String &mdash; Default: "10GB"</i><br />
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
