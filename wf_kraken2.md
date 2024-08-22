# wf_kraken2


## Inputs

### Required inputs
<p name="wf_kraken2.database">
        <b>wf_kraken2.database</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_kraken2.read1">
        <b>wf_kraken2.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_kraken2.read2">
        <b>wf_kraken2.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_kraken2.samplename">
        <b>wf_kraken2.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        ???
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_kraken2.task_kraken2.docker">
        <b>wf_kraken2.task_kraken2.docker</b><br />
        <i>String &mdash; Default: "staphb/kraken2:2.1.3"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_kraken2.disk_multiplier">
        <b>wf_kraken2.disk_multiplier</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_kraken2.disk_size">
        <b>wf_kraken2.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_kraken2.memory">
        <b>wf_kraken2.memory</b><br />
        <i>String &mdash; Default: "250GB"</i><br />
        ???
</p>
<p name="wf_kraken2.read_length">
        <b>wf_kraken2.read_length</b><br />
        <i>Int &mdash; Default: 150</i><br />
        ???
</p>
<p name="wf_kraken2.task_bracken.docker">
        <b>wf_kraken2.task_bracken.docker</b><br />
        <i>String &mdash; Default: "staphb/bracken:2.9"</i><br />
        ???
</p>
<p name="wf_kraken2.task_kraken2.minimum_base_quality">
        <b>wf_kraken2.task_kraken2.minimum_base_quality</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_kraken2.threads">
        <b>wf_kraken2.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
<p name="wf_kraken2.threshold">
        <b>wf_kraken2.threshold</b><br />
        <i>Int &mdash; Default: 10</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_kraken2.bracken_report_S">
        <b>wf_kraken2.bracken_report_S</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_kraken2.brackenReport">
        <b>wf_kraken2.brackenReport</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="wf_kraken2.classified">
        <b>wf_kraken2.classified</b><br />
        <i>Array[File]</i><br />
        ???
</p>
<p name="wf_kraken2.krakenOutput">
        <b>wf_kraken2.krakenOutput</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_kraken2.krakenReport">
        <b>wf_kraken2.krakenReport</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_kraken2.unclassified">
        <b>wf_kraken2.unclassified</b><br />
        <i>Array[File]</i><br />
        ???
</p>

<hr />

> Generated using WDL AID (1.0.0)
