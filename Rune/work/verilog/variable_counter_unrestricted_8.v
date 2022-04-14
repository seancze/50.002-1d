/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     SEED = 128h843233523a613966423b622562592c62
*/
module variable_counter_unrestricted_8 (
    input clk,
    input rst,
    output reg out,
    output reg [15:0] debug
  );
  
  localparam SEED = 128'h843233523a613966423b622562592c62;
  
  
  wire [1-1:0] M_edge_detector_rng_out;
  reg [1-1:0] M_edge_detector_rng_in;
  edge_detector_21 edge_detector_rng (
    .clk(clk),
    .in(M_edge_detector_rng_in),
    .out(M_edge_detector_rng_out)
  );
  wire [1-1:0] M_edge_detector_seed_out;
  reg [1-1:0] M_edge_detector_seed_in;
  edge_detector_21 edge_detector_seed (
    .clk(clk),
    .in(M_edge_detector_seed_in),
    .out(M_edge_detector_seed_out)
  );
  reg [15:0] M_seed_d, M_seed_q = 1'h0;
  wire [1-1:0] M_slowclock_forvariablecounter_value;
  counter_24 slowclock_forvariablecounter (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_forvariablecounter_value)
  );
  wire [1-1:0] M_slowerclock_value;
  counter_24 slowerclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowerclock_value)
  );
  wire [32-1:0] M_random_number_num;
  reg [1-1:0] M_random_number_next;
  reg [32-1:0] M_random_number_seed;
  pn_gen_23 random_number (
    .clk(clk),
    .rst(rst),
    .next(M_random_number_next),
    .seed(M_random_number_seed),
    .num(M_random_number_num)
  );
  
  reg [3:0] temp_pointer;
  
  always @* begin
    M_seed_d = M_seed_q;
    
    out = 1'h0;
    M_random_number_seed = M_seed_q;
    M_edge_detector_rng_in = M_slowerclock_value;
    M_random_number_next = M_edge_detector_rng_out;
    M_edge_detector_seed_in = M_slowclock_forvariablecounter_value;
    temp_pointer = M_random_number_num[0+3-:4];
    debug = M_random_number_num;
    if (M_edge_detector_seed_out) begin
      M_seed_d = M_seed_q + 1'h1;
    end
    
    case (temp_pointer[0+2-:3])
      1'h0: begin
        out = M_seed_q[0+0-:1];
      end
      1'h1: begin
        out = M_seed_q[1+0-:1];
      end
      2'h2: begin
        out = M_seed_q[2+0-:1];
      end
      2'h3: begin
        out = M_seed_q[3+0-:1];
      end
      3'h4: begin
        out = M_seed_q[4+0-:1];
      end
      3'h5: begin
        out = M_seed_q[5+0-:1];
      end
      3'h6: begin
        out = M_seed_q[6+0-:1];
      end
      3'h7: begin
        out = M_seed_q[7+0-:1];
      end
      4'h8: begin
        out = M_seed_q[8+0-:1];
      end
      4'h9: begin
        out = M_seed_q[9+0-:1];
      end
      4'ha: begin
        out = M_seed_q[10+0-:1];
      end
      4'hb: begin
        out = M_seed_q[11+0-:1];
      end
      4'hc: begin
        out = M_seed_q[12+0-:1];
      end
      4'hd: begin
        out = M_seed_q[13+0-:1];
      end
      4'he: begin
        out = M_seed_q[14+0-:1];
      end
      4'hf: begin
        out = M_seed_q[15+0-:1];
        out = 1'h0;
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_seed_q <= M_seed_d;
  end
  
endmodule
