/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module ra2sel_18 (
    input [3:0] ra,
    input [3:0] rb_data,
    input ra2sel,
    output reg [3:0] out
  );
  
  
  
  always @* begin
    if (ra2sel == 1'h0) begin
      out = ra;
    end else begin
      out = rb_data;
    end
  end
endmodule