/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     ADDRESS_SIZE = 4
     MATRIX_WIDTH = 64
     DATA_WIDTH = 16
     DATA_SET = 3
*/
module matrix_ram_writer_2 (
    input clk,
    input rst,
    input [47:0] new_data,
    input [4:0] button_clicked,
    input [3:0] level_input,
    input [143:0] arrow_type_input,
    input [3:0] timer,
    input [3:0] score,
    output reg [3:0] row_address_top,
    output reg [5:0] col_address_top,
    output reg we_top,
    output reg [2:0] wd_top,
    output reg [3:0] row_address_btm,
    output reg [5:0] col_address_btm,
    output reg we_btm,
    output reg [2:0] wd_btm,
    output reg ready
  );
  
  localparam ADDRESS_SIZE = 3'h4;
  localparam MATRIX_WIDTH = 7'h40;
  localparam DATA_WIDTH = 5'h10;
  localparam DATA_SET = 2'h3;
  
  
  
  localparam START_writer_state = 3'd0;
  localparam LOAD_ADDRESS_writer_state = 3'd1;
  localparam LOAD_WAIT_writer_state = 3'd2;
  localparam LOOP_writer_state = 3'd3;
  localparam WAIT_FOR_NEXT_LEVEL_writer_state = 3'd4;
  
  reg [2:0] M_writer_state_d, M_writer_state_q = START_writer_state;
  
  
  localparam READY_button_state = 1'd0;
  localparam LOADING_button_state = 1'd1;
  
  reg M_button_state_d, M_button_state_q = READY_button_state;
  
  localparam NUM_ARROW_TYPES = 4'h9;
  
  localparam MAX_LEVEL = 4'h9;
  
  localparam START_DATA = 48'h787f7fe07fff;
  
  localparam PSEUDO_OFFSET = 96'h8208204a44a4c20410318930;
  
  wire [192-1:0] M_rom_arrow;
  wire [3-1:0] M_rom_colour;
  reg [4-1:0] M_rom_choice;
  arrow_rom_9 rom (
    .choice(M_rom_choice),
    .arrow(M_rom_arrow),
    .colour(M_rom_colour)
  );
  
  reg [3:0] M_bitloader_d, M_bitloader_q = 1'h0;
  
  reg [47:0] M_data_d, M_data_q = 1'h0;
  
  reg [3:0] M_prev_arrows_d, M_prev_arrows_q = 1'h0;
  
  reg [3:0] M_current_arrow_d, M_current_arrow_q = 1'h0;
  
  reg [3:0] M_current_level_d, M_current_level_q = 1'h0;
  
  reg [5:0] M_data_col_address_d, M_data_col_address_q = 1'h0;
  
  reg [3:0] M_data_row_address_d, M_data_row_address_q = 1'h0;
  
  reg [9:0] M_ram_writer_address_d, M_ram_writer_address_q = 1'h0;
  
  always @* begin
    M_button_state_d = M_button_state_q;
    M_writer_state_d = M_writer_state_q;
    M_data_d = M_data_q;
    M_bitloader_d = M_bitloader_q;
    M_current_arrow_d = M_current_arrow_q;
    M_current_level_d = M_current_level_q;
    M_prev_arrows_d = M_prev_arrows_q;
    M_data_col_address_d = M_data_col_address_q;
    M_data_row_address_d = M_data_row_address_q;
    
    ready = 1'h0;
    we_top = 1'h0;
    we_btm = 1'h0;
    row_address_top = 1'h0;
    row_address_btm = 1'h0;
    col_address_top = 1'h0;
    col_address_btm = 1'h0;
    wd_top = 1'h0;
    wd_btm = 1'h0;
    M_rom_choice = arrow_type_input[(M_current_arrow_q)*16+0+3-:4];
    
    case (M_writer_state_q)
      START_writer_state: begin
        M_current_arrow_d = level_input;
        M_current_level_d = 1'h0;
        M_data_d = 48'h787f7fe07fff;
        M_prev_arrows_d = arrow_type_input[(M_current_arrow_q)*16+0+3-:4];
        M_writer_state_d = LOAD_ADDRESS_writer_state;
        M_button_state_d = READY_button_state;
      end
      LOAD_ADDRESS_writer_state: begin
        if (M_button_state_q == LOADING_button_state) begin
          row_address_top = M_data_row_address_q;
          col_address_top = M_data_col_address_q;
        end else begin
          row_address_top = M_rom_arrow[(M_bitloader_q)*12+6+5-:6];
          
          case (M_rom_arrow[(M_bitloader_q)*12+0+5-:6])
            6'h0c: begin
              col_address_top = 7'h40 / (M_current_level_q + 1'h1) * (M_current_arrow_q + 1'h1) + 2'h2;
            end
            6'h0b: begin
              col_address_top = 7'h40 / (M_current_level_q + 1'h1) * (M_current_arrow_q + 1'h1) + 1'h1;
            end
            6'h0a: begin
              col_address_top = 7'h40 / (M_current_level_q + 1'h1) * (M_current_arrow_q + 1'h1);
            end
            6'h09: begin
              col_address_top = 7'h40 / (M_current_level_q + 1'h1) * (M_current_arrow_q + 1'h1) - 1'h1;
            end
            6'h08: begin
              col_address_top = 7'h40 / (M_current_level_q + 1'h1) * (M_current_arrow_q + 1'h1) - 2'h2;
            end
            default: begin
              col_address_top = M_rom_arrow[(M_bitloader_q)*12+0+5-:6];
            end
          endcase
        end
        row_address_btm = M_data_row_address_q;
        col_address_btm = M_data_col_address_q;
        wd_top = 3'h0;
        if (M_button_state_q == READY_button_state && M_current_level_q != 1'h0) begin
          wd_top = M_rom_colour;
        end
        wd_btm = 3'h4;
        we_top = 1'h1;
        we_btm = 1'h1;
        M_writer_state_d = LOAD_WAIT_writer_state;
        if ((&M_bitloader_q) == 1'h1) begin
          M_bitloader_d = 1'h0;
          M_writer_state_d = LOAD_ADDRESS_writer_state;
          if (M_data_col_address_q < 8'h3f) begin
            M_data_col_address_d = M_data_col_address_q + 1'h1;
          end else begin
            if (M_current_arrow_q < (M_current_level_q - 1'h1)) begin
              M_current_arrow_d = M_current_arrow_q + 1'h1;
            end else begin
              M_current_arrow_d = 1'h0;
              M_button_state_d = READY_button_state;
              if (M_button_state_q == LOADING_button_state) begin
                M_current_level_d = level_input;
              end else begin
                M_writer_state_d = LOOP_writer_state;
              end
            end
          end
        end
      end
      LOAD_WAIT_writer_state: begin
        M_bitloader_d = M_bitloader_q + 1'h1;
        M_data_row_address_d = M_data_row_address_q + 1'h1;
        M_writer_state_d = LOAD_ADDRESS_writer_state;
      end
      LOOP_writer_state: begin
        ready = 1'h1;
        M_writer_state_d = LOOP_writer_state;
        if (button_clicked[0+0-:1] || button_clicked[1+0-:1] || button_clicked[2+0-:1] || button_clicked[3+0-:1] || button_clicked[4+0-:1]) begin
          M_writer_state_d = LOAD_ADDRESS_writer_state;
          M_button_state_d = LOADING_button_state;
        end else begin
          if (timer == 1'h0) begin
            M_writer_state_d = WAIT_FOR_NEXT_LEVEL_writer_state;
          end
        end
      end
      WAIT_FOR_NEXT_LEVEL_writer_state: begin
        if (timer == 1'h0) begin
          M_writer_state_d = WAIT_FOR_NEXT_LEVEL_writer_state;
        end else begin
          M_data_col_address_d = 1'h0;
          M_writer_state_d = LOAD_ADDRESS_writer_state;
          M_button_state_d = LOADING_button_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_bitloader_q <= 1'h0;
    end else begin
      M_bitloader_q <= M_bitloader_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_data_row_address_q <= 1'h0;
    end else begin
      M_data_row_address_q <= M_data_row_address_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_data_q <= 1'h0;
    end else begin
      M_data_q <= M_data_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ram_writer_address_q <= 1'h0;
    end else begin
      M_ram_writer_address_q <= M_ram_writer_address_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_current_arrow_q <= 1'h0;
    end else begin
      M_current_arrow_q <= M_current_arrow_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_current_level_q <= 1'h0;
    end else begin
      M_current_level_q <= M_current_level_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_data_col_address_q <= 1'h0;
    end else begin
      M_data_col_address_q <= M_data_col_address_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_button_state_q <= 1'h0;
    end else begin
      M_button_state_q <= M_button_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_prev_arrows_q <= 1'h0;
    end else begin
      M_prev_arrows_q <= M_prev_arrows_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_writer_state_q <= 1'h0;
    end else begin
      M_writer_state_q <= M_writer_state_d;
    end
  end
  
endmodule
