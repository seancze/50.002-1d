/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_16 (
    input [3:0] char,
    output reg [6:0] segs
  );
  
  
  
  always @* begin
    
    case (char)
      1'h0: begin
        segs = 7'h77;
      end
      1'h1: begin
        segs = 7'h7c;
      end
      2'h2: begin
        segs = 7'h39;
      end
      2'h3: begin
        segs = 7'h5e;
      end
      3'h4: begin
        segs = 7'h79;
      end
      3'h5: begin
        segs = 7'h71;
      end
      3'h6: begin
        segs = 7'h30;
      end
      3'h7: begin
        segs = 7'h2b;
      end
      4'h8: begin
        segs = 7'h5c;
      end
      4'h9: begin
        segs = 7'h73;
      end
      4'ha: begin
        segs = 7'h50;
      end
      4'hb: begin
        segs = 7'h6d;
      end
      4'hc: begin
        segs = 7'h78;
      end
      4'hd: begin
        segs = 7'h1c;
      end
      4'he: begin
        segs = 7'h06;
      end
      default: begin
        segs = 7'h00;
      end
    endcase
  end
endmodule
