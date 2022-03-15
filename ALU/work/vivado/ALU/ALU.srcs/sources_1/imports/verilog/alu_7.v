/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_7 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    input [0:0] inv,
    output reg [15:0] out,
    output reg [3:0] z,
    output reg [3:0] v,
    output reg [3:0] n
  );
  
  
  
  wire [16-1:0] M_cmp_out;
  reg [6-1:0] M_cmp_alufn;
  reg [1-1:0] M_cmp_z;
  reg [1-1:0] M_cmp_n;
  reg [1-1:0] M_cmp_v;
  comparator_18 cmp (
    .alufn(M_cmp_alufn),
    .z(M_cmp_z),
    .n(M_cmp_n),
    .v(M_cmp_v),
    .out(M_cmp_out)
  );
  
  wire [16-1:0] M_add_out;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [1-1:0] M_add_alufn0;
  reg [16-1:0] M_add_a;
  reg [16-1:0] M_add_b;
  reg [1-1:0] M_add_inv;
  adder_19 add (
    .alufn0(M_add_alufn0),
    .a(M_add_a),
    .b(M_add_b),
    .inv(M_add_inv),
    .out(M_add_out),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  wire [16-1:0] M_shift_out;
  reg [16-1:0] M_shift_a;
  reg [5-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  shifter_20 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .out(M_shift_out)
  );
  
  wire [16-1:0] M_bool_out;
  reg [16-1:0] M_bool_a;
  reg [16-1:0] M_bool_b;
  reg [4-1:0] M_bool_alufn;
  boolean_21 bool (
    .a(M_bool_a),
    .b(M_bool_b),
    .alufn(M_bool_alufn),
    .out(M_bool_out)
  );
  
  wire [16-1:0] M_mult_out;
  reg [16-1:0] M_mult_a;
  reg [16-1:0] M_mult_b;
  multiplier_22 mult (
    .a(M_mult_a),
    .b(M_mult_b),
    .out(M_mult_out)
  );
  
  always @* begin
    M_add_alufn0 = alufn[0+0-:1];
    M_add_a = a;
    M_add_b = b;
    M_add_inv = inv;
    M_bool_alufn = alufn[0+3-:4];
    M_bool_a = a;
    M_bool_b = b;
    M_cmp_alufn[2+0-:1] = alufn[2+0-:1];
    M_cmp_alufn[1+0-:1] = alufn[1+0-:1];
    M_cmp_z = 1'h0;
    M_cmp_n = 1'h0;
    M_cmp_v = 1'h0;
    M_shift_alufn[0+0-:1] = alufn[0+0-:1];
    M_shift_alufn[1+0-:1] = alufn[1+0-:1];
    M_shift_a = a;
    M_shift_b = b[0+3-:4];
    M_mult_a = a;
    M_mult_b = b;
    z = 4'h0;
    v = 4'h0;
    n = 4'h0;
    
    case (alufn[5+0-:1])
      1'h0: begin
        
        case (alufn[4+0-:1])
          1'h0: begin
            if (alufn[1+0-:1] == 1'h0) begin
              out = M_add_out;
              z = M_add_z;
              v = M_add_v;
              n = M_add_n;
            end else begin
              out = M_mult_out;
            end
          end
          1'h1: begin
            out = M_bool_out;
          end
        endcase
      end
      1'h1: begin
        
        case (alufn[4+0-:1])
          1'h0: begin
            out = M_shift_out;
          end
          1'h1: begin
            M_cmp_z = M_add_z;
            M_cmp_n = M_add_n;
            M_cmp_v = M_add_v;
            out = M_cmp_out;
          end
        endcase
      end
    endcase
  end
endmodule
