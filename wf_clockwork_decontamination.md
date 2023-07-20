# wf_clockwork_decontamination
## clockwork decontamination workflow 
 This is from the clockwork TB profiler: https://github.com/iqbal-lab-org/clockwork.

## Inputs

### Required inputs
<p name="wf_clockwork_decontamination.input_reads_1">
        <b>wf_clockwork_decontamination.input_reads_1</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with forward reads.
</p>
<p name="wf_clockwork_decontamination.input_reads_2">
        <b>wf_clockwork_decontamination.input_reads_2</b><br />
        <i>File &mdash; Default: None</i><br />
        fastq file with reverse reads.
</p>
<p name="wf_clockwork_decontamination.metadata_file">
        <b>wf_clockwork_decontamination.metadata_file</b><br />
        <i>File &mdash; Default: None</i><br />
        tsv file with information about contaminants to check against, for example: 
 https://raw.githubusercontent.com/CDCgov/NCHHSTP-DTBE-Varpipe-WGS/master/tools/clockwork-0.11.3/OUT/remove_contam_metadata.tsv
</p>
<p name="wf_clockwork_decontamination.reference">
        <b>wf_clockwork_decontamination.reference</b><br />
        <i>File &mdash; Default: None</i><br />
        Multi-fasta file of sequences that could be contaminants.
</p>
<p name="wf_clockwork_decontamination.sample_name">
        <b>wf_clockwork_decontamination.sample_name</b><br />
        <i>String &mdash; Default: None</i><br />
        Name of the sample.
</p>

### Other inputs
<details>
<summary> Show/Hide </summary>
<p name="wf_clockwork_decontamination.threads">
        <b>wf_clockwork_decontamination.threads</b><br />
        <i>Int &mdash; Default: 1</i><br />
        ???
</p>
</details>

## Outputs
<p name="wf_clockwork_decontamination.clean_reads_1">
        <b>wf_clockwork_decontamination.clean_reads_1</b><br />
        <i>File</i><br />
        Cleaned output fastq file for forward reads.
</p>
<p name="wf_clockwork_decontamination.clean_reads_2">
        <b>wf_clockwork_decontamination.clean_reads_2</b><br />
        <i>File</i><br />
        Cleaned output fastq file for reverse reads.
</p>
<p name="wf_clockwork_decontamination.stats">
        <b>wf_clockwork_decontamination.stats</b><br />
        <i>File</i><br />
        Output file for decontamination statistics.
</p>

<hr />

> Generated using WDL AID (1.0.0)
