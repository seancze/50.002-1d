/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_19 (
    input alufn0,
    input [15:0] a,
    input [15:0] b,
    input [0:0] inv,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] sum;
  
  always @* begin
    
    case (alufn0)
      1'h0: begin
        sum = a + b;
        v = (a[15+0-:1] & b[15+0-:1] & ~sum[15+0-:1]) | (~a[15+0-:1] & ~b[15+0-:1] & sum[15+0-:1]);
      end
      1'h1: begin
        sum = a - b;
        v = (a[15+0-:1] & ~b[15+0-:1] & ~sum[15+0-:1]) | (~a[15+0-:1] & b[15+0-:1] & sum[15+0-:1]);
      end
      default: begin
        sum = a + b;
        v = (a[15+0-:1] & b[15+0-:1] & ~sum[15+0-:1]) | (~a[15+0-:1] & b[15+0-:1] & sum[15+0-:1]);
      end
    endcase
    if (inv) begin
      out = sum ^ 16'h0001;
    end else begin
      out = sum;
    end
    n = sum[15+0-:1];
    z = ~(|sum);
  end
endmodule
