/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [16-1:0] M_manual_out;
  wire [16-1:0] M_manual_out_segs;
  reg [2-1:0] M_manual_button;
  reg [16-1:0] M_manual_dip;
  reg [1-1:0] M_manual_inv;
  alu_tester_1 manual (
    .clk(clk),
    .rst(rst),
    .button(M_manual_button),
    .dip(M_manual_dip),
    .inv(M_manual_inv),
    .out(M_manual_out),
    .out_segs(M_manual_out_segs)
  );
  
  wire [3-1:0] M_auto_out_state;
  wire [2-1:0] M_auto_out_status;
  wire [16-1:0] M_auto_out_led;
  reg [3-1:0] M_auto_button;
  reg [1-1:0] M_auto_inv;
  auto_tester_2 auto (
    .clk(clk),
    .rst(rst),
    .button(M_auto_button),
    .inv(M_auto_inv),
    .out_state(M_auto_out_state),
    .out_status(M_auto_out_status),
    .out_led(M_auto_out_led)
  );
  
  wire [(3'h4+0)-1:0] M_buttoncond_out;
  reg [(3'h4+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<3'h4;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_3 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(3'h4+0)-1:0] M_buttondetector_out;
  reg [(3'h4+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<3'h4;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_4 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_5 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  
  localparam MAN_tester = 1'd0;
  localparam AUTO_tester = 1'd1;
  
  reg M_tester_d, M_tester_q = MAN_tester;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_6 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  always @* begin
    M_tester_d = M_tester_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'h7;
    M_buttoncond_in = io_button[1+3-:4];
    M_buttondetector_in = M_buttoncond_out;
    M_seg_values = 16'hffff;
    M_manual_button = M_buttondetector_out[0+1-:2];
    M_manual_inv = io_dip[0+0+0-:1];
    M_manual_dip[8+7-:8] = io_dip[16+7-:8];
    M_manual_dip[0+7-:8] = io_dip[8+7-:8];
    M_auto_button[0+1-:2] = M_buttondetector_out[2+1-:2];
    M_auto_button[2+0-:1] = M_buttondetector_out[0+0-:1];
    M_auto_inv = io_dip[0+0+0-:1];
    io_led[0+0+0-:1] = io_dip[0+0+0-:1];
    
    case (M_tester_q)
      MAN_tester: begin
        io_led[16+7-:8] = M_manual_out[8+7-:8];
        io_led[8+7-:8] = M_manual_out[0+7-:8];
        M_seg_values = M_manual_out_segs;
        if (M_buttondetector_out[0+0-:1]) begin
          M_tester_d = AUTO_tester;
        end
        io_seg = ~M_seg_seg;
        io_sel = ~M_seg_sel;
      end
      AUTO_tester: begin
        if (M_auto_out_state == 1'h0) begin
          M_seg_values = 16'h0dc8;
        end else begin
          
          case (M_auto_out_state)
            1'h1: begin
              M_seg_values[4+11-:12] = 12'h033;
              io_led[16+7-:8] = M_auto_out_led[8+7-:8];
              io_led[8+7-:8] = M_auto_out_led[0+7-:8];
            end
            2'h2: begin
              M_seg_values[4+11-:12] = 12'h29a;
            end
            2'h3: begin
              M_seg_values[4+11-:12] = 12'h188;
            end
            3'h4: begin
              M_seg_values[4+11-:12] = 12'hb5c;
            end
            3'h5: begin
              M_seg_values[4+11-:12] = 12'h7d6;
            end
            3'h6: begin
              M_seg_values[4+11-:12] = 12'h4aa;
            end
          endcase
          
          case (M_auto_out_status)
            1'h1: begin
              M_seg_values[0+3-:4] = 4'h9;
            end
            2'h2: begin
              M_seg_values[0+3-:4] = 4'h5;
            end
          endcase
        end
        io_seg = ~M_seg_seg;
        io_sel = ~M_seg_sel;
        if (M_buttondetector_out[0+0-:1]) begin
          M_tester_d = MAN_tester;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_tester_q <= 1'h0;
    end else begin
      M_tester_q <= M_tester_d;
    end
  end
  
endmodule
