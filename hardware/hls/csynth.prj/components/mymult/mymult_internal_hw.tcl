package require -exact qsys 15.0
set_module_property NAME mymult_internal
set_module_property VERSION 1.0
set_module_property INTERNAL true
set_module_property GROUP HLS
set_module_property DISPLAY_NAME mymult_internal
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property SUPPORTED_DEVICE_FAMILIES {"Cyclone V"}
set_module_assignment hls.cosim.name {_Z6mymultii}
set_module_assignment hls.compressed.name {mymult}

#### Synthesis fileset
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL mymult_internal
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file "dspba_library_ver.sv" SYSTEM_VERILOG PATH "linux64/lib/dspba/Libraries/sv/base/dspba_library_ver.sv"
add_fileset_file "acl_ecc_pkg.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_pkg.sv"
add_fileset_file "acl_data_fifo.v" SYSTEM_VERILOG PATH "ip/acl_data_fifo.v"
add_fileset_file "acl_fifo.v" SYSTEM_VERILOG PATH "ip/acl_fifo.v"
add_fileset_file "acl_altera_syncram_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_altera_syncram_wrapped.sv"
add_fileset_file "acl_scfifo_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_scfifo_wrapped.sv"
add_fileset_file "acl_ecc_decoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_decoder.sv"
add_fileset_file "acl_ecc_encoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_encoder.sv"
add_fileset_file "acl_ll_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_fifo.v"
add_fileset_file "acl_ll_ram_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_ram_fifo.v"
add_fileset_file "acl_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_valid_fifo_counter.v"
add_fileset_file "acl_dspba_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_dspba_valid_fifo_counter.v"
add_fileset_file "acl_staging_reg.v" SYSTEM_VERILOG PATH "ip/acl_staging_reg.v"
add_fileset_file "hld_fifo.sv" SYSTEM_VERILOG PATH "ip/hld_fifo.sv"
add_fileset_file "acl_mid_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mid_speed_fifo.sv"
add_fileset_file "acl_latency_one_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_one_ram_fifo.sv"
add_fileset_file "acl_latency_zero_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_zero_ram_fifo.sv"
add_fileset_file "hld_fifo_zero_width.sv" SYSTEM_VERILOG PATH "ip/hld_fifo_zero_width.sv"
add_fileset_file "acl_high_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_high_speed_fifo.sv"
add_fileset_file "acl_low_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_low_latency_fifo.sv"
add_fileset_file "acl_zero_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_zero_latency_fifo.sv"
add_fileset_file "acl_fanout_pipeline.sv" SYSTEM_VERILOG PATH "ip/acl_fanout_pipeline.sv"
add_fileset_file "acl_std_synchronizer_nocut.v" SYSTEM_VERILOG PATH "ip/acl_std_synchronizer_nocut.v"
add_fileset_file "acl_tessellated_incr_decr_threshold.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_decr_threshold.sv"
add_fileset_file "acl_tessellated_incr_lookahead.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_lookahead.sv"
add_fileset_file "acl_reset_handler.sv" SYSTEM_VERILOG PATH "ip/acl_reset_handler.sv"
add_fileset_file "acl_lfsr.sv" SYSTEM_VERILOG PATH "ip/acl_lfsr.sv"
add_fileset_file "acl_mlab_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mlab_fifo.sv"
add_fileset_file "acl_parameter_assert.svh" SYSTEM_VERILOG PATH "ip/acl_parameter_assert.svh"
add_fileset_file "acl_pop.v" SYSTEM_VERILOG PATH "ip/acl_pop.v"
add_fileset_file "acl_push.v" SYSTEM_VERILOG PATH "ip/acl_push.v"
add_fileset_file "acl_token_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_token_fifo_counter.v"
add_fileset_file "acl_pipeline.v" SYSTEM_VERILOG PATH "ip/acl_pipeline.v"
add_fileset_file "acl_dspba_buffer.v" SYSTEM_VERILOG PATH "ip/acl_dspba_buffer.v"
add_fileset_file "acl_enable_sink.v" SYSTEM_VERILOG PATH "ip/acl_enable_sink.v"
add_fileset_file "hld_memory_depth_quantization_pkg.sv" SYSTEM_VERILOG PATH "ip/hld_memory_depth_quantization_pkg.sv"
add_fileset_file "hld_iord.sv" SYSTEM_VERILOG PATH "ip/hld_iord.sv"
add_fileset_file "hld_iord_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_latency.sv"
add_fileset_file "hld_iord_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_valid.sv"
add_fileset_file "acl_shift_register_no_reset.sv" SYSTEM_VERILOG PATH "ip/acl_shift_register_no_reset.sv"
add_fileset_file "hld_iowr.sv" SYSTEM_VERILOG PATH "ip/hld_iowr.sv"
add_fileset_file "hld_iowr_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_latency.sv"
add_fileset_file "hld_iowr_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_valid.sv"
add_fileset_file "hld_loop_profiler.sv" SYSTEM_VERILOG PATH "ip/hld_loop_profiler.sv"
add_fileset_file "hld_sim_latency_tracker.sv" SYSTEM_VERILOG PATH "ip/hld_sim_latency_tracker.sv"
add_fileset_file "acl_reset_wire.v" SYSTEM_VERILOG PATH "ip/acl_reset_wire.v"
add_fileset_file "mymult_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/mymult_function_wrapper.sv"
add_fileset_file "mymult_function.sv" SYSTEM_VERILOG PATH "ip/mymult_function.sv"
add_fileset_file "mymult_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B0_runOnce.sv"
add_fileset_file "mymult_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B0_runOnce_stall_region.sv"
add_fileset_file "mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0_reg.sv"
add_fileset_file "mymult_i_llvm_fpga_push_token_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_token_i1_wt_limpush_0.sv"
add_fileset_file "mymult_i_llvm_fpga_push_token_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_token_i1_wt_limpush_1_reg.sv"
add_fileset_file "mymult_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_merge_reg.sv"
add_fileset_file "mymult_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_branch.sv"
add_fileset_file "mymult_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_merge.sv"
add_fileset_file "mymult_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B1_start.sv"
add_fileset_file "mymult_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B1_start_stall_region.sv"
add_fileset_file "mymult_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_merge_reg.sv"
add_fileset_file "mymult_i_iord_bl_call_unnamed_mymult2_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_iord_bl_call_unnamed_mymult2_mymult0.sv"
add_fileset_file "mymult_i_sfc_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv"
add_fileset_file "mymult_i_llvm_fpga_sfc_exit_s_c0_out_wt_entry_s_c0_exit_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_sfc_exit_s_c0_out_wt_entry_s_c0_exit_mymult0.sv"
add_fileset_file "mymult_i_sfc_logic_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_logic_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "mymult_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "mymult_i_sfc_s_c1_in_wt_entry_s_c1_enter_mymult3.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_s_c1_in_wt_entry_s_c1_enter_mymult3.sv"
add_fileset_file "mymult_i_llvm_fpga_sfc_exit_s_c1_out_wt_entry_s_c1_exit_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_sfc_exit_s_c1_out_wt_entry_s_c1_exit_mymult0.sv"
add_fileset_file "mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0.sv"
add_fileset_file "mymult_i_iowr_nb_return_unnamed_mymult3_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_iowr_nb_return_unnamed_mymult3_mymult0.sv"
add_fileset_file "mymult_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_branch.sv"
add_fileset_file "mymult_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_merge.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_1_valid_fifo.sv"
add_fileset_file "mymult_internal.v" SYSTEM_VERILOG PATH "mymult_internal.v"

