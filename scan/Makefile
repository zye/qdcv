TOP_PATH=$(shell pwd)
PRJ_PATH=$(TOP_PATH)/prj
RELEASE_PATH=$(TOP_PATH)/release

run_syn: $(RELEASE_PATH)
	cd $(RELEASE_PATH) && \
	cp $(PRJ_PATH)/scan.prj $(RELEASE_PATH)/ && \
	xst -ifn $(PRJ_PATH)/xst.scr

gen_sim: $(RELEASE_PATH)
	cd $(RELEASE_PATH) && \
	fuse -top tb_vision_pipeline -prj $(PRJ_PATH)/tb_vision_pipeline.prj -o $(RELEASE_PATH)/tb.exe -lib unisims_ver

run_sim: $(RELEASE_PATH)
	cd $(RELEASE_PATH) && \
	cp $(PRJ_PATH)/plain.pgm $(RELEASE_PATH)/ && \
	./tb.exe -intstyle ise -tclbatch $(PRJ_PATH)/isim.tcl && \
	isimgui -view wave.wcfg &

$(RELEASE_PATH):
	mkdir -p $(RELEASE_PATH)

clean:
	rm -rf $(RELEASE_PATH)/*
