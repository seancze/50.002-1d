/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module full_circuit_4 (
    input clk,
    input rst,
    input reset_button,
    input start_button,
    input left,
    input right,
    input up,
    input down,
    output reg [15:0] timer,
    output reg [15:0] score,
    output reg [159:0] out
  );
  
  
  
  wire [1-1:0] M_game_timer_detector_out;
  reg [1-1:0] M_game_timer_detector_in;
  edge_detector_8 game_timer_detector (
    .clk(clk),
    .in(M_game_timer_detector_in),
    .out(M_game_timer_detector_out)
  );
  wire [1-1:0] M_vi_detector_out;
  reg [1-1:0] M_vi_detector_in;
  edge_detector_8 vi_detector (
    .clk(clk),
    .in(M_vi_detector_in),
    .out(M_vi_detector_out)
  );
  wire [1-1:0] M_vi_ur_detector_out;
  reg [1-1:0] M_vi_ur_detector_in;
  edge_detector_8 vi_ur_detector (
    .clk(clk),
    .in(M_vi_ur_detector_in),
    .out(M_vi_ur_detector_out)
  );
  wire [1-1:0] M_slow_timer_value;
  counter_12 slow_timer (
    .clk(clk),
    .rst(rst),
    .value(M_slow_timer_value)
  );
  wire [1-1:0] M_vi_out;
  wire [16-1:0] M_vi_debug;
  variable_counter_13 vi (
    .clk(clk),
    .rst(rst),
    .out(M_vi_out),
    .debug(M_vi_debug)
  );
  wire [1-1:0] M_vi_ur_out;
  wire [16-1:0] M_vi_ur_debug;
  variable_counter_unrestricted_14 vi_ur (
    .clk(clk),
    .rst(rst),
    .out(M_vi_ur_out),
    .debug(M_vi_ur_debug)
  );
  wire [1-1:0] M_cu_we;
  wire [4-1:0] M_cu_ra;
  wire [4-1:0] M_cu_rb;
  wire [4-1:0] M_cu_rc;
  wire [1-1:0] M_cu_asel;
  wire [3-1:0] M_cu_bsel;
  wire [2-1:0] M_cu_wdsel;
  wire [1-1:0] M_cu_wasel;
  wire [1-1:0] M_cu_ra2sel;
  wire [6-1:0] M_cu_alufn;
  reg [16-1:0] M_cu_rb_data;
  reg [1-1:0] M_cu_st;
  reg [1-1:0] M_cu_vi;
  reg [1-1:0] M_cu_vi_ur;
  reg [1-1:0] M_cu_reset_button;
  reg [1-1:0] M_cu_start_button;
  reg [1-1:0] M_cu_left_arrow;
  reg [1-1:0] M_cu_right_arrow;
  reg [1-1:0] M_cu_up_arrow;
  reg [1-1:0] M_cu_down_arrow;
  game_CU_15 cu (
    .clk(clk),
    .rst(rst),
    .rb_data(M_cu_rb_data),
    .st(M_cu_st),
    .vi(M_cu_vi),
    .vi_ur(M_cu_vi_ur),
    .reset_button(M_cu_reset_button),
    .start_button(M_cu_start_button),
    .left_arrow(M_cu_left_arrow),
    .right_arrow(M_cu_right_arrow),
    .up_arrow(M_cu_up_arrow),
    .down_arrow(M_cu_down_arrow),
    .we(M_cu_we),
    .ra(M_cu_ra),
    .rb(M_cu_rb),
    .rc(M_cu_rc),
    .asel(M_cu_asel),
    .bsel(M_cu_bsel),
    .wdsel(M_cu_wdsel),
    .wasel(M_cu_wasel),
    .ra2sel(M_cu_ra2sel),
    .alufn(M_cu_alufn)
  );
  wire [16-1:0] M_rf_ra_data;
  wire [16-1:0] M_rf_rb_data;
  wire [16-1:0] M_rf_score;
  wire [16-1:0] M_rf_timer;
  wire [160-1:0] M_rf_out;
  reg [4-1:0] M_rf_ra;
  reg [4-1:0] M_rf_rb;
  reg [4-1:0] M_rf_rc;
  reg [1-1:0] M_rf_we;
  reg [16-1:0] M_rf_write_data;
  regfile_16 rf (
    .clk(clk),
    .ra(M_rf_ra),
    .rb(M_rf_rb),
    .rc(M_rf_rc),
    .we(M_rf_we),
    .write_data(M_rf_write_data),
    .ra_data(M_rf_ra_data),
    .rb_data(M_rf_rb_data),
    .score(M_rf_score),
    .timer(M_rf_timer),
    .out(M_rf_out)
  );
  
  wire [16-1:0] M_alu_unit_out;
  wire [4-1:0] M_alu_unit_z;
  wire [4-1:0] M_alu_unit_v;
  wire [4-1:0] M_alu_unit_n;
  reg [6-1:0] M_alu_unit_alufn;
  reg [16-1:0] M_alu_unit_a;
  reg [16-1:0] M_alu_unit_b;
  alu_17 alu_unit (
    .alufn(M_alu_unit_alufn),
    .a(M_alu_unit_a),
    .b(M_alu_unit_b),
    .out(M_alu_unit_out),
    .z(M_alu_unit_z),
    .v(M_alu_unit_v),
    .n(M_alu_unit_n)
  );
  
  wire [4-1:0] M_wasel_mux_out;
  reg [4-1:0] M_wasel_mux_rc;
  reg [4-1:0] M_wasel_mux_rb_data;
  reg [1-1:0] M_wasel_mux_wasel;
  wasel_18 wasel_mux (
    .rc(M_wasel_mux_rc),
    .rb_data(M_wasel_mux_rb_data),
    .wasel(M_wasel_mux_wasel),
    .out(M_wasel_mux_out)
  );
  
  wire [4-1:0] M_ra2sel_mux_out;
  reg [4-1:0] M_ra2sel_mux_ra;
  reg [4-1:0] M_ra2sel_mux_rb_data;
  reg [1-1:0] M_ra2sel_mux_ra2sel;
  ra2sel_19 ra2sel_mux (
    .ra(M_ra2sel_mux_ra),
    .rb_data(M_ra2sel_mux_rb_data),
    .ra2sel(M_ra2sel_mux_ra2sel),
    .out(M_ra2sel_mux_out)
  );
  
  wire [16-1:0] M_asel_mux_out;
  reg [16-1:0] M_asel_mux_ra_data;
  reg [1-1:0] M_asel_mux_asel;
  asel_20 asel_mux (
    .ra_data(M_asel_mux_ra_data),
    .asel(M_asel_mux_asel),
    .out(M_asel_mux_out)
  );
  
  wire [16-1:0] M_bsel_mux_out;
  reg [16-1:0] M_bsel_mux_rb_data;
  reg [3-1:0] M_bsel_mux_bsel;
  bsel_21 bsel_mux (
    .rb_data(M_bsel_mux_rb_data),
    .bsel(M_bsel_mux_bsel),
    .out(M_bsel_mux_out)
  );
  
  wire [16-1:0] M_wdsel_mux_out;
  reg [16-1:0] M_wdsel_mux_alu;
  reg [2-1:0] M_wdsel_mux_wdsel;
  wdsel_22 wdsel_mux (
    .alu(M_wdsel_mux_alu),
    .wdsel(M_wdsel_mux_wdsel),
    .out(M_wdsel_mux_out)
  );
  
  always @* begin
    M_game_timer_detector_in = M_slow_timer_value;
    M_cu_st = M_game_timer_detector_out;
    M_vi_detector_in = M_vi_out;
    M_cu_vi = M_vi_detector_out;
    M_vi_ur_detector_in = M_vi_ur_out;
    M_cu_vi_ur = M_vi_ur_detector_out;
    M_cu_reset_button = reset_button;
    M_cu_start_button = start_button;
    M_cu_rb_data = M_rf_rb_data;
    M_cu_left_arrow = left;
    M_cu_right_arrow = right;
    M_cu_up_arrow = up;
    M_cu_down_arrow = down;
    M_rf_we = M_cu_we;
    M_rf_rb = M_cu_rb;
    M_ra2sel_mux_ra = M_cu_ra;
    M_ra2sel_mux_rb_data = M_rf_rb_data[0+3-:4];
    M_ra2sel_mux_ra2sel = M_cu_ra2sel;
    M_rf_ra = M_ra2sel_mux_out;
    M_wasel_mux_rc = M_cu_rc;
    M_wasel_mux_rb_data = M_rf_rb_data[0+3-:4];
    M_wasel_mux_wasel = M_cu_wasel;
    M_rf_rc = M_wasel_mux_out;
    M_asel_mux_asel = M_cu_asel;
    M_asel_mux_ra_data = M_rf_ra_data;
    M_alu_unit_a = M_asel_mux_out;
    M_bsel_mux_bsel = M_cu_bsel;
    M_bsel_mux_rb_data = M_rf_rb_data;
    M_alu_unit_b = M_bsel_mux_out;
    M_alu_unit_alufn = M_cu_alufn;
    M_wdsel_mux_alu = M_alu_unit_out;
    M_wdsel_mux_wdsel = M_cu_wdsel;
    M_rf_write_data = M_wdsel_mux_out;
    timer = M_rf_timer;
    score = M_rf_score;
    out = M_rf_out;
  end
endmodule
