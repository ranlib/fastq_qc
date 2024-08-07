#!/bin/bash
#
# Note: sequence names cannot contain spacers!
# zcat adapters.fa.gz | sed 's| |_|g' | gzip > temp.fa.gz
#
# 2nd row indicates whether contamination (1) or not (0)
#
(zcat adapters.fa.gz | awk -F\> 'BEGIN{OFS="\t"; s=0}/^>/{s++; print "contam_group"s,1,$2}'; printf "reference\t0\tNC_000962.3") > clockwork_decontamination_metadata.tsv

# contaminants multi-fasta
(zcat adapters.fa.gz ; cat ~/Analysis/varpipe4/references/NC_000962.3/NC_000962.3.fasta) | gzip > clockwork_contaminants.fa.gz

exit 0

