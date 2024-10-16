SHELL:=/bin/bash
#
# fastqc
#
fastqc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastqc.json wf_fastqc.wdl
	miniwdl check wf_fastqc.wdl

fastqc_docu:
	wdl-aid wf_fastqc.wdl -o wf_fastqc.md

run_fastqc:
	#miniwdl run --debug --dir test-fastqc --cfg miniwdl_production.cfg  --input wf_fastqc.json wf_fastqc.wdl
	miniwdl run --debug --dir test-fastqc_negative_control --cfg miniwdl_production.cfg  --input wf_fastqc_negative_control.json wf_fastqc.wdl	

#
# cutadapt
#
cutadapt:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_cutadapt.json wf_cutadapt.wdl
	miniwdl check wf_cutadapt.wdl

cutadapt_docu:
	wdl-aid wf_cutadapt.wdl -o wf_cutadapt.md

run_cutadapt:
	miniwdl run --debug --dir test-cutadapt --cfg miniwdl_production.cfg  --input wf_cutadapt.json wf_cutadapt.wdl

#
# seqkit
#
seqkit:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_seqkit_stats.json wf_seqkit_stats.wdl
	miniwdl check wf_seqkit_stats.wdl

seqkit_docu:
	wdl-aid wf_seqkit_stats.wdl -o wf_seqkit_stats.md

run_seqkit:
	miniwdl run --debug --dir test-seqkit --cfg miniwdl_production.cfg --input wf_seqkit_stats.json wf_seqkit_stats.wdl


#
# fastp
#
fastp:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastp.json wf_fastp.wdl
	miniwdl check wf_fastp.wdl

fastp_docu:
	wdl-aid wf_fastp.wdl -o wf_fastp.md

run_fastp:
	#time miniwdl run --debug --dir test-fastp --cfg miniwdl_production.cfg --input wf_fastp.json wf_fastp.wdl
	time miniwdl run --debug --dir test-fastp_negative_control --cfg miniwdl_production.cfg --input wf_fastp_negative_control.json wf_fastp.wdl

#
# metaphlan
#
metaphlan:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_metaphlan.json wf_metaphlan.wdl
	miniwdl check wf_metaphlan.wdl

metaphlan_docu:
	wdl-aid wf_metaphlan.wdl -o wf_metaphlan.md
	#grip wf_metaphlan.md
	#java -jar ~/Software/womtool-86.jar graph wf_metaphlan.wdl > wf_metaphlan.dot
	#dot -Tpdf -o wf_metaphlan.pdf wf_metaphlan.dot
	#dot -Tjpeg -o wf_metaphlan.jpeg wf_metaphlan.dot
	#rm wf_metaphlan.dot

run_metaphlan:
	time miniwdl run --debug --dir test-metaphlan --cfg miniwdl_production.cfg --input wf_metaphlan.json wf_metaphlan.wdl


#
# centrifuge
#
centrifuge:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_centrifuge.json wf_centrifuge.wdl
	miniwdl check wf_centrifuge.wdl

centrifuge_docu:
	wdl-aid wf_centrifuge.wdl -o wf_centrifuge.md

run_centrifuge:
	#time miniwdl run --dir test-centrifuge --debug --cfg miniwdl_production.cfg -i wf_centrifuge.json wf_centrifuge.wdl
	#time miniwdl run --dir test-centrifuge_Vaccinia --debug --cfg miniwdl_production.cfg -i wf_centrifuge_Vaccinia.json wf_centrifuge.wdl
	time miniwdl run --dir test-centrifuge_negative_control --debug --cfg miniwdl_production.cfg -i wf_centrifuge_negative_control.json wf_centrifuge.wdl	

#
# kreport
#
kreport:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_kreport.json wf_kreport.wdl
	miniwdl check wf_kreport.wdl

kreport_docu:
	wdl-aid wf_kreport.wdl -o wf_kreport.md

run_kreport:
	time miniwdl run --dir test-kreport --debug --cfg miniwdl_production.cfg -i wf_kreport.json wf_kreport.wdl
	#time miniwdl run --dir test-kreport_Vaccinia --debug --cfg miniwdl_production.cfg -i wf_kreport_Vaccinia.json wf_kreport.wdl
	#time miniwdl run --dir test-kreport_negative_control --debug --cfg miniwdl_production.cfg -i wf_kreport_negative_control.json wf_kreport.wdl	

run_kreport_0line:
	time miniwdl run --dir test-kreport --debug --cfg miniwdl_production.cfg -i wf_kreport_0line.json wf_kreport.wdl

run_kreport_empty:
	time miniwdl run --dir test-kreport --debug --cfg miniwdl_production.cfg -i wf_kreport_empty.json wf_kreport.wdl

#
# kraken2
#
kraken2:
	#java -jar ~/Software/womtool-86.jar validate --inputs wf_kraken2_large.json wf_kraken2.wdl
	java -jar ~/Software/womtool-86.jar validate --inputs wf_kraken2.json wf_kraken2.wdl	
	time miniwdl check wf_kraken2.wdl

kraken2_docu:
	wdl-aid wf_kraken2.wdl -o wf_kraken2.md

run_kraken2:
	time miniwdl run --dir test-kraken2_Vaccinia --debug --cfg miniwdl_production.cfg -i wf_kraken2_Vaccinia.json wf_kraken2.wdl
	#time miniwdl run --dir test-kraken2_TB --debug --cfg miniwdl_production.cfg -i wf_kraken2.json wf_kraken2.wdl		
	#time miniwdl run --dir test-kraken2_negative_control --debug --cfg miniwdl_production.cfg -i wf_kraken2_negative_control.json wf_kraken2.wdl

