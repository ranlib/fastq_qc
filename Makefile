#
# fastp
#
fastp:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastp.json wf_fastp.wdl
	miniwdl check wf_fastp.wdl

fastp_docu:
	wdl-aid wf_fastp.wdl -o wf_fastp.md
	#grip wf_fastp.md
	#java -jar ~/Software/womtool-86.jar graph wf_fastp.wdl > wf_fastp.dot
	#dot -Tpdf -o wf_fastp.pdf wf_fastp.dot
	#dot -Tjpeg -o wf_fastp.jpeg wf_fastp.dot
	#rm wf_fastp.dot

run_fastp:
	time miniwdl run --debug --dir test-fastp --cfg miniwdl_production.cfg --input wf_fastp.json wf_fastp.wdl

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

run_centrifuge:
	#time miniwdl run --dir test-centrifuge --debug --cfg miniwdl_production.cfg -i wf_centrifuge.json wf_centrifuge.wdl
	time miniwdl run --dir test-centrifuge --debug --cfg miniwdl_production.cfg -i wf_centrifuge_Vaccinia.json wf_centrifuge.wdl	

#
# kraken2
#
kraken2:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_kraken2_large.json wf_kraken2.wdl
	time miniwdl check wf_kraken2.wdl

run_kraken2:
	miniwdl run --dir test-kraken2_large --debug --cfg miniwdl_production.cfg -i wf_kraken2_large.json wf_kraken2.wdl

#
# recentrifuge
#
recentrifuge:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_recentrifuge.json wf_recentrifuge.wdl
	time miniwdl check wf_recentrifuge.wdl

run_recentrifuge:
	miniwdl run --dir test-recentrifuge --debug --cfg miniwdl_production.cfg -i wf_recentrifuge.json wf_recentrifuge.wdl

#
# multiqc
#
multiqc:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_multiqc.json wf_multiqc.wdl
	miniwdl check wf_multiqc.wdl
	wdl-aid wf_multiqc.wdl -o wf_multiqc.md

