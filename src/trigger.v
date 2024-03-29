`timescale 1ns / 1ps

module trigger (
  input wire           adc_clk,
  input  wire [13:0]   adc_dat_a,
  input  wire [13:0]   treshold,
  output reg           trigger,
  output  reg [13:0]   adc_dat_a_out
);
  reg [13:0] int_dat_a_reg;
  reg [13:0] int_treshold;

  always @(posedge adc_clk)
  begin
    adc_dat_a_out <= adc_dat_a;
    int_dat_a_reg <= adc_dat_a;

    int_treshold <= treshold;
    if (~int_dat_a_reg > ~int_treshold)
    trigger <= 1'b1;
    else
    trigger <= 1'b0;
  end
endmodule