#
# bracken
#
bracken:
	#java -jar ~/Software/womtool-86.jar validate --inputs wf_bracken_large.json wf_bracken.wdl
	java -jar ~/Software/womtool-86.jar validate --inputs wf_bracken.json wf_bracken.wdl	
	time miniwdl check wf_bracken.wdl

bracken_docu:
	wdl-aid wf_bracken.wdl -o wf_bracken.md

run_bracken:
	#time miniwdl run --dir test-bracken_Vaccinia --debug --cfg miniwdl_production.cfg -i wf_bracken_Vaccinia.json wf_bracken.wdl
	#time miniwdl run --dir test-bracken_TB --debug --cfg miniwdl_production.cfg -i wf_bracken.json wf_bracken.wdl		
	time miniwdl run --dir test-bracken_negative_control --debug --cfg miniwdl_production.cfg -i wf_bracken_negative_control.json wf_bracken.wdl

#
# recentrifuge
#
recentrifuge:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_recentrifuge.json wf_recentrifuge.wdl
	time miniwdl check wf_recentrifuge.wdl

recentrifuge_docu:
	wdl-aid wf_recentrifuge.wdl -o wf_recentrifuge.md

run_recentrifuge:
	#miniwdl run --dir test-recentrifuge --debug --cfg miniwdl_production.cfg -i wf_recentrifuge.json wf_recentrifuge.wdl
	miniwdl run --dir test-recentrifuge_kraken --debug --cfg miniwdl_production.cfg -i wf_recentrifuge_kraken.json wf_recentrifuge.wdl

#
# multiqc
#
multiqc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_multiqc.json wf_multiqc.wdl
	miniwdl check wf_multiqc.wdl
	wdl-aid wf_multiqc.wdl -o wf_multiqc.md

#
# bbduk
#
bbduk:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_bbduk.json wf_bbduk.wdl
	miniwdl check wf_bbduk.wdl

bbduk_docu:
	wdl-aid wf_bbduk.wdl -o wf_bbduk.md

run_bbduk:
	time miniwdl run --debug --dir test-bbduk --cfg miniwdl_production.cfg --input wf_bbduk.json wf_bbduk.wdl 

#
# krakentools
#
krakentools:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_krakentools.json wf_krakentools.wdl
	miniwdl check wf_krakentools.wdl

krakentools_docu:
	wdl-aid wf_krakentools.wdl -o wf_krakentools.md

run_krakentools:
	time miniwdl run --debug --dir test-krakentools --cfg miniwdl_production.cfg --input wf_krakentools.json wf_krakentools.wdl 


#
# fastq_qc
#
fastq_qc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastq_qc_terra.json wf_fastq_qc.wdl
	#java -jar ~/Software/womtool-86.jar validate --inputs wf_fastq_qc.json wf_fastq_qc.wdl	
	#java -jar ~/Software/womtool-86.jar validate --inputs wf_fastq_qc_negative_control.json wf_fastq_qc.wdl
	miniwdl check wf_fastq_qc.wdl

run_fastq_qc:
	time miniwdl run --debug --dir test-fastq_qc --cfg miniwdl_production.cfg --input wf_fastq_qc.json wf_fastq_qc.wdl
	#time miniwdl run --debug --dir test-fastq_qc_negative_control --cfg miniwdl_production.cfg --input wf_fastq_qc_negative_control.json wf_fastq_qc.wdl
	#time miniwdl run --debug --dir test-fastq_qc_negative_control_NC-031924 --cfg miniwdl_production.cfg --input wf_fastq_qc_negative_control_NC-031924.json wf_fastq_qc.wdl 	

run_fastq_qc_cromwell:
	time java -jar ~/Software/cromwell-86.jar run wf_fastq_qc.wdl -i wf_fastq_qc.json
	#time java -jar ~/Software/cromwell-86.jar run wf_fastq_qc.wdl -i wf_fastq_qc_negative_control.json
	#time java -jar ~/Software/cromwell-86.jar run wf_fastq_qc.wdl -i wf_fastq_qc_negative_control_NC-031924.json

fastq_qc_docu:
	wdl-aid wf_fastq_qc.wdl -o wf_fastq_qc.md
	#grip wf_fastq_qc.md
	#java -jar ~/Software/womtool-86.jar graph wf_fastq_qc.wdl > wf_fastq_qc.dot
	#dot -Tpdf -o wf_fastq_qc.pdf wf_fastq_qc.dot
	#dot -Tjpeg -o wf_fastq_qc.jpeg wf_fastq_qc.dot
	#rm wf_fastq_qc.dot

#
# create_fastq_qc_report
#
create_fastq_qc_report:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_create_fastq_qc_report.json wf_create_fastq_qc_report.wdl
	miniwdl check wf_create_fastq_qc_report.wdl

create_fastq_qc_report_docu:
	wdl-aid wf_create_fastq_qc_report.wdl -o wf_create_fastq_qc_report.md

run_create_fastq_qc_report:
	miniwdl run --debug --dir test-create_fastq_qc_report --input wf_create_fastq_qc_report.json wf_create_fastq_qc_report.wdl

run_create_fastq_qc_report_cromwell:
	java -jar ~/Software/cromwell-86.jar run wf_create_fastq_qc_report.wdl -i wf_create_fastq_qc_report.json
