TOP_PATH=$(shell pwd)
SRC_PATH=$(TOP_PATH)/src
RELEASE_PATH=$(TOP_PATH)/release

run_syn: $(RELEASE_PATH)
#	cd $(RELEASE_PATH) && \
#	cp $(SRC_PATH)/vision_pipeline.prj $(RELEASE_PATH)/ && \
#	xst -ifn $(SRC_PATH)/xst.scr

gen_sim: $(RELEASE_PATH)
	cd $(RELEASE_PATH) && \
	fuse -top tb_vision_pipeline -prj $(SRC_PATH)/tb_vision_pipeline.prj -o $(RELEASE_PATH)/tb.exe -lib unisims_ver

run_sim: $(RELEASE_PATH)
	cd $(RELEASE_PATH) && \
	cp $(SRC_PATH)/plain.pgm $(RELEASE_PATH)/ && \
	./tb.exe -intstyle ise -tclbatch $(SRC_PATH)/isim.tcl && \
	isimgui -view wave.wcfg &

$(RELEASE_PATH):
	mkdir -p $(RELEASE_PATH)

clean:
	rm -rf $(RELEASE_PATH)/*
