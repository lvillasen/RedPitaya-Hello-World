
module dual_port_ram (
input clka,
input clkb,
input rst,
input trig,
input [11:0]  addrb,
input [13:0]  dia,
input [11:0]  pnts_after_trig,
input [3:0]   Nth,
output reg [13:0] dob,
output reg [11:0] addr_trig,
output wire enabled
);

reg Q1,Q2,Q3,QQ1,QQ2,QQ3;
reg int_ena = 1'b0;
reg busy = 1'b0;
reg [13:0] ram [4095:0];
wire int_trig,int_rst;
reg  [11:0] int_addra = 12'd0;
reg [11:0] counter;
reg  [3:0] num_trig = 4'd1;

always @(posedge clka)
begin
if (int_ena )
  ram[int_addra] <= dia;
end
always @(negedge clka)
begin
if (int_ena )
  int_addra <= int_addra + 1'b1;
end

always @(posedge clka, posedge int_trig)
begin
if (int_trig && int_ena && num_trig == Nth) 
  begin
  counter <= 0; 
  addr_trig <=  int_addra;
  end
else 
begin  
  if (counter < pnts_after_trig)  
    counter <= counter + 1;  
end  
end

always @(posedge clka, posedge int_rst)
begin
if (int_rst)
  int_ena <= 1'b1;
else if (counter == pnts_after_trig -1'b1)
  int_ena <= 1'b0;
end

always @(posedge int_rst, negedge int_trig)
begin
if (int_rst)
  num_trig <= 4'd1;
else if (int_trig == 1'b0)
  num_trig <= num_trig  + 1'b1;
end

always @(posedge clkb)
begin
dob <= ram[addrb];
end

always @(posedge clka)
begin
      Q1 <= rst; 
      Q2 <= Q1;
      Q3 <= Q2;
      QQ1 <= trig; 
      QQ2 <= QQ1;
      QQ3 <= QQ2;
end
assign int_rst = Q1 && Q2 && (~ Q3);
assign int_trig = QQ1 && QQ2 && (~ QQ3) ;
assign enabled = int_ena;
endmodule
