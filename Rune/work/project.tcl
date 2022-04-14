set projDir "C:/Users/Javier/Documents/Alchitry/Rune/work/vivado"
set projName "Rune"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/au_top_0.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/full_circuit_1.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/reset_conditioner_2.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/button_conditioner_3.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/edge_detector_4.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/multi_seven_seg_5.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/counter_6.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/variable_counter_7.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/variable_counter_unrestricted_8.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/game_CU_9.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/regfile_10.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/alu_11.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/wasel_12.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/ra2sel_13.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/asel_14.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/bsel_15.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/wdsel_16.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/pipeline_17.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/counter_18.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/seven_seg_19.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/decoder_20.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/edge_detector_21.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/counter_22.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/pn_gen_23.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/counter_24.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/comparator_25.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/adder_26.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/shifter_27.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/boolean_28.v" "C:/Users/Javier/Documents/Alchitry/Rune/work/verilog/multiplier_29.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Javier/Documents/Alchitry/Rune/work/constraint/alchitry.xdc" "C:/Users/Javier/Documents/Alchitry/Rune/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