#### Simulation fileset
add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL mymult_internal
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file "dspba_library_ver.sv" SYSTEM_VERILOG PATH "linux64/lib/dspba/Libraries/sv/base/dspba_library_ver.sv"
add_fileset_file "acl_ecc_pkg.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_pkg.sv"
add_fileset_file "acl_data_fifo.v" SYSTEM_VERILOG PATH "ip/acl_data_fifo.v"
add_fileset_file "acl_fifo.v" SYSTEM_VERILOG PATH "ip/acl_fifo.v"
add_fileset_file "acl_altera_syncram_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_altera_syncram_wrapped.sv"
add_fileset_file "acl_scfifo_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_scfifo_wrapped.sv"
add_fileset_file "acl_ecc_decoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_decoder.sv"
add_fileset_file "acl_ecc_encoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_encoder.sv"
add_fileset_file "acl_ll_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_fifo.v"
add_fileset_file "acl_ll_ram_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_ram_fifo.v"
add_fileset_file "acl_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_valid_fifo_counter.v"
add_fileset_file "acl_dspba_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_dspba_valid_fifo_counter.v"
add_fileset_file "acl_staging_reg.v" SYSTEM_VERILOG PATH "ip/acl_staging_reg.v"
add_fileset_file "hld_fifo.sv" SYSTEM_VERILOG PATH "ip/hld_fifo.sv"
add_fileset_file "acl_mid_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mid_speed_fifo.sv"
add_fileset_file "acl_latency_one_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_one_ram_fifo.sv"
add_fileset_file "acl_latency_zero_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_zero_ram_fifo.sv"
add_fileset_file "hld_fifo_zero_width.sv" SYSTEM_VERILOG PATH "ip/hld_fifo_zero_width.sv"
add_fileset_file "acl_high_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_high_speed_fifo.sv"
add_fileset_file "acl_low_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_low_latency_fifo.sv"
add_fileset_file "acl_zero_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_zero_latency_fifo.sv"
add_fileset_file "acl_fanout_pipeline.sv" SYSTEM_VERILOG PATH "ip/acl_fanout_pipeline.sv"
add_fileset_file "acl_std_synchronizer_nocut.v" SYSTEM_VERILOG PATH "ip/acl_std_synchronizer_nocut.v"
add_fileset_file "acl_tessellated_incr_decr_threshold.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_decr_threshold.sv"
add_fileset_file "acl_tessellated_incr_lookahead.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_lookahead.sv"
add_fileset_file "acl_reset_handler.sv" SYSTEM_VERILOG PATH "ip/acl_reset_handler.sv"
add_fileset_file "acl_lfsr.sv" SYSTEM_VERILOG PATH "ip/acl_lfsr.sv"
add_fileset_file "acl_mlab_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mlab_fifo.sv"
add_fileset_file "acl_parameter_assert.svh" SYSTEM_VERILOG PATH "ip/acl_parameter_assert.svh"
add_fileset_file "acl_pop.v" SYSTEM_VERILOG PATH "ip/acl_pop.v"
add_fileset_file "acl_push.v" SYSTEM_VERILOG PATH "ip/acl_push.v"
add_fileset_file "acl_token_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_token_fifo_counter.v"
add_fileset_file "acl_pipeline.v" SYSTEM_VERILOG PATH "ip/acl_pipeline.v"
add_fileset_file "acl_dspba_buffer.v" SYSTEM_VERILOG PATH "ip/acl_dspba_buffer.v"
add_fileset_file "acl_enable_sink.v" SYSTEM_VERILOG PATH "ip/acl_enable_sink.v"
add_fileset_file "hld_memory_depth_quantization_pkg.sv" SYSTEM_VERILOG PATH "ip/hld_memory_depth_quantization_pkg.sv"
add_fileset_file "hld_iord.sv" SYSTEM_VERILOG PATH "ip/hld_iord.sv"
add_fileset_file "hld_iord_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_latency.sv"
add_fileset_file "hld_iord_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_valid.sv"
add_fileset_file "acl_shift_register_no_reset.sv" SYSTEM_VERILOG PATH "ip/acl_shift_register_no_reset.sv"
add_fileset_file "hld_iowr.sv" SYSTEM_VERILOG PATH "ip/hld_iowr.sv"
add_fileset_file "hld_iowr_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_latency.sv"
add_fileset_file "hld_iowr_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_valid.sv"
add_fileset_file "hld_loop_profiler.sv" SYSTEM_VERILOG PATH "ip/hld_loop_profiler.sv"
add_fileset_file "hld_sim_latency_tracker.sv" SYSTEM_VERILOG PATH "ip/hld_sim_latency_tracker.sv"
add_fileset_file "acl_reset_wire.v" SYSTEM_VERILOG PATH "ip/acl_reset_wire.v"
add_fileset_file "mymult_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/mymult_function_wrapper.sv"
add_fileset_file "mymult_function.sv" SYSTEM_VERILOG PATH "ip/mymult_function.sv"
add_fileset_file "mymult_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B0_runOnce.sv"
add_fileset_file "mymult_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B0_runOnce_stall_region.sv"
add_fileset_file "mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pop_token_i1_wt_limpop_0_reg.sv"
add_fileset_file "mymult_i_llvm_fpga_push_token_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_token_i1_wt_limpush_0.sv"
add_fileset_file "mymult_i_llvm_fpga_push_token_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_token_i1_wt_limpush_1_reg.sv"
add_fileset_file "mymult_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_merge_reg.sv"
add_fileset_file "mymult_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_branch.sv"
add_fileset_file "mymult_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/mymult_B0_runOnce_merge.sv"
add_fileset_file "mymult_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B1_start.sv"
add_fileset_file "mymult_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/mymult_bb_B1_start_stall_region.sv"
add_fileset_file "mymult_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_merge_reg.sv"
add_fileset_file "mymult_i_iord_bl_call_unnamed_mymult2_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_iord_bl_call_unnamed_mymult2_mymult0.sv"
add_fileset_file "mymult_i_sfc_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv"
add_fileset_file "mymult_i_llvm_fpga_sfc_exit_s_c0_out_wt_entry_s_c0_exit_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_sfc_exit_s_c0_out_wt_entry_s_c0_exit_mymult0.sv"
add_fileset_file "mymult_i_sfc_logic_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_logic_s_c0_in_wt_entry_s_c0_enter1_mymult0.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "mymult_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "mymult_i_sfc_s_c1_in_wt_entry_s_c1_enter_mymult3.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_s_c1_in_wt_entry_s_c1_enter_mymult3.sv"
add_fileset_file "mymult_i_llvm_fpga_sfc_exit_s_c1_out_wt_entry_s_c1_exit_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_sfc_exit_s_c1_out_wt_entry_s_c1_exit_mymult0.sv"
add_fileset_file "mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0.sv"
add_fileset_file "mymult_i_iowr_nb_return_unnamed_mymult3_mymult0.sv" SYSTEM_VERILOG PATH "ip/mymult_i_iowr_nb_return_unnamed_mymult3_mymult0.sv"
add_fileset_file "mymult_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_branch.sv"
add_fileset_file "mymult_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/mymult_B1_start_merge.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "mymult_i_llvm_fpga_pipeline_keep_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/mymult_i_llvm_fpga_pipeline_keep_going_1_valid_fifo.sv"
add_fileset_file "mymult_internal.v" SYSTEM_VERILOG PATH "mymult_internal.v"

