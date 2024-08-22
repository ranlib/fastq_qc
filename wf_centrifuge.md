# wf_centrifuge
## Taxonomic classification of reads using centrifuge

## Inputs

### Required inputs
<p name="wf_centrifuge.indexFiles">
        <b>wf_centrifuge.indexFiles</b><br />
        <i>Array[File]+ &mdash; Default: None</i><br />
        ???
</p>
<p name="wf_centrifuge.read1">
        <b>wf_centrifuge.read1</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq file with forward reads
</p>
<p name="wf_centrifuge.read2">
        <b>wf_centrifuge.read2</b><br />
        <i>File &mdash; Default: None</i><br />
        Input fastq file with reverse reads
</p>
<p name="wf_centrifuge.samplename">
        <b>wf_centrifuge.samplename</b><br />
        <i>String &mdash; Default: None</i><br />
        Sample name
</p>

### Advanced inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_centrifuge.task_centrifuge.docker">
        <b>wf_centrifuge.task_centrifuge.docker</b><br />
        <i>String &mdash; Default: "dbest/centrifuge:v1.0.4.1"</i><br />
        The docker image used for this task. Changing this may result in errors which the developers may choose not to address.
</p>
</details>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_centrifuge.disk_multiplier">
        <b>wf_centrifuge.disk_multiplier</b><br />
        <i>Int &mdash; Default: 20</i><br />
        ???
</p>
<p name="wf_centrifuge.disk_size">
        <b>wf_centrifuge.disk_size</b><br />
        <i>Int &mdash; Default: 100</i><br />
        ???
</p>
<p name="wf_centrifuge.memory">
        <b>wf_centrifuge.memory</b><br />
        <i>String &mdash; Default: "20GB"</i><br />
        ???
</p>
<p name="wf_centrifuge.task_kreport.docker">
        <b>wf_centrifuge.task_kreport.docker</b><br />
        <i>String &mdash; Default: "dbest/centrifuge:v1.0.4.1"</i><br />
        ???
</p>
<p name="wf_centrifuge.threads">
        <b>wf_centrifuge.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_centrifuge.classificationTSV">
        <b>wf_centrifuge.classificationTSV</b><br />
        <i>File</i><br />
        Output tsv file with read classification
</p>
<p name="wf_centrifuge.krakenStyleErr">
        <b>wf_centrifuge.krakenStyleErr</b><br />
        <i>File</i><br />
        ???
</p>
<p name="wf_centrifuge.krakenStyleTSV">
        <b>wf_centrifuge.krakenStyleTSV</b><br />
        <i>File</i><br />
        Output tsv file with read classification kraken style
</p>
<p name="wf_centrifuge.summaryReportTSV">
        <b>wf_centrifuge.summaryReportTSV</b><br />
        <i>File</i><br />
        Output tsv file with summary of classification
</p>

<hr />

> Generated using WDL AID (1.0.0)
