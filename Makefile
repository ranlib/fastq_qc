#
# fastp
#
fastp:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_fastp.json wf_fastp.wdl
	miniwdl check wf_fastp.wdl

fastp_docu:
	wdl-aid wf_fastp.wdl -o wf_fastp.md
	java -jar ~/Software/womtool-86.jar graph wf_fastp.wdl > wf_fastp.dot
	dot -Tpdf -o wf_fastp.pdf wf_fastp.dot
	dot -Tjpeg -o wf_fastp.jpeg wf_fastp.dot
	rm wf_fastp.dot

run_fastp:
	miniwdl run --debug --dir test-fastp --cfg miniwdl_production.cfg --input wf_fastp.json wf_fastp.wdl

#
# metaphlan
#
metaphlan:
	java -jar ~/Software/womtool-86.jar validate --inputs wf_metaphlan.json wf_metaphlan.wdl
	miniwdl check wf_metaphlan.wdl

metaphlan_docu:
	wdl-aid wf_metaphlan.wdl -o wf_metaphlan.md
	java -jar ~/Software/womtool-86.jar graph wf_metaphlan.wdl > wf_metaphlan.dot
	dot -Tpdf -o wf_metaphlan.pdf wf_metaphlan.dot
	dot -Tjpeg -o wf_metaphlan.jpeg wf_metaphlan.dot
	rm wf_metaphlan.dot

run_metaphlan:
	miniwdl run --debug --dir test-metaphlan --cfg miniwdl_production.cfg --input wf_metaphlan.json wf_metaphlan.wdl
