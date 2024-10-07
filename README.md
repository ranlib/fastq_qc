# fastq_qc

A wdl workflow for quality control of fastq files.

Usage:

with miniwdl:

miniwdl run --input wf_fastq_qc.json wf_fastq_qc.wdl


with cromwell:

java -jar ~/Software/cromwell-86.jar run wf_fastq_qc.wdl -i wf_fastq_qc.json

