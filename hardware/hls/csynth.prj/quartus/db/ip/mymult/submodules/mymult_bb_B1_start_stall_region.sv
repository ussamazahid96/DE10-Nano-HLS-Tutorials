// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 21.1 (Release Build #173.3)
// 
// Legal Notice: Copyright 2021 Intel Corporation.  All rights reserved.
// Your use of  Intel Corporation's design tools,  logic functions and other
// software and  tools, and its AMPP partner logic functions, and any output
// files any  of the foregoing (including  device programming  or simulation
// files), and  any associated  documentation  or information  are expressly
// subject  to the terms and  conditions of the  Intel FPGA Software License
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement,  including,  without limitation,  that your use is for
// the  sole  purpose of  programming  logic devices  manufactured by  Intel
// and  sold by Intel  or its authorized  distributors. Please refer  to the
// applicable agreement for further details.
// ---------------------------------------------------------------------------

// SystemVerilog created from mymult_bb_B1_start_stall_region
// SystemVerilog created on Mon Dec 27 01:52:48 2021


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module mymult_bb_B1_start_stall_region (
    input wire [63:0] in_iord_bl_call_mymult_i_fifodata,
    input wire [0:0] in_iord_bl_call_mymult_i_fifovalid,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out,
    input wire [0:0] in_pipeline_stall_in,
    output wire [0:0] out_pipeline_valid_out,
    input wire [0:0] in_stall_in,
    output wire [0:0] out_stall_out,
    input wire [0:0] in_valid_in,
    output wire [0:0] out_iord_bl_call_mymult_o_fifoready,
    output wire [0:0] out_iord_bl_call_mymult_o_fifoalmost_full,
    output wire [0:0] out_valid_out,
    output wire [31:0] out_iowr_nb_return_mymult_o_fifodata,
    output wire [0:0] out_iowr_nb_return_mymult_o_fifovalid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] mymult_B1_start_merge_reg_out_stall_out;
    wire [0:0] mymult_B1_start_merge_reg_out_valid_out;
    wire [0:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoalmost_full;
    wire [0:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoready;
    wire [0:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_stall;
    wire [0:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_valid;
    wire [31:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_0_tpl;
    wire [31:0] i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_1_tpl;
    wire [0:0] i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_stall;
    wire [0:0] i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_valid;
    wire [0:0] i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_pipeline_valid_out;
    wire [31:0] i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifodata;
    wire [0:0] i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifovalid;
    wire [0:0] i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_stall;
    wire [0:0] i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_valid;
    wire [63:0] bubble_join_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_q;
    wire [31:0] bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_b;
    wire [31:0] bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_c;
    wire [0:0] SE_out_mymult_B1_start_merge_reg_wireValid;
    wire [0:0] SE_out_mymult_B1_start_merge_reg_backStall;
    wire [0:0] SE_out_mymult_B1_start_merge_reg_V0;
    wire [0:0] SE_stall_entry_wireValid;
    wire [0:0] SE_stall_entry_backStall;
    wire [0:0] SE_stall_entry_V0;
    wire [0:0] SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_wireValid;
    wire [0:0] SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_backStall;
    wire [0:0] SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_V0;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_wireValid;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_backStall;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_V0;
    wire [0:0] SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_wireValid;
    wire [0:0] SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_backStall;
    wire [0:0] SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_V0;


    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // SE_stall_entry(STALLENABLE,39)
    // Valid signal propagation
    assign SE_stall_entry_V0 = SE_stall_entry_wireValid;
    // Backward Stall generation
    assign SE_stall_entry_backStall = mymult_B1_start_merge_reg_out_stall_out | ~ (SE_stall_entry_wireValid);
    // Computing multiple Valid(s)
    assign SE_stall_entry_wireValid = in_valid_in;

    // mymult_B1_start_merge_reg(BLACKBOX,12)@0
    // in in_stall_in@20000000
    // out out_data_out@1
    // out out_stall_out@20000000
    // out out_valid_out@1
    mymult_B1_start_merge_reg themymult_B1_start_merge_reg (
        .in_data_in(GND_q),
        .in_stall_in(SE_out_mymult_B1_start_merge_reg_backStall),
        .in_valid_in(SE_stall_entry_V0),
        .out_data_out(),
        .out_stall_out(mymult_B1_start_merge_reg_out_stall_out),
        .out_valid_out(mymult_B1_start_merge_reg_out_valid_out),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_mymult_B1_start_merge_reg(STALLENABLE,38)
    // Valid signal propagation
    assign SE_out_mymult_B1_start_merge_reg_V0 = SE_out_mymult_B1_start_merge_reg_wireValid;
    // Backward Stall generation
    assign SE_out_mymult_B1_start_merge_reg_backStall = i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_stall | ~ (SE_out_mymult_B1_start_merge_reg_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_mymult_B1_start_merge_reg_wireValid = mymult_B1_start_merge_reg_out_valid_out;

    // bubble_join_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x(BITJOIN,33)
    assign bubble_join_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_q = {i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_1_tpl, i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_0_tpl};

    // bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x(BITSELECT,34)
    assign bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_b = $unsigned(bubble_join_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_q[31:0]);
    assign bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_c = $unsigned(bubble_join_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_q[63:32]);

    // SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x(STALLENABLE,46)
    // Valid signal propagation
    assign SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_V0 = SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_wireValid;
    // Backward Stall generation
    assign SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_backStall = in_stall_in | ~ (SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_wireValid = i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_valid;

    // i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x(BLACKBOX,29)@1
    // in in_i_stall@20000000
    // out out_iowr_nb_return_mymult_o_fifodata@20000000
    // out out_iowr_nb_return_mymult_o_fifovalid@20000000
    // out out_o_stall@20000000
    // out out_o_valid@6
    // out out_c1_exit_0_tpl@6
    mymult_i_sfc_s_c1_in_wt_entry_s_c1_enter_mymult3 thei_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x (
        .in_i_stall(SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_backStall),
        .in_i_valid(SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_V0),
        .in_c1_eni1_0_tpl(GND_q),
        .in_c1_eni1_1_tpl(bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_b),
        .in_c1_eni1_2_tpl(bubble_select_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_c),
        .out_iowr_nb_return_mymult_o_fifodata(i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifodata),
        .out_iowr_nb_return_mymult_o_fifovalid(i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifovalid),
        .out_o_stall(i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_stall),
        .out_o_valid(i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_valid),
        .out_c1_exit_0_tpl(),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x(STALLENABLE,42)
    // Valid signal propagation
    assign SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_V0 = SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_wireValid;
    // Backward Stall generation
    assign SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_backStall = i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_o_stall | ~ (SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_wireValid = i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_valid;

    // i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x(BLACKBOX,27)@1
    // in in_i_stall@20000000
    // out out_iord_bl_call_mymult_o_fifoalmost_full@20000000
    // out out_iord_bl_call_mymult_o_fifoready@20000000
    // out out_o_stall@20000000
    mymult_i_iord_bl_call_unnamed_mymult2_mymult0 thei_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x (
        .in_i_stall(SE_out_i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_backStall),
        .in_i_valid(SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_V0),
        .in_iord_bl_call_mymult_i_fifodata(in_iord_bl_call_mymult_i_fifodata),
        .in_iord_bl_call_mymult_i_fifovalid(in_iord_bl_call_mymult_i_fifovalid),
        .out_iord_bl_call_mymult_o_fifoalmost_full(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoalmost_full),
        .out_iord_bl_call_mymult_o_fifoready(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoready),
        .out_o_stall(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_stall),
        .out_o_valid(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_valid),
        .out_o_data_0_tpl(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_0_tpl),
        .out_o_data_1_tpl(i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_data_1_tpl),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x(STALLENABLE,44)
    // Valid signal propagation
    assign SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_V0 = SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_wireValid;
    // Backward Stall generation
    assign SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_backStall = i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_o_stall | ~ (SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_wireValid = i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_valid;

    // i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x(BLACKBOX,28)@1
    // in in_i_stall@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out@20000000
    // out out_o_stall@20000000
    // out out_pipeline_valid_out@20000000
    mymult_i_sfc_s_c0_in_wt_entry_s_c0_enter1_mymult0 thei_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x (
        .in_i_stall(SE_out_i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_backStall),
        .in_i_valid(SE_out_mymult_B1_start_merge_reg_V0),
        .in_pipeline_stall_in(in_pipeline_stall_in),
        .in_unnamed_mymult0_0_tpl(GND_q),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out(i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out(i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out),
        .out_o_stall(i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_stall),
        .out_o_valid(i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_o_valid),
        .out_pipeline_valid_out(i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_pipeline_valid_out),
        .out_c0_exit_0_tpl(),
        .out_c0_exit_1_tpl(),
        .clock(clock),
        .resetn(resetn)
    );

    // ext_sig_sync_out(GPOUT,7)
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out = i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_valid_out;
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out = i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_mymult1_exiting_stall_out;

    // pipeline_valid_out_sync(GPOUT,18)
    assign out_pipeline_valid_out = i_sfc_s_c0_in_wt_entry_mymults_c0_enter1_mymult0_aunroll_x_out_pipeline_valid_out;

    // sync_out(GPOUT,22)@0
    assign out_stall_out = SE_stall_entry_backStall;

    // dupName_0_ext_sig_sync_out_x(GPOUT,24)
    assign out_iord_bl_call_mymult_o_fifoready = i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoready;
    assign out_iord_bl_call_mymult_o_fifoalmost_full = i_iord_bl_call_mymult_unnamed_mymult2_mymult1_aunroll_x_out_iord_bl_call_mymult_o_fifoalmost_full;

    // dupName_0_sync_out_x(GPOUT,25)@6
    assign out_valid_out = SE_out_i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_V0;

    // dupName_1_ext_sig_sync_out_x(GPOUT,26)
    assign out_iowr_nb_return_mymult_o_fifodata = i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifodata;
    assign out_iowr_nb_return_mymult_o_fifovalid = i_sfc_s_c1_in_wt_entry_mymults_c1_enter_mymult3_aunroll_x_out_iowr_nb_return_mymult_o_fifovalid;

endmodule
