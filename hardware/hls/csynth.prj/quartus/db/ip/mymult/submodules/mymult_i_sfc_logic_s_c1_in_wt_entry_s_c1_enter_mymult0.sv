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

// SystemVerilog created from mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0
// SystemVerilog created on Mon Dec 27 01:52:48 2021


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module mymult_i_sfc_logic_s_c1_in_wt_entry_s_c1_enter_mymult0 (
    output wire [31:0] out_iowr_nb_return_mymult_o_fifodata,
    output wire [0:0] out_iowr_nb_return_mymult_o_fifovalid,
    output wire [0:0] out_o_valid,
    output wire [0:0] out_unnamed_mymult1,
    output wire [0:0] out_unnamed_mymult4_0_tpl,
    input wire [0:0] in_c1_eni1_0_tpl,
    input wire [31:0] in_c1_eni1_1_tpl,
    input wire [31:0] in_c1_eni1_2_tpl,
    input wire [0:0] in_enable,
    input wire [0:0] in_i_valid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifodata;
    wire [0:0] i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifovalid;
    wire [63:0] bgTrunc_i_mul_mymult3_sel_x_in;
    wire [31:0] bgTrunc_i_mul_mymult3_sel_x_b;
    (* dont_merge *) reg [0:0] valid_fanout_reg0_q;
    (* dont_merge *) reg [0:0] valid_fanout_reg1_q;
    wire [50:0] i_mul_mymult3_sums_align_1_q;
    wire [50:0] i_mul_mymult3_sums_align_1_qint;
    wire i_mul_mymult3_im0_cma_reset;
    (* preserve *) reg [13:0] i_mul_mymult3_im0_cma_a0 [0:0];
    (* preserve *) reg [13:0] i_mul_mymult3_im0_cma_c0 [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_p [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_u [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_w [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_x [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_y [0:0];
    reg [27:0] i_mul_mymult3_im0_cma_s [0:0];
    wire [27:0] i_mul_mymult3_im0_cma_qq;
    wire [27:0] i_mul_mymult3_im0_cma_q;
    wire i_mul_mymult3_im0_cma_ena0;
    wire i_mul_mymult3_im0_cma_ena1;
    wire i_mul_mymult3_im8_cma_reset;
    (* preserve *) reg [17:0] i_mul_mymult3_im8_cma_a0 [0:0];
    (* preserve *) reg [17:0] i_mul_mymult3_im8_cma_c0 [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_p [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_u [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_w [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_x [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_y [0:0];
    reg [35:0] i_mul_mymult3_im8_cma_s [0:0];
    wire [35:0] i_mul_mymult3_im8_cma_qq;
    wire [35:0] i_mul_mymult3_im8_cma_q;
    wire i_mul_mymult3_im8_cma_ena0;
    wire i_mul_mymult3_im8_cma_ena1;
    wire i_mul_mymult3_ma3_cma_reset;
    (* preserve *) reg [13:0] i_mul_mymult3_ma3_cma_a0 [0:1];
    (* preserve *) reg [17:0] i_mul_mymult3_ma3_cma_c0 [0:1];
    wire [31:0] i_mul_mymult3_ma3_cma_p [0:1];
    wire [32:0] i_mul_mymult3_ma3_cma_u [0:1];
    wire [32:0] i_mul_mymult3_ma3_cma_w [0:0];
    wire [32:0] i_mul_mymult3_ma3_cma_x [0:0];
    wire [32:0] i_mul_mymult3_ma3_cma_y [0:0];
    reg [32:0] i_mul_mymult3_ma3_cma_s [0:0];
    wire [32:0] i_mul_mymult3_ma3_cma_qq;
    wire [32:0] i_mul_mymult3_ma3_cma_q;
    wire i_mul_mymult3_ma3_cma_ena0;
    wire i_mul_mymult3_ma3_cma_ena1;
    wire [13:0] i_mul_mymult3_sums_result_add_0_0_UpperBits_for_b_q;
    wire [60:0] i_mul_mymult3_sums_result_add_0_0_p1_of_2_a;
    wire [60:0] i_mul_mymult3_sums_result_add_0_0_p1_of_2_b;
    logic [60:0] i_mul_mymult3_sums_result_add_0_0_p1_of_2_o;
    wire [0:0] i_mul_mymult3_sums_result_add_0_0_p1_of_2_c;
    wire [59:0] i_mul_mymult3_sums_result_add_0_0_p1_of_2_q;
    wire [6:0] i_mul_mymult3_sums_result_add_0_0_p2_of_2_a;
    wire [6:0] i_mul_mymult3_sums_result_add_0_0_p2_of_2_b;
    logic [6:0] i_mul_mymult3_sums_result_add_0_0_p2_of_2_o;
    wire [0:0] i_mul_mymult3_sums_result_add_0_0_p2_of_2_cin;
    wire [4:0] i_mul_mymult3_sums_result_add_0_0_p2_of_2_q;
    wire [64:0] i_mul_mymult3_sums_result_add_0_0_BitJoin_for_q_q;
    wire [59:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q;
    wire [4:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q;
    wire [59:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q;
    wire [13:0] i_mul_mymult3_bs2_merged_bit_select_b;
    wire [17:0] i_mul_mymult3_bs2_merged_bit_select_c;
    wire [13:0] i_mul_mymult3_bs1_merged_bit_select_b;
    wire [17:0] i_mul_mymult3_bs1_merged_bit_select_c;
    wire [23:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b;
    wire [3:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c;
    wire [8:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_b;
    wire [4:0] i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_c;
    reg [3:0] redist0_i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q;
    reg [59:0] redist1_i_mul_mymult3_sums_result_add_0_0_p1_of_2_q_1_q;
    reg [32:0] redist2_i_mul_mymult3_ma3_cma_q_1_q;
    reg [35:0] redist3_i_mul_mymult3_im8_cma_q_1_q;
    reg [27:0] redist4_i_mul_mymult3_im0_cma_q_1_q;
    reg [0:0] redist5_sync_together8_aunroll_x_in_i_valid_4_q;
    reg [0:0] redist5_sync_together8_aunroll_x_in_i_valid_4_delay_0;
    reg [0:0] redist5_sync_together8_aunroll_x_in_i_valid_4_delay_1;
    reg [0:0] redist5_sync_together8_aunroll_x_in_i_valid_4_delay_2;
    wire [0:0] enable_stall_connector_not_enable_q;


    // redist5_sync_together8_aunroll_x_in_i_valid_4(DELAY,63)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_0 <= '0;
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_1 <= '0;
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_2 <= '0;
            redist5_sync_together8_aunroll_x_in_i_valid_4_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_0 <= $unsigned(in_i_valid);
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_1 <= redist5_sync_together8_aunroll_x_in_i_valid_4_delay_0;
            redist5_sync_together8_aunroll_x_in_i_valid_4_delay_2 <= redist5_sync_together8_aunroll_x_in_i_valid_4_delay_1;
            redist5_sync_together8_aunroll_x_in_i_valid_4_q <= redist5_sync_together8_aunroll_x_in_i_valid_4_delay_2;
        end
    end

    // valid_fanout_reg1(REG,14)@5 + 1
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            valid_fanout_reg1_q <= $unsigned(1'b0);
        end
        else if (in_enable == 1'b1)
        begin
            valid_fanout_reg1_q <= $unsigned(redist5_sync_together8_aunroll_x_in_i_valid_4_q);
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // enable_stall_connector_not_enable(LOGICAL,64)
    assign enable_stall_connector_not_enable_q = $unsigned(~ (in_enable));

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // i_mul_mymult3_bs2_merged_bit_select(BITSELECT,54)@1
    assign i_mul_mymult3_bs2_merged_bit_select_b = in_c1_eni1_1_tpl[31:18];
    assign i_mul_mymult3_bs2_merged_bit_select_c = in_c1_eni1_1_tpl[17:0];

    // i_mul_mymult3_bs1_merged_bit_select(BITSELECT,55)@1
    assign i_mul_mymult3_bs1_merged_bit_select_b = in_c1_eni1_2_tpl[31:18];
    assign i_mul_mymult3_bs1_merged_bit_select_c = in_c1_eni1_2_tpl[17:0];

    // i_mul_mymult3_ma3_cma(CHAINMULTADD,33)@1 + 2
    assign i_mul_mymult3_ma3_cma_reset = ~ (resetn);
    assign i_mul_mymult3_ma3_cma_ena0 = in_enable[0];
    assign i_mul_mymult3_ma3_cma_ena1 = i_mul_mymult3_ma3_cma_ena0;
    assign i_mul_mymult3_ma3_cma_p[0] = i_mul_mymult3_ma3_cma_a0[0] * i_mul_mymult3_ma3_cma_c0[0];
    assign i_mul_mymult3_ma3_cma_p[1] = i_mul_mymult3_ma3_cma_a0[1] * i_mul_mymult3_ma3_cma_c0[1];
    assign i_mul_mymult3_ma3_cma_u[0] = {1'b0, i_mul_mymult3_ma3_cma_p[0][31:0]};
    assign i_mul_mymult3_ma3_cma_u[1] = {1'b0, i_mul_mymult3_ma3_cma_p[1][31:0]};
    assign i_mul_mymult3_ma3_cma_w[0] = i_mul_mymult3_ma3_cma_u[0] + i_mul_mymult3_ma3_cma_u[1];
    assign i_mul_mymult3_ma3_cma_x[0] = i_mul_mymult3_ma3_cma_w[0];
    assign i_mul_mymult3_ma3_cma_y[0] = i_mul_mymult3_ma3_cma_x[0];
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_ma3_cma_a0 <= '{default: '0};
            i_mul_mymult3_ma3_cma_c0 <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_ma3_cma_ena0 == 1'b1)
            begin
                i_mul_mymult3_ma3_cma_a0[0] <= i_mul_mymult3_bs1_merged_bit_select_b;
                i_mul_mymult3_ma3_cma_a0[1] <= i_mul_mymult3_bs2_merged_bit_select_b;
                i_mul_mymult3_ma3_cma_c0[0] <= i_mul_mymult3_bs2_merged_bit_select_c;
                i_mul_mymult3_ma3_cma_c0[1] <= i_mul_mymult3_bs1_merged_bit_select_c;
            end
        end
    end
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_ma3_cma_s <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_ma3_cma_ena1 == 1'b1)
            begin
                i_mul_mymult3_ma3_cma_s[0] <= i_mul_mymult3_ma3_cma_y[0];
            end
        end
    end
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_mymult3_ma3_cma_delay ( .xin(i_mul_mymult3_ma3_cma_s[0]), .xout(i_mul_mymult3_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_mymult3_ma3_cma_q = $unsigned(i_mul_mymult3_ma3_cma_qq[32:0]);

    // redist2_i_mul_mymult3_ma3_cma_q_1(DELAY,60)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist2_i_mul_mymult3_ma3_cma_q_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist2_i_mul_mymult3_ma3_cma_q_1_q <= $unsigned(i_mul_mymult3_ma3_cma_q);
        end
    end

    // i_mul_mymult3_sums_align_1(BITSHIFT,28)@4
    assign i_mul_mymult3_sums_align_1_qint = { redist2_i_mul_mymult3_ma3_cma_q_1_q, 18'b000000000000000000 };
    assign i_mul_mymult3_sums_align_1_q = i_mul_mymult3_sums_align_1_qint[50:0];

    // i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b(BITJOIN,51)@4
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q = {i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_b, i_mul_mymult3_sums_align_1_q};

    // i_mul_mymult3_im0_cma(CHAINMULTADD,31)@1 + 2
    assign i_mul_mymult3_im0_cma_reset = ~ (resetn);
    assign i_mul_mymult3_im0_cma_ena0 = in_enable[0];
    assign i_mul_mymult3_im0_cma_ena1 = i_mul_mymult3_im0_cma_ena0;
    assign i_mul_mymult3_im0_cma_p[0] = i_mul_mymult3_im0_cma_a0[0] * i_mul_mymult3_im0_cma_c0[0];
    assign i_mul_mymult3_im0_cma_u[0] = i_mul_mymult3_im0_cma_p[0][27:0];
    assign i_mul_mymult3_im0_cma_w[0] = i_mul_mymult3_im0_cma_u[0];
    assign i_mul_mymult3_im0_cma_x[0] = i_mul_mymult3_im0_cma_w[0];
    assign i_mul_mymult3_im0_cma_y[0] = i_mul_mymult3_im0_cma_x[0];
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_im0_cma_a0 <= '{default: '0};
            i_mul_mymult3_im0_cma_c0 <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_im0_cma_ena0 == 1'b1)
            begin
                i_mul_mymult3_im0_cma_a0[0] <= i_mul_mymult3_bs1_merged_bit_select_b;
                i_mul_mymult3_im0_cma_c0[0] <= i_mul_mymult3_bs2_merged_bit_select_b;
            end
        end
    end
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_im0_cma_s <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_im0_cma_ena1 == 1'b1)
            begin
                i_mul_mymult3_im0_cma_s[0] <= i_mul_mymult3_im0_cma_y[0];
            end
        end
    end
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_mymult3_im0_cma_delay ( .xin(i_mul_mymult3_im0_cma_s[0]), .xout(i_mul_mymult3_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_mymult3_im0_cma_q = $unsigned(i_mul_mymult3_im0_cma_qq[27:0]);

    // redist4_i_mul_mymult3_im0_cma_q_1(DELAY,62)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist4_i_mul_mymult3_im0_cma_q_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist4_i_mul_mymult3_im0_cma_q_1_q <= $unsigned(i_mul_mymult3_im0_cma_q);
        end
    end

    // i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select(BITSELECT,56)@4
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b = $unsigned(redist4_i_mul_mymult3_im0_cma_q_1_q[23:0]);
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c = $unsigned(redist4_i_mul_mymult3_im0_cma_q_1_q[27:24]);

    // i_mul_mymult3_im8_cma(CHAINMULTADD,32)@1 + 2
    assign i_mul_mymult3_im8_cma_reset = ~ (resetn);
    assign i_mul_mymult3_im8_cma_ena0 = in_enable[0];
    assign i_mul_mymult3_im8_cma_ena1 = i_mul_mymult3_im8_cma_ena0;
    assign i_mul_mymult3_im8_cma_p[0] = i_mul_mymult3_im8_cma_a0[0] * i_mul_mymult3_im8_cma_c0[0];
    assign i_mul_mymult3_im8_cma_u[0] = i_mul_mymult3_im8_cma_p[0][35:0];
    assign i_mul_mymult3_im8_cma_w[0] = i_mul_mymult3_im8_cma_u[0];
    assign i_mul_mymult3_im8_cma_x[0] = i_mul_mymult3_im8_cma_w[0];
    assign i_mul_mymult3_im8_cma_y[0] = i_mul_mymult3_im8_cma_x[0];
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_im8_cma_a0 <= '{default: '0};
            i_mul_mymult3_im8_cma_c0 <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_im8_cma_ena0 == 1'b1)
            begin
                i_mul_mymult3_im8_cma_a0[0] <= i_mul_mymult3_bs1_merged_bit_select_c;
                i_mul_mymult3_im8_cma_c0[0] <= i_mul_mymult3_bs2_merged_bit_select_c;
            end
        end
    end
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_im8_cma_s <= '{default: '0};
        end
        else
        begin
            if (i_mul_mymult3_im8_cma_ena1 == 1'b1)
            begin
                i_mul_mymult3_im8_cma_s[0] <= i_mul_mymult3_im8_cma_y[0];
            end
        end
    end
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_mymult3_im8_cma_delay ( .xin(i_mul_mymult3_im8_cma_s[0]), .xout(i_mul_mymult3_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_mymult3_im8_cma_q = $unsigned(i_mul_mymult3_im8_cma_qq[35:0]);

    // redist3_i_mul_mymult3_im8_cma_q_1(DELAY,61)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist3_i_mul_mymult3_im8_cma_q_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist3_i_mul_mymult3_im8_cma_q_1_q <= $unsigned(i_mul_mymult3_im8_cma_q);
        end
    end

    // i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b(BITJOIN,45)@4
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q = {i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_b, redist3_i_mul_mymult3_im8_cma_q_1_q};

    // i_mul_mymult3_sums_result_add_0_0_p1_of_2(ADD,40)@4 + 1
    assign i_mul_mymult3_sums_result_add_0_0_p1_of_2_a = {1'b0, i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_b_q};
    assign i_mul_mymult3_sums_result_add_0_0_p1_of_2_b = {1'b0, i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_BitJoin_for_b_q};
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_sums_result_add_0_0_p1_of_2_o <= 61'b0;
        end
        else if (in_enable == 1'b1)
        begin
            i_mul_mymult3_sums_result_add_0_0_p1_of_2_o <= $unsigned(i_mul_mymult3_sums_result_add_0_0_p1_of_2_a) + $unsigned(i_mul_mymult3_sums_result_add_0_0_p1_of_2_b);
        end
    end
    assign i_mul_mymult3_sums_result_add_0_0_p1_of_2_c[0] = i_mul_mymult3_sums_result_add_0_0_p1_of_2_o[60];
    assign i_mul_mymult3_sums_result_add_0_0_p1_of_2_q = i_mul_mymult3_sums_result_add_0_0_p1_of_2_o[59:0];

    // i_mul_mymult3_sums_result_add_0_0_UpperBits_for_b(CONSTANT,37)
    assign i_mul_mymult3_sums_result_add_0_0_UpperBits_for_b_q = $unsigned(14'b00000000000000);

    // i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select(BITSELECT,57)
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_b = $unsigned(i_mul_mymult3_sums_result_add_0_0_UpperBits_for_b_q[8:0]);
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_c = $unsigned(i_mul_mymult3_sums_result_add_0_0_UpperBits_for_b_q[13:9]);

    // redist0_i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1(DELAY,58)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist0_i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist0_i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q <= $unsigned(i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c);
        end
    end

    // i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,48)@5
    assign i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q = {GND_q, redist0_i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_tessel0_1_merged_bit_select_c_1_q};

    // i_mul_mymult3_sums_result_add_0_0_p2_of_2(ADD,41)@5 + 1
    assign i_mul_mymult3_sums_result_add_0_0_p2_of_2_cin = i_mul_mymult3_sums_result_add_0_0_p1_of_2_c;
    assign i_mul_mymult3_sums_result_add_0_0_p2_of_2_a = { {1'b0, i_mul_mymult3_sums_result_add_0_0_BitSelect_for_a_BitJoin_for_c_q}, 1'b1 };
    assign i_mul_mymult3_sums_result_add_0_0_p2_of_2_b = { {1'b0, i_mul_mymult3_sums_result_add_0_0_BitSelect_for_b_tessel0_1_merged_bit_select_c}, i_mul_mymult3_sums_result_add_0_0_p2_of_2_cin[0] };
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            i_mul_mymult3_sums_result_add_0_0_p2_of_2_o <= 7'b0;
        end
        else if (in_enable == 1'b1)
        begin
            i_mul_mymult3_sums_result_add_0_0_p2_of_2_o <= $unsigned(i_mul_mymult3_sums_result_add_0_0_p2_of_2_a) + $unsigned(i_mul_mymult3_sums_result_add_0_0_p2_of_2_b);
        end
    end
    assign i_mul_mymult3_sums_result_add_0_0_p2_of_2_q = i_mul_mymult3_sums_result_add_0_0_p2_of_2_o[5:1];

    // redist1_i_mul_mymult3_sums_result_add_0_0_p1_of_2_q_1(DELAY,59)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist1_i_mul_mymult3_sums_result_add_0_0_p1_of_2_q_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist1_i_mul_mymult3_sums_result_add_0_0_p1_of_2_q_1_q <= $unsigned(i_mul_mymult3_sums_result_add_0_0_p1_of_2_q);
        end
    end

    // i_mul_mymult3_sums_result_add_0_0_BitJoin_for_q(BITJOIN,42)@6
    assign i_mul_mymult3_sums_result_add_0_0_BitJoin_for_q_q = {i_mul_mymult3_sums_result_add_0_0_p2_of_2_q, redist1_i_mul_mymult3_sums_result_add_0_0_p1_of_2_q_1_q};

    // bgTrunc_i_mul_mymult3_sel_x(BITSELECT,10)@6
    assign bgTrunc_i_mul_mymult3_sel_x_in = i_mul_mymult3_sums_result_add_0_0_BitJoin_for_q_q[63:0];
    assign bgTrunc_i_mul_mymult3_sel_x_b = bgTrunc_i_mul_mymult3_sel_x_in[31:0];

    // i_iowr_nb_return_mymult_unnamed_mymult3_mymult4(BLACKBOX,7)@6
    // out out_iowr_nb_return_mymult_o_fifodata@20000000
    // out out_iowr_nb_return_mymult_o_fifovalid@20000000
    mymult_i_iowr_nb_return_unnamed_mymult3_mymult0 thei_iowr_nb_return_mymult_unnamed_mymult3_mymult4 (
        .in_i_data(bgTrunc_i_mul_mymult3_sel_x_b),
        .in_i_stall(enable_stall_connector_not_enable_q),
        .in_i_valid(valid_fanout_reg1_q),
        .out_iowr_nb_return_mymult_o_fifodata(i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifodata),
        .out_iowr_nb_return_mymult_o_fifovalid(i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifovalid),
        .out_o_ack(),
        .out_o_stall(),
        .out_o_valid(),
        .clock(clock),
        .resetn(resetn)
    );

    // ext_sig_sync_out(GPOUT,6)
    assign out_iowr_nb_return_mymult_o_fifodata = i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifodata;
    assign out_iowr_nb_return_mymult_o_fifovalid = i_iowr_nb_return_mymult_unnamed_mymult3_mymult4_out_iowr_nb_return_mymult_o_fifovalid;

    // valid_fanout_reg0(REG,13)@5 + 1
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            valid_fanout_reg0_q <= $unsigned(1'b0);
        end
        else if (in_enable == 1'b1)
        begin
            valid_fanout_reg0_q <= $unsigned(redist5_sync_together8_aunroll_x_in_i_valid_4_q);
        end
    end

    // sync_out_aunroll_x(GPOUT,11)@6
    assign out_o_valid = valid_fanout_reg0_q;
    assign out_unnamed_mymult1 = GND_q;
    assign out_unnamed_mymult4_0_tpl = GND_q;

endmodule
