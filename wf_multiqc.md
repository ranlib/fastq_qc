# wf_multiqc
## Multi QC workflow

## Inputs

### Required inputs
<p name="wf_multiqc.inputFiles">
        <b>wf_multiqc.inputFiles</b><br />
        <i>Array[File] &mdash; Default: None</i><br />
        List of input files to run QC on.
</p>
<p name="wf_multiqc.outputPrefix">
        <b>wf_multiqc.outputPrefix</b><br />
        <i>String &mdash; Default: None</i><br />
        output prefix.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_multiqc.task_multiqc.docker">
        <b>wf_multiqc.task_multiqc.docker</b><br />
        <i>String &mdash; Default: "multiqc/multiqc:v1.21"</i><br />
        ???
</p>
<p name="wf_multiqc.task_multiqc.memory">
        <b>wf_multiqc.task_multiqc.memory</b><br />
        <i>String &mdash; Default: "8GB"</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_multiqc.report">
        <b>wf_multiqc.report</b><br />
        <i>File</i><br />
        output html file.
</p>

<hr />

> Generated using WDL AID (1.0.0)
