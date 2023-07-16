# clockwork_workflow
## clockwork decontamination workflow 
 This is from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork.

## Inputs

### Required inputs
<p name="clockwork_workflow.input_reads_1">
        <b>clockwork_workflow.input_reads_1</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with forward reads.
</p>
<p name="clockwork_workflow.input_reads_2">
        <b>clockwork_workflow.input_reads_2</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with reverse reads.
</p>
<p name="clockwork_workflow.metadata_file">
        <b>clockwork_workflow.metadata_file</b><br />
        <i>File &mdash; Default: None</i><br />
        tsv file with contamination information to check against, for example: 
 https://raw.githubusercontent.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS/master/tools/clockwork-0.11.3/OUT/remove_contam_metadata.tsv
</p>
<p name="clockwork_workflow.output_bam">
        <b>clockwork_workflow.output_bam</b><br />
        <i>String &mdash; Default: None</i><br />
        Name for output alignement file of alignment procedure, aligner is minimap2.
</p>
<p name="clockwork_workflow.output_file">
        <b>clockwork_workflow.output_file</b><br />
        <i>String &mdash; Default: None</i><br />
        Name for file with decontamination statistics.
</p>
<p name="clockwork_workflow.output_reads_1">
        <b>clockwork_workflow.output_reads_1</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of cleaned output fastq file for forward reads.
</p>
<p name="clockwork_workflow.output_reads_2">
        <b>clockwork_workflow.output_reads_2</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of cleaned output fastq file for reverse reads.
</p>
<p name="clockwork_workflow.reference">
        <b>clockwork_workflow.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Reference sequence to align to.
</p>
<p name="clockwork_workflow.sample_name">
        <b>clockwork_workflow.sample_name</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of the sample.
</p>

## Outputs
<p name="clockwork_workflow.clean_reads_1">
        <b>clockwork_workflow.clean_reads_1</b><br />
        <i>File</i><br />
        Cleaned output fastq file for forward reads.
</p>
<p name="clockwork_workflow.clean_reads_2">
        <b>clockwork_workflow.clean_reads_2</b><br />
        <i>File</i><br />
        Cleaned output fastq file for reverse reads.
</p>
<p name="clockwork_workflow.stats">
        <b>clockwork_workflow.stats</b><br />
        <i>File</i><br />
        Output file for decontamination statistics.
</p>

<hr />

> Generated using WDL AID (1.0.0)
