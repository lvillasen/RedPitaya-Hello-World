module single_pulse_trigger (
  input  wire          adc_clk,
  input  wire [13:0]   adc_dat_a,
  input  wire [13:0]   treshold,
  input  wire           trig_edge,
  output reg           trig_out 
);
  reg [13:0] int_dat_a_reg;
  reg [13:0] int_treshold;

  always @(posedge adc_clk)
  begin
      if ((adc_dat_a> treshold) && (trig_edge == 1'b0)) // neg edge
        trig_out <= 1'b1;
      else if ((adc_dat_a < treshold) && (trig_edge == 1'b1)) // pos edge 
        trig_out <= 1'b1;
      else
        trig_out <= 1'b0;
  end
endmodule