#### Primary clock for the component
add_interface clock clock end
set_interface_property clock ENABLED true
set_interface_assignment clock hls.cosim.name {$clock}
add_interface_port clock clock clk input 1

#### Primary reset for the component
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_assignment reset hls.cosim.name {$reset}
add_interface_port reset resetn reset_n input 1

#### The component slave protocol interrupt request interface (done_irq)
add_interface irq interrupt end
set_interface_property irq associatedClock clock
set_interface_property irq associatedReset reset
set_interface_property irq associatedAddressablePoint avs_cra
set_interface_assignment irq hls.cosim.name {$irq}
add_interface_port irq done_irq irq output 1

#### Slave interface avs_cra
add_interface avs_cra avalon end
set_interface_property avs_cra ENABLED true
set_interface_property avs_cra associatedClock clock
set_interface_property avs_cra associatedReset reset
set_interface_property avs_cra addressAlignment DYNAMIC
set_interface_property avs_cra burstOnBurstBoundariesOnly false
set_interface_property avs_cra explicitAddressSpan 0
set_interface_property avs_cra holdTime 0
set_interface_property avs_cra isMemoryDevice false
set_interface_property avs_cra isNonVolatileStorage false
set_interface_property avs_cra linewrapBursts false
set_interface_property avs_cra maximumPendingReadTransactions 0
set_interface_property avs_cra printableDevice false
set_interface_property avs_cra readLatency 1
set_interface_property avs_cra readWaitTime 0
set_interface_property avs_cra setupTime 0
set_interface_property avs_cra timingUnits Cycles
set_interface_property avs_cra writeWaitTime 0
set_interface_assignment avs_cra hls.cosim.name {$cra}
add_interface_port avs_cra avs_cra_read read input 1
add_interface_port avs_cra avs_cra_readdata readdata output 64
add_interface_port avs_cra avs_cra_write write input 1
add_interface_port avs_cra avs_cra_writedata writedata input 64
add_interface_port avs_cra avs_cra_address address input 3
add_interface_port avs_cra avs_cra_byteenable byteenable input 8

#### Quartus settings (QIP strings)
set_qip_strings { "set_instance_assignment -entity \"%entityName%\" -library \"%libraryName%\" -name AUTO_SHIFT_REGISTER_RECOGNITION OFF -to *_NO_SHIFT_REG*"  }
