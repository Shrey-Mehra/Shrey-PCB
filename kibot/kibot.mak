#!/usr/bin/make
# Automatically generated by KiBot from `config.yaml`
KIBOT=kibot
DEBUG=
CONFIG=config.yaml

# Specify the schematic file(s) to process
# SCHEMATICS = main.sh main2.sch
SCHEMATICS=$(wildcard ../src/*.sch)
SCH=../src/main.sch
PCB=../src/main.kicad_pcb
DEST=Fabrication
KIBOT_CMD=$(KIBOT) $(DEBUG) -c $(CONFIG) -e $(SCH) -b $(PCB) -d $(DEST)
LOGFILE=kibot_error.log

#
# Default target
#
all: run_erc run_drc JLCPCB_gerbers JLCPCB_drill JLCPCB print_sch print_front print_bottom interactive_bom bom_html bom_xlsx bom_csv gerbers excellon_drill gerber_drills position pcb_top_g pcb_bot_g pcb_top_b pcb_bot_b pcb_top_r pcb_bot_r step

#
# SCH/PCB targets
#
pre_sch: run_erc

out_sch: print_sch bom_html bom_xlsx bom_csv

all_sch: pre_sch out_sch

pre_pcb: run_drc

# Support for non-JLCPCB PCB manufacturers
# out_pcb: Elecrow_gerbers Elecrow_drill Elecrow FusionPCB_gerbers FusionPCB_drill FusionPCB JLCPCB_gerbers JLCPCB_drill JLCPCB P-Ban_gerbers P-Ban_drill P-Ban PCBWay_gerbers PCBWay_drill PCBWay print_front print_bottom interactive_bom gerbers excellon_drill gerber_drills position pcb_top_g pcb_bot_g pcb_top_b pcb_bot_b pcb_top_r pcb_bot_r step

out_pcb: JLCPCB_gerbers JLCPCB_drill JLCPCB print_front print_bottom interactive_bom gerbers excellon_drill gerber_drills position pcb_top_g pcb_bot_g pcb_top_b pcb_bot_b pcb_top_r pcb_bot_r step

all_pcb: pre_pcb out_pcb

#
# Available targets (outputs)
#
run_erc: Fabrication/erc.txt

run_drc: Fabrication/drc.txt

# Elecrow_gerbers: Fabrication/Elecrow/main.GTL Fabrication/Elecrow/main.G1 Fabrication/Elecrow/main.G2 Fabrication/Elecrow/main.G3 Fabrication/Elecrow/main.G4 Fabrication/Elecrow/main.GBL Fabrication/Elecrow/main.GTO Fabrication/Elecrow/main.GBO Fabrication/Elecrow/main.GTS Fabrication/Elecrow/main.GBS Fabrication/Elecrow/main.GML

# Elecrow_drill: Fabrication/Elecrow/main.TXT Fabrication/Elecrow/main-NPTH.TXT

# Elecrow: Fabrication/Elecrow/main-Elecrow.zip

# FusionPCB_gerbers: Fabrication/FusionPCB/main.GTL Fabrication/FusionPCB/main.GL2 Fabrication/FusionPCB/main.GL3 Fabrication/FusionPCB/main.GL4 Fabrication/FusionPCB/main.GL5 Fabrication/FusionPCB/main.GBL Fabrication/FusionPCB/main.GTO Fabrication/FusionPCB/main.GBO Fabrication/FusionPCB/main.GTS Fabrication/FusionPCB/main.GBS Fabrication/FusionPCB/main.GML

# FusionPCB_drill: Fabrication/FusionPCB/main.TXT

# FusionPCB: Fabrication/FusionPCB/main-FusionPCB.zip

JLCPCB_gerbers: Fabrication/JLCPCB/main-F_Cu.gbr Fabrication/JLCPCB/main-B_Cu.gbr Fabrication/JLCPCB/main-In1_Cu.gbr Fabrication/JLCPCB/main-In2_Cu.gbr Fabrication/JLCPCB/main-In3_Cu.gbr Fabrication/JLCPCB/main-In4_Cu.gbr Fabrication/JLCPCB/main-F_SilkS.gbr Fabrication/JLCPCB/main-B_SilkS.gbr Fabrication/JLCPCB/main-F_Mask.gbr Fabrication/JLCPCB/main-B_Mask.gbr Fabrication/JLCPCB/main-Edge_Cuts.gbr

JLCPCB_drill: Fabrication/JLCPCB/main-PTH.drl Fabrication/JLCPCB/main-NPTH.drl

JLCPCB: Fabrication/JLCPCB/main-JLCPCB.zip

# P-Ban_gerbers: Fabrication/P-Ban/main-F_Cu.gtl Fabrication/P-Ban/main-B_Cu.gbl Fabrication/P-Ban/main-In1_Cu.gp1 Fabrication/P-Ban/main-In2_Cu.gp2 Fabrication/P-Ban/main-In3_Cu.gp3 Fabrication/P-Ban/main-In4_Cu.gp4 Fabrication/P-Ban/main-F_SilkS.gto Fabrication/P-Ban/main-B_SilkS.gbo Fabrication/P-Ban/main-F_Mask.gts Fabrication/P-Ban/main-B_Mask.gbs Fabrication/P-Ban/main-Edge_Cuts.gm1 Fabrication/P-Ban/製造基準書.txt

# P-Ban_drill: Fabrication/P-Ban/main.drl Fabrication/P-Ban/main-drill_map.gbr Fabrication/P-Ban/main-drl.rpt

# P-Ban: Fabrication/P-Ban/main-P-Ban.zip

# PCBWay_gerbers: Fabrication/PCBWay/main.gtl Fabrication/PCBWay/main.gl2 Fabrication/PCBWay/main.gl3 Fabrication/PCBWay/main.gl4 Fabrication/PCBWay/main.gl5 Fabrication/PCBWay/main.gbl Fabrication/PCBWay/main.gto Fabrication/PCBWay/main.gbo Fabrication/PCBWay/main.gts Fabrication/PCBWay/main.gbs Fabrication/PCBWay/main.gtp Fabrication/PCBWay/main.gbp Fabrication/PCBWay/main.gm1

# PCBWay_drill: Fabrication/PCBWay/main.drl Fabrication/PCBWay/main-NPTH.drl

# PCBWay: Fabrication/PCBWay/main-PCBWay.zip

print_sch: Fabrication/schematic.pdf

print_front: Fabrication/top-copper.pdf

print_bottom: Fabrication/bottom-copper.pdf

interactive_bom: Fabrication/BoM/interactive-bom.html

bom_html: Fabrication/BoM/bom.html

bom_xlsx: Fabrication/BoM/bom.xlsx

bom_csv: Fabrication/BoM/bom.csv

gerbers: Fabrication/Gerbers/main-F_Cu.gbr Fabrication/Gerbers/main-B_Cu.gbr Fabrication/Gerbers/main-GND_Cu.gbr Fabrication/Gerbers/main-Power_Cu.gbr Fabrication/Gerbers/main-S1_Cu.gbr Fabrication/Gerbers/main-S2_Cu.gbr Fabrication/Gerbers/main-F_Paste.gbr Fabrication/Gerbers/main-B_Paste.gbr Fabrication/Gerbers/main-F_SilkS.gbr Fabrication/Gerbers/main-B_SilkS.gbr Fabrication/Gerbers/main-F_Mask.gbr Fabrication/Gerbers/main-B_Mask.gbr Fabrication/Gerbers/main-Dwgs_User.gbr Fabrication/Gerbers/main-Edge_Cuts.gbr Fabrication/Gerbers/main-B_Fab.gbr Fabrication/Gerbers/main-job.gbrjob

excellon_drill: Fabrication/Drill/main-PTH_drill.drl Fabrication/Drill/main-PTH_drill_map.pdf Fabrication/Drill/main-NPTH_drill.drl Fabrication/Drill/main-NPTH_drill_map.pdf Fabrication/Drill/main-drl.rpt

gerber_drills: Fabrication/Drill/main-PTH_drill.gbr Fabrication/Drill/main-NPTH_drill.gbr

position: Fabrication/Position/main-top_pos.pos Fabrication/Position/main-bottom_pos.pos

pcb_top_g: Fabrication/PCB/green/main-top.jpg

pcb_bot_g: Fabrication/PCB/green/main-bottom.jpg

pcb_top_b: Fabrication/PCB/blue/main-top.jpg

pcb_bot_b: Fabrication/PCB/blue/main-bottom.jpg

pcb_top_r: Fabrication/PCB/red/main-top.jpg

pcb_bot_r: Fabrication/PCB/red/main-bottom.jpg

# step: Fabrication/3D/main-3D.step

#
# Rules and dependencies
#

# ERC on following files: main.sch 
# ERC done against config.yaml
Fabrication/erc.txt: $(SCHEMATICS) $(CONFIG)
	@$(KIBOT_CMD) -s run_drc -i 1>> $(LOGFILE)

Fabrication/drc.txt: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s run_erc -i 1>> $(LOGFILE)

# # Gerbers compatible with Elecrow
# Fabrication/Elecrow/main.GTL Fabrication/Elecrow/main.G1 Fabrication/Elecrow/main.G2 Fabrication/Elecrow/main.G3 Fabrication/Elecrow/main.G4 Fabrication/Elecrow/main.GBL Fabrication/Elecrow/main.GTO Fabrication/Elecrow/main.GBO Fabrication/Elecrow/main.GTS Fabrication/Elecrow/main.GBS Fabrication/Elecrow/main.GML: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all Elecrow_gerbers 1>> $(LOGFILE)

# # Drill files compatible with Elecrow
# Fabrication/Elecrow/main.TXT Fabrication/Elecrow/main-NPTH.TXT: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all Elecrow_drill 1>> $(LOGFILE)

# # ZIP file for Elecrow
# Fabrication/Elecrow/main-Elecrow.zip: config.yaml
# 	@$(KIBOT_CMD) -s all Elecrow 1>> $(LOGFILE)

# # Gerbers compatible with FusionPCB
# Fabrication/FusionPCB/main.GTL Fabrication/FusionPCB/main.GL2 Fabrication/FusionPCB/main.GL3 Fabrication/FusionPCB/main.GL4 Fabrication/FusionPCB/main.GL5 Fabrication/FusionPCB/main.GBL Fabrication/FusionPCB/main.GTO Fabrication/FusionPCB/main.GBO Fabrication/FusionPCB/main.GTS Fabrication/FusionPCB/main.GBS Fabrication/FusionPCB/main.GML: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all FusionPCB_gerbers 1>> $(LOGFILE)

# # Drill files compatible with FusionPCB
# Fabrication/FusionPCB/main.TXT: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all FusionPCB_drill 1>> $(LOGFILE)

# # ZIP file for FusionPCB
# Fabrication/FusionPCB/main-FusionPCB.zip: config.yaml
# 	@$(KIBOT_CMD) -s all FusionPCB 1>> $(LOGFILE)

# Gerbers compatible with JLCPCB
Fabrication/JLCPCB/main-F_Cu.gbr Fabrication/JLCPCB/main-B_Cu.gbr Fabrication/JLCPCB/main-In1_Cu.gbr Fabrication/JLCPCB/main-In2_Cu.gbr Fabrication/JLCPCB/main-In3_Cu.gbr Fabrication/JLCPCB/main-In4_Cu.gbr Fabrication/JLCPCB/main-F_SilkS.gbr Fabrication/JLCPCB/main-B_SilkS.gbr Fabrication/JLCPCB/main-F_Mask.gbr Fabrication/JLCPCB/main-B_Mask.gbr Fabrication/JLCPCB/main-Edge_Cuts.gbr: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all JLCPCB_gerbers 1>> $(LOGFILE)

# Drill files compatible with JLCPCB
Fabrication/JLCPCB/main-PTH.drl Fabrication/JLCPCB/main-NPTH.drl: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all JLCPCB_drill 1>> $(LOGFILE)

# ZIP file for JLCPCB
Fabrication/JLCPCB/main-JLCPCB.zip: $(CONFIG)
	@$(KIBOT_CMD) -s all JLCPCB 1>> $(LOGFILE)

# # Gerbers compatible with P-Ban
# Fabrication/P-Ban/main-F_Cu.gtl Fabrication/P-Ban/main-B_Cu.gbl Fabrication/P-Ban/main-In1_Cu.gp1 Fabrication/P-Ban/main-In2_Cu.gp2 Fabrication/P-Ban/main-In3_Cu.gp3 Fabrication/P-Ban/main-In4_Cu.gp4 Fabrication/P-Ban/main-F_SilkS.gto Fabrication/P-Ban/main-B_SilkS.gbo Fabrication/P-Ban/main-F_Mask.gts Fabrication/P-Ban/main-B_Mask.gbs Fabrication/P-Ban/main-Edge_Cuts.gm1 Fabrication/P-Ban/製造基準書.txt: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all P-Ban_gerbers 1>> $(LOGFILE)

# # Drill files compatible with P-Ban
# Fabrication/P-Ban/main.drl Fabrication/P-Ban/main-drill_map.gbr Fabrication/P-Ban/main-drl.rpt: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all P-Ban_drill 1>> $(LOGFILE)

# # ZIP file for P-Ban
# Fabrication/P-Ban/main-P-Ban.zip: config.yaml
# 	@$(KIBOT_CMD) -s all P-Ban 1>> $(LOGFILE)

# # Gerbers compatible with PCBWay
# Fabrication/PCBWay/main.gtl Fabrication/PCBWay/main.gl2 Fabrication/PCBWay/main.gl3 Fabrication/PCBWay/main.gl4 Fabrication/PCBWay/main.gl5 Fabrication/PCBWay/main.gbl Fabrication/PCBWay/main.gto Fabrication/PCBWay/main.gbo Fabrication/PCBWay/main.gts Fabrication/PCBWay/main.gbs Fabrication/PCBWay/main.gtp Fabrication/PCBWay/main.gbp Fabrication/PCBWay/main.gm1: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all PCBWay_gerbers 1>> $(LOGFILE)

# # Drill files compatible with PCBWay
# Fabrication/PCBWay/main.drl Fabrication/PCBWay/main-NPTH.drl: $(PCB) $(CONFIG)
# 	@$(KIBOT_CMD) -s all PCBWay_drill 1>> $(LOGFILE)

# # ZIP file for PCBWay
# Fabrication/PCBWay/main-PCBWay.zip: config.yaml
# 	@$(KIBOT_CMD) -s all PCBWay 1>> $(LOGFILE)

# Print schematic (PDF)
Fabrication/schematic.pdf: $(SCHEMATICS) $(CONFIG)
	@$(KIBOT_CMD) -s all print_sch 1>> $(LOGFILE)

# Print F.Cu+Dwgs.User as top-copper.pdf
Fabrication/top-copper.pdf: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all print_front 1>> $(LOGFILE)

# Print B.Cu+Dwgs.User as bottom-copper.pdf
Fabrication/bottom-copper.pdf: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all print_bottom 1>> $(LOGFILE)

# Interactive Bill of Materials (HTML)
Fabrication/BoM/interactive-bom.html: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all interactive_bom 1>> $(LOGFILE)

# Bill of Materials in HTML format
## Add additional .sch files here for export
Fabrication/BoM/bom.html: $(SCHEMATICS) $(CONFIG)
	@$(KIBOT_CMD) -s all bom_html 1>> $(LOGFILE)

# Bill of Materials in XLSX format
## Add additional .sch files here for export
Fabrication/BoM/bom.xlsx: $(SCHEMATICS) $(CONFIG)
	@$(KIBOT_CMD) -s all bom_xlsx 1>> $(LOGFILE)

# Bill of Materials in CSV format
## Add additional .sch files here for export
Fabrication/BoM/bom.csv: $(SCHEMATICS) $(CONFIG)
	@$(KIBOT_CMD) -s all bom_csv 1>> $(LOGFILE)

# Gerbers for the board house
Fabrication/Gerbers/main-F_Cu.gbr Fabrication/Gerbers/main-B_Cu.gbr Fabrication/Gerbers/main-GND_Cu.gbr Fabrication/Gerbers/main-Power_Cu.gbr Fabrication/Gerbers/main-S1_Cu.gbr Fabrication/Gerbers/main-S2_Cu.gbr Fabrication/Gerbers/main-F_Paste.gbr Fabrication/Gerbers/main-B_Paste.gbr Fabrication/Gerbers/main-F_SilkS.gbr Fabrication/Gerbers/main-B_SilkS.gbr Fabrication/Gerbers/main-F_Mask.gbr Fabrication/Gerbers/main-B_Mask.gbr Fabrication/Gerbers/main-Dwgs_User.gbr Fabrication/Gerbers/main-Edge_Cuts.gbr Fabrication/Gerbers/main-B_Fab.gbr Fabrication/Gerbers/main-job.gbrjob: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all gerbers 1>> $(LOGFILE)

# Excellon drill files
Fabrication/Drill/main-PTH_drill.drl Fabrication/Drill/main-PTH_drill_map.pdf Fabrication/Drill/main-NPTH_drill.drl Fabrication/Drill/main-NPTH_drill_map.pdf Fabrication/Drill/main-drl.rpt: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all excellon_drill 1>> $(LOGFILE)

# Gerber drill files
Fabrication/Drill/main-PTH_drill.gbr Fabrication/Drill/main-NPTH_drill.gbr: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all gerber_drills 1>> $(LOGFILE)

# Pick and place file
Fabrication/Position/main-top_pos.pos Fabrication/Position/main-bottom_pos.pos: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all position 1>> $(LOGFILE)

# PCB render top green
Fabrication/PCB/green/main-top.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_top_g 1>> $(LOGFILE)

# PCB render bottom green
Fabrication/PCB/green/main-bottom.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_bot_g 1>> $(LOGFILE)

# PCB render top blue
Fabrication/PCB/blue/main-top.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_top_b 1>> $(LOGFILE)

# PCB render bottom blue
Fabrication/PCB/blue/main-bottom.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_bot_b 1>> $(LOGFILE)

# PCB render top red
Fabrication/PCB/red/main-top.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_top_r 1>> $(LOGFILE)

# PCB render bottom red
Fabrication/PCB/red/main-bottom.jpg: $(PCB) $(CONFIG)
	@$(KIBOT_CMD) -s all pcb_bot_r 1>> $(LOGFILE)

# # Generate 3D model (STEP)
# Fabrication/3D/main-3D.step: $(PCB) ../modelos.3dshapes/B3U_3000PB.wrl ../modelos.3dshapes/MPU-9250.wrl ../modelos.3dshapes/usb_B_micro_smd.wrl ../modelos.3dshapes/MCP73821.wrl ../modelos.3dshapes/c_0201.wrl ../modelos.3dshapes/c_0402.wrl ../modelos.3dshapes/LBCA2HNZYZ-711.wrl ../modelos.3dshapes/MKL03Z32CAF4R_20-WLCSP_1.995x1.609.wrl ../modelos.3dshapes/sod323.wrl ../modelos.3dshapes/TPS2115A.wrl ../modelos.3dshapes/ABS05-32.768KHZ-9-T.wrl ../modelos.3dshapes/r_0402.wrl ../modelos.3dshapes/SML-LX0404SIUPGUSB.wrl ../modelos.3dshapes/df12(3.0)-10dp-0.5v.wrl ../modelos.3dshapes/r_0201.wrl ../modelos.3dshapes/TPS82740B.wrl config.yaml
# 	@$(KIBOT_CMD) -s all step 1>> $(LOGFILE)

.PHONY: all pre_sch out_sch all_sch pre_pcb out_pcb all_pcb run_erc run_drc Elecrow_gerbers Elecrow_drill Elecrow FusionPCB_gerbers FusionPCB_drill FusionPCB JLCPCB_gerbers JLCPCB_drill JLCPCB P-Ban_gerbers P-Ban_drill P-Ban PCBWay_gerbers PCBWay_drill PCBWay print_sch print_front print_bottom interactive_bom bom_html bom_xlsx bom_csv gerbers excellon_drill gerber_drills position pcb_top_g pcb_bot_g pcb_top_b pcb_bot_b pcb_top_r pcb_bot_r step
