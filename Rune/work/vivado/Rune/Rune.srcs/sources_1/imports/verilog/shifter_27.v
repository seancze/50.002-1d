/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_27 (
    input [15:0] a,
    input [4:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  integer b_unsigned;
  
  reg [15:0] temp;
  
  always @* begin
    out = 1'h0;
    b_unsigned = $unsigned(b);
    
    case (alufn[0+1-:2])
      2'h0: begin
        temp = a << b_unsigned;
      end
      2'h1: begin
        temp = a >> b_unsigned;
      end
      2'h3: begin
        temp = $signed(a) >>> b_unsigned;
      end
      default: begin
        temp = a << b_unsigned;
      end
    endcase
    out = temp;
  end
endmodule
