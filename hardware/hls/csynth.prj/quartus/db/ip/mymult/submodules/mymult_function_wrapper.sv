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

// SystemVerilog created from mymult_function_wrapper
// SystemVerilog created on Mon Dec 27 01:52:48 2021


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module mymult_function_wrapper (
    input wire [2:0] avs_cra_address,
    input wire [7:0] avs_cra_byteenable,
    input wire [0:0] avs_cra_enable,
    input wire [0:0] avs_cra_read,
    input wire [0:0] avs_cra_write,
    input wire [63:0] avs_cra_writedata,
    input wire [63:0] avst_iord_bl_call_mymult_data,
    input wire [0:0] avst_iord_bl_call_mymult_valid,
    input wire [0:0] avst_iowr_nb_return_mymult_almostfull,
    input wire [0:0] stall_in,
    input wire [0:0] start,
    input wire [0:0] valid_in,
    output wire [63:0] avs_cra_readdata,
    output wire [0:0] avs_cra_readdatavalid,
    output wire [0:0] avst_iord_bl_call_mymult_almost_full,
    output wire [0:0] avst_iord_bl_call_mymult_ready,
    output wire [31:0] avst_iowr_nb_return_mymult_data,
    output wire [0:0] avst_iowr_nb_return_mymult_valid,
    output wire [0:0] done_irq,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [31:0] arg_bits_b;
    reg [63:0] avs_cra_readdata_r_NO_SHIFT_REG_q;
    wire [2:0] avs_readdata_mux_s;
    reg [63:0] avs_readdata_mux_q;
    wire [0:0] avs_start_q;
    wire [63:0] bit_enable_q;
    wire [0:0] bitenable_lsb_b;
    wire [0:0] busy_and_q;
    wire [63:0] busy_join_q;
    wire [0:0] busy_or_q;
    wire [63:0] call_const_q;
    wire [0:0] component_not_ready_q;
    wire [31:0] const_pad_return_q;
    wire [62:0] const_status_pad_q;
    wire [0:0] data_and_enable_q;
    wire [2:0] done_address_q;
    wire [0:0] done_and_q;
    wire [63:0] done_join_q;
    wire [0:0] done_or_q;
    reg [0:0] done_r_NO_SHIFT_REG_q;
    wire [0:0] hold_done_q;
    wire [63:0] implicit_input_q;
    wire [63:0] instmask_join_q;
    reg [0:0] interrupt_mask_r_NO_SHIFT_REG_q;
    reg [0:0] interrupt_r_NO_SHIFT_REG_q;
    reg [63:0] mm_slave_address_5_data_NO_SHIFT_REG_q;
    reg [63:0] mm_slave_address_6_data_NO_SHIFT_REG_q;
    wire [0:0] mymult_function_out_iord_bl_call_mymult_o_fifoalmost_full;
    wire [0:0] mymult_function_out_iord_bl_call_mymult_o_fifoready;
    wire [31:0] mymult_function_out_iowr_nb_return_mymult_o_fifodata;
    wire [0:0] mymult_function_out_iowr_nb_return_mymult_o_fifovalid;
    wire [0:0] next_done_q;
    wire [0:0] next_reg_q;
    wire [0:0] next_start_q;
    wire [0:0] not_bitenable_q;
    wire [0:0] not_reset_done_q;
    wire [0:0] not_start_q;
    wire [0:0] pos_reset_q;
    wire [2:0] reg_address_q;
    wire [0:0] reg_and_not_enable_q;
    wire [0:0] reset_done_q;
    wire [0:0] reset_wire_inst_o_resetn;
    wire reset_wire_inst_o_resetn_bitsignaltemp;
    reg [31:0] return_data_r_NO_SHIFT_REG_q;
    wire [63:0] return_reg_join_q;
    wire [0:0] select_0_b;
    wire [0:0] select_1_b;
    wire [0:0] select_2_b;
    wire [0:0] select_3_b;
    wire [0:0] select_4_b;
    wire [0:0] select_5_b;
    wire [0:0] select_6_b;
    wire [0:0] select_7_b;
    wire [0:0] set_start_b;
    wire [31:0] slave_arg_register_join_q;
    wire [2:0] start_address_q;
    reg [0:0] start_r_NO_SHIFT_REG_q;
    wire [0:0] write_done_q;
    wire [0:0] write_reg_q;
    wire [0:0] write_start_reg_q;
    wire [0:0] write_to_address_q;
    wire [0:0] write_to_done_q;
    wire [0:0] write_to_start_address_q;
    wire [31:0] dupName_0_arg_bits_x_b;
    wire [61:0] dupName_0_const_status_pad_x_q;
    wire [63:0] dupName_0_data_and_enable_x_q;
    wire [63:0] dupName_0_next_reg_x_q;
    wire [63:0] dupName_0_not_bitenable_x_q;
    wire [2:0] dupName_0_reg_address_x_q;
    wire [63:0] dupName_0_reg_and_not_enable_x_q;
    wire [31:0] dupName_0_slave_arg_register_join_x_q;
    wire [0:0] dupName_0_write_reg_x_q;
    wire [0:0] dupName_0_write_to_address_x_q;
    wire [63:0] dupName_1_next_reg_x_q;
    wire [2:0] dupName_1_reg_address_x_q;
    wire [63:0] dupName_1_reg_and_not_enable_x_q;
    wire [0:0] dupName_1_write_reg_x_q;
    wire [0:0] dupName_1_write_to_address_x_q;


    // dupName_1_reg_address_x(CONSTANT,106)
    assign dupName_1_reg_address_x_q = $unsigned(3'b110);

    // dupName_1_write_to_address_x(LOGICAL,109)
    assign dupName_1_write_to_address_x_q = $unsigned(avs_cra_address == dupName_1_reg_address_x_q ? 1'b1 : 1'b0);

    // dupName_1_write_reg_x(LOGICAL,108)
    assign dupName_1_write_reg_x_q = avs_cra_write & dupName_1_write_to_address_x_q;

    // select_7(BITSELECT,77)
    assign select_7_b = avs_cra_byteenable[7:7];

    // select_6(BITSELECT,76)
    assign select_6_b = avs_cra_byteenable[6:6];

    // select_5(BITSELECT,75)
    assign select_5_b = avs_cra_byteenable[5:5];

    // select_4(BITSELECT,74)
    assign select_4_b = avs_cra_byteenable[4:4];

    // select_3(BITSELECT,73)
    assign select_3_b = avs_cra_byteenable[3:3];

    // select_2(BITSELECT,72)
    assign select_2_b = avs_cra_byteenable[2:2];

    // select_1(BITSELECT,71)
    assign select_1_b = avs_cra_byteenable[1:1];

    // select_0(BITSELECT,70)
    assign select_0_b = avs_cra_byteenable[0:0];

    // bit_enable(BITJOIN,6)
    assign bit_enable_q = {select_7_b, select_7_b, select_7_b, select_7_b, select_7_b, select_7_b, select_7_b, select_7_b, select_6_b, select_6_b, select_6_b, select_6_b, select_6_b, select_6_b, select_6_b, select_6_b, select_5_b, select_5_b, select_5_b, select_5_b, select_5_b, select_5_b, select_5_b, select_5_b, select_4_b, select_4_b, select_4_b, select_4_b, select_4_b, select_4_b, select_4_b, select_4_b, select_3_b, select_3_b, select_3_b, select_3_b, select_3_b, select_3_b, select_3_b, select_3_b, select_2_b, select_2_b, select_2_b, select_2_b, select_2_b, select_2_b, select_2_b, select_2_b, select_1_b, select_1_b, select_1_b, select_1_b, select_1_b, select_1_b, select_1_b, select_1_b, select_0_b, select_0_b, select_0_b, select_0_b, select_0_b, select_0_b, select_0_b, select_0_b};

    // dupName_0_data_and_enable_x(LOGICAL,94)
    assign dupName_0_data_and_enable_x_q = avs_cra_writedata & bit_enable_q;

    // dupName_0_not_bitenable_x(LOGICAL,96)
    assign dupName_0_not_bitenable_x_q = ~ (bit_enable_q);

    // dupName_1_reg_and_not_enable_x(LOGICAL,107)
    assign dupName_1_reg_and_not_enable_x_q = mm_slave_address_6_data_NO_SHIFT_REG_q & dupName_0_not_bitenable_x_q;

    // dupName_1_next_reg_x(LOGICAL,104)
    assign dupName_1_next_reg_x_q = dupName_1_reg_and_not_enable_x_q | dupName_0_data_and_enable_x_q;

    // mm_slave_address_6_data_NO_SHIFT_REG(REG,44)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            mm_slave_address_6_data_NO_SHIFT_REG_q <= $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);
        end
        else if (dupName_1_write_reg_x_q == 1'b1)
        begin
            mm_slave_address_6_data_NO_SHIFT_REG_q <= dupName_1_next_reg_x_q;
        end
    end

    // dupName_0_reg_address_x(CONSTANT,97)
    assign dupName_0_reg_address_x_q = $unsigned(3'b101);

    // dupName_0_write_to_address_x(LOGICAL,101)
    assign dupName_0_write_to_address_x_q = $unsigned(avs_cra_address == dupName_0_reg_address_x_q ? 1'b1 : 1'b0);

    // dupName_0_write_reg_x(LOGICAL,100)
    assign dupName_0_write_reg_x_q = avs_cra_write & dupName_0_write_to_address_x_q;

    // dupName_0_reg_and_not_enable_x(LOGICAL,98)
    assign dupName_0_reg_and_not_enable_x_q = mm_slave_address_5_data_NO_SHIFT_REG_q & dupName_0_not_bitenable_x_q;

    // dupName_0_next_reg_x(LOGICAL,95)
    assign dupName_0_next_reg_x_q = dupName_0_reg_and_not_enable_x_q | dupName_0_data_and_enable_x_q;

    // mm_slave_address_5_data_NO_SHIFT_REG(REG,43)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            mm_slave_address_5_data_NO_SHIFT_REG_q <= $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);
        end
        else if (dupName_0_write_reg_x_q == 1'b1)
        begin
            mm_slave_address_5_data_NO_SHIFT_REG_q <= dupName_0_next_reg_x_q;
        end
    end

    // const_pad_return(CONSTANT,16)
    assign const_pad_return_q = $unsigned(32'b00000000000000000000000000000000);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // bitenable_lsb(BITSELECT,7)
    assign bitenable_lsb_b = bit_enable_q[0:0];

    // set_start(BITSELECT,78)
    assign set_start_b = avs_cra_writedata[0:0];

    // data_and_enable(LOGICAL,18)
    assign data_and_enable_q = set_start_b & bitenable_lsb_b;

    // start_address(CONSTANT,80)
    assign start_address_q = $unsigned(3'b001);

    // write_to_start_address(LOGICAL,89)
    assign write_to_start_address_q = $unsigned(avs_cra_address == start_address_q ? 1'b1 : 1'b0);

    // write_start_reg(LOGICAL,86)
    assign write_start_reg_q = avs_cra_write & write_to_start_address_q;

    // avs_start(LOGICAL,5)
    assign avs_start_q = write_start_reg_q & data_and_enable_q;

    // component_not_ready(LOGICAL,12)
    assign component_not_ready_q = ~ (mymult_function_out_iord_bl_call_mymult_o_fifoready);

    // busy_and(LOGICAL,8)
    assign busy_and_q = component_not_ready_q & start_r_NO_SHIFT_REG_q;

    // next_start(LOGICAL,48)
    assign next_start_q = busy_and_q | avs_start_q;

    // start_r_NO_SHIFT_REG(REG,81)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            start_r_NO_SHIFT_REG_q <= $unsigned(1'b0);
        end
        else
        begin
            start_r_NO_SHIFT_REG_q <= next_start_q;
        end
    end

    // dupName_0_arg_bits_x(BITSELECT,91)
    assign dupName_0_arg_bits_x_b = mm_slave_address_6_data_NO_SHIFT_REG_q[31:0];

    // dupName_0_slave_arg_register_join_x(BITJOIN,99)
    assign dupName_0_slave_arg_register_join_x_q = dupName_0_arg_bits_x_b;

    // arg_bits(BITSELECT,2)
    assign arg_bits_b = mm_slave_address_5_data_NO_SHIFT_REG_q[31:0];

    // slave_arg_register_join(BITJOIN,79)
    assign slave_arg_register_join_q = arg_bits_b;

    // implicit_input(BITJOIN,27)
    assign implicit_input_q = {dupName_0_slave_arg_register_join_x_q, slave_arg_register_join_q};

    // mymult_function(BLACKBOX,45)
    mymult_function themymult_function (
        .in_arg_call(call_const_q),
        .in_arg_return(call_const_q),
        .in_iord_bl_call_mymult_i_fifodata(implicit_input_q),
        .in_iord_bl_call_mymult_i_fifovalid(start_r_NO_SHIFT_REG_q),
        .in_stall_in(GND_q),
        .in_valid_in(VCC_q),
        .out_iord_bl_call_mymult_o_fifoalmost_full(mymult_function_out_iord_bl_call_mymult_o_fifoalmost_full),
        .out_iord_bl_call_mymult_o_fifoready(mymult_function_out_iord_bl_call_mymult_o_fifoready),
        .out_iowr_nb_return_mymult_o_fifodata(mymult_function_out_iowr_nb_return_mymult_o_fifodata),
        .out_iowr_nb_return_mymult_o_fifovalid(mymult_function_out_iowr_nb_return_mymult_o_fifovalid),
        .out_stall_out(),
        .out_valid_out(),
        .clock(clock),
        .resetn(resetn)
    );

    // return_data_r_NO_SHIFT_REG(REG,68)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            return_data_r_NO_SHIFT_REG_q <= $unsigned(32'b00000000000000000000000000000000);
        end
        else if (mymult_function_out_iowr_nb_return_mymult_o_fifovalid == 1'b1)
        begin
            return_data_r_NO_SHIFT_REG_q <= mymult_function_out_iowr_nb_return_mymult_o_fifodata;
        end
    end

    // return_reg_join(BITJOIN,69)
    assign return_reg_join_q = {const_pad_return_q, return_data_r_NO_SHIFT_REG_q};

    // dupName_0_const_status_pad_x(CONSTANT,93)
    assign dupName_0_const_status_pad_x_q = $unsigned(62'b00000000000000000000000000000000000000000000000000000000000000);

    // not_start(LOGICAL,52)
    assign not_start_q = ~ (start_r_NO_SHIFT_REG_q);

    // done_and(LOGICAL,20)
    assign done_and_q = done_r_NO_SHIFT_REG_q & not_start_q;

    // done_or(LOGICAL,22)
    assign done_or_q = mymult_function_out_iowr_nb_return_mymult_o_fifovalid | done_and_q;

    // done_r_NO_SHIFT_REG(REG,23)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            done_r_NO_SHIFT_REG_q <= $unsigned(1'b1);
        end
        else
        begin
            done_r_NO_SHIFT_REG_q <= done_or_q;
        end
    end

    // done_address(CONSTANT,19)
    assign done_address_q = $unsigned(3'b011);

    // write_to_done(LOGICAL,88)
    assign write_to_done_q = $unsigned(avs_cra_address == done_address_q ? 1'b1 : 1'b0);

    // write_done(LOGICAL,83)
    assign write_done_q = write_to_done_q & avs_cra_write;

    // reset_done(LOGICAL,64)
    assign reset_done_q = write_done_q & data_and_enable_q;

    // not_reset_done(LOGICAL,51)
    assign not_reset_done_q = ~ (reset_done_q);

    // hold_done(LOGICAL,25)
    assign hold_done_q = not_reset_done_q & interrupt_r_NO_SHIFT_REG_q;

    // next_done(LOGICAL,46)
    assign next_done_q = hold_done_q | mymult_function_out_iowr_nb_return_mymult_o_fifovalid;

    // interrupt_r_NO_SHIFT_REG(REG,42)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            interrupt_r_NO_SHIFT_REG_q <= $unsigned(1'b0);
        end
        else
        begin
            interrupt_r_NO_SHIFT_REG_q <= next_done_q;
        end
    end

    // done_join(BITJOIN,21)
    assign done_join_q = {dupName_0_const_status_pad_x_q, done_r_NO_SHIFT_REG_q, interrupt_r_NO_SHIFT_REG_q};

    // const_status_pad(CONSTANT,17)
    assign const_status_pad_q = $unsigned(63'b000000000000000000000000000000000000000000000000000000000000000);

    // reg_address(CONSTANT,61)
    assign reg_address_q = $unsigned(3'b010);

    // write_to_address(LOGICAL,87)
    assign write_to_address_q = $unsigned(avs_cra_address == reg_address_q ? 1'b1 : 1'b0);

    // write_reg(LOGICAL,85)
    assign write_reg_q = avs_cra_write & write_to_address_q;

    // not_bitenable(LOGICAL,49)
    assign not_bitenable_q = ~ (bitenable_lsb_b);

    // reg_and_not_enable(LOGICAL,62)
    assign reg_and_not_enable_q = interrupt_mask_r_NO_SHIFT_REG_q & not_bitenable_q;

    // next_reg(LOGICAL,47)
    assign next_reg_q = reg_and_not_enable_q | data_and_enable_q;

    // interrupt_mask_r_NO_SHIFT_REG(REG,41)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            interrupt_mask_r_NO_SHIFT_REG_q <= $unsigned(1'b0);
        end
        else if (write_reg_q == 1'b1)
        begin
            interrupt_mask_r_NO_SHIFT_REG_q <= next_reg_q;
        end
    end

    // instmask_join(BITJOIN,40)
    assign instmask_join_q = {const_status_pad_q, interrupt_mask_r_NO_SHIFT_REG_q};

    // call_const(CONSTANT,11)
    assign call_const_q = $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);

    // reset_wire_inst(EXTIFACE,65)
    assign reset_wire_inst_o_resetn[0] = reset_wire_inst_o_resetn_bitsignaltemp;
    acl_reset_wire thereset_wire_inst (
        .o_resetn(reset_wire_inst_o_resetn_bitsignaltemp),
        .clock(clock),
        .resetn(resetn)
    );

    // pos_reset(LOGICAL,60)
    assign pos_reset_q = ~ (reset_wire_inst_o_resetn);

    // busy_or(LOGICAL,10)
    assign busy_or_q = pos_reset_q | busy_and_q;

    // busy_join(BITJOIN,9)
    assign busy_join_q = {const_status_pad_q, busy_or_q};

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // avs_readdata_mux(MUX,4)
    assign avs_readdata_mux_s = avs_cra_address;
    always @(avs_readdata_mux_s or busy_join_q or call_const_q or instmask_join_q or done_join_q or return_reg_join_q or mm_slave_address_5_data_NO_SHIFT_REG_q or mm_slave_address_6_data_NO_SHIFT_REG_q)
    begin
        unique case (avs_readdata_mux_s)
            3'b000 : avs_readdata_mux_q = busy_join_q;
            3'b001 : avs_readdata_mux_q = call_const_q;
            3'b010 : avs_readdata_mux_q = instmask_join_q;
            3'b011 : avs_readdata_mux_q = done_join_q;
            3'b100 : avs_readdata_mux_q = return_reg_join_q;
            3'b101 : avs_readdata_mux_q = mm_slave_address_5_data_NO_SHIFT_REG_q;
            3'b110 : avs_readdata_mux_q = mm_slave_address_6_data_NO_SHIFT_REG_q;
            default : avs_readdata_mux_q = 64'b0;
        endcase
    end

    // avs_cra_readdata_r_NO_SHIFT_REG(REG,3)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            avs_cra_readdata_r_NO_SHIFT_REG_q <= $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);
        end
        else
        begin
            avs_cra_readdata_r_NO_SHIFT_REG_q <= avs_readdata_mux_q;
        end
    end

    // avs_cra_readdata(GPOUT,53)
    assign avs_cra_readdata = avs_cra_readdata_r_NO_SHIFT_REG_q;

    // avs_cra_readdatavalid(GPOUT,54)
    assign avs_cra_readdatavalid = GND_q;

    // avst_iord_bl_call_mymult_almost_full(GPOUT,55)
    assign avst_iord_bl_call_mymult_almost_full = mymult_function_out_iord_bl_call_mymult_o_fifoalmost_full;

    // avst_iord_bl_call_mymult_ready(GPOUT,56)
    assign avst_iord_bl_call_mymult_ready = mymult_function_out_iord_bl_call_mymult_o_fifoready;

    // avst_iowr_nb_return_mymult_data(GPOUT,57)
    assign avst_iowr_nb_return_mymult_data = mymult_function_out_iowr_nb_return_mymult_o_fifodata;

    // avst_iowr_nb_return_mymult_valid(GPOUT,58)
    assign avst_iowr_nb_return_mymult_valid = mymult_function_out_iowr_nb_return_mymult_o_fifovalid;

    // done_irq(GPOUT,59)
    assign done_irq = interrupt_r_NO_SHIFT_REG_q;

endmodule
