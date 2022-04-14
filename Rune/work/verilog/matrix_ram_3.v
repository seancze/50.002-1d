/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     ADDRESS_SIZE = 4
     MATRIX_WIDTH = 64
*/
module matrix_ram_3 (
    input clk,
    input rst,
    input [3:0] row_address,
    input [5:0] col_address,
    input [3:0] row_address_top,
    input [5:0] col_address_top,
    input we_top,
    input [2:0] wd_top,
    input [3:0] row_address_btm,
    input [5:0] col_address_btm,
    input we_btm,
    input [2:0] wd_btm,
    input ready,
    output reg [2:0] top_out,
    output reg [2:0] bottom_out
  );
  
  localparam ADDRESS_SIZE = 3'h4;
  localparam MATRIX_WIDTH = 7'h40;
  
  
  wire [3-1:0] M_top_ram_read_data;
  reg [10-1:0] M_top_ram_waddr;
  reg [3-1:0] M_top_ram_write_data;
  reg [1-1:0] M_top_ram_write_en;
  reg [10-1:0] M_top_ram_raddr;
  simple_dual_ram_10 #(.SIZE(2'h3), .DEPTH(12'h400)) top_ram (
    .rclk(clk),
    .wclk(clk),
    .waddr(M_top_ram_waddr),
    .write_data(M_top_ram_write_data),
    .write_en(M_top_ram_write_en),
    .raddr(M_top_ram_raddr),
    .read_data(M_top_ram_read_data)
  );
  
  wire [3-1:0] M_bottom_ram_read_data;
  reg [10-1:0] M_bottom_ram_waddr;
  reg [3-1:0] M_bottom_ram_write_data;
  reg [1-1:0] M_bottom_ram_write_en;
  reg [10-1:0] M_bottom_ram_raddr;
  simple_dual_ram_10 #(.SIZE(2'h3), .DEPTH(12'h400)) bottom_ram (
    .rclk(clk),
    .wclk(clk),
    .waddr(M_bottom_ram_waddr),
    .write_data(M_bottom_ram_write_data),
    .write_en(M_bottom_ram_write_en),
    .raddr(M_bottom_ram_raddr),
    .read_data(M_bottom_ram_read_data)
  );
  
  always @* begin
    M_top_ram_raddr = 1'h0;
    M_top_ram_waddr = row_address_top * 7'h40 + col_address_top;
    M_top_ram_write_data = wd_top;
    M_top_ram_write_en = we_top;
    M_bottom_ram_raddr = 1'h0;
    M_bottom_ram_waddr = row_address_btm * 7'h40 + col_address_btm;
    M_bottom_ram_write_data = wd_btm;
    M_bottom_ram_write_en = we_btm;
    top_out = 1'h0;
    bottom_out = 1'h0;
    if (ready) begin
      M_top_ram_raddr = row_address * 7'h40 + col_address;
      M_bottom_ram_raddr = row_address * 7'h40 + col_address;
      top_out = M_top_ram_read_data;
      bottom_out = M_bottom_ram_read_data;
    end
  end
endmodule
