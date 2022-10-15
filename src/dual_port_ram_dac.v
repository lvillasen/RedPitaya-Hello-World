
module dual_port_ram_dac (
input wire clka,
input wire clkb,
input wire rst_a,
input wire rst_b,
input  [13:0] dia,
output reg [13:0] dac_o,
output  wire clkb_o,
output  wire en_a,
output  wire en_b
);

reg Q1,Q2,Q3,QQ1,QQ2,QQ3;
reg int_en_a = 1'b0;
reg int_en_b = 1'b0;
wire int_rst_a ;
wire int_rst_b ;
reg [13:0] ram [1024:0];

reg  [9:0] addra = 10'd0;
reg  [9:0] addrb = 10'd0;

always @(negedge clka, posedge int_rst_a)
begin
 if (int_rst_a) 
    addra <= 10'd0; 
else begin  
    if (addra < 10'b1111111111)  
      addra <= addra + 1'b1;  
end  
end

always @(posedge clka)
begin
      ram[addra]  <= dia;  
   
      Q1 <= rst_a; 
      Q2 <= Q1;
      Q3 <= Q2;
end

always @(posedge clka, posedge int_rst_a)
begin
if (int_rst_a)
  int_en_a <= 1'b1;
else if (addra == 10'b1111111111) 
  int_en_a <= 1'b0;
end

always @(negedge clkb, posedge int_rst_b)
begin
 if (int_rst_b) 
    addrb <= 10'd0; 
else begin  
    if (addrb < 10'b1111111111)  
      addrb <= addrb + 1'b1;  
end  
end


always @(posedge clkb, posedge int_rst_b)
begin
if (int_rst_b)
  int_en_b <= 1'b1;
else if (addrb == 10'b1111111111) 
  int_en_b <= 1'b0;
end

always @(negedge clkb)
begin
 if (int_en_b )
   begin
       dac_o <= ram[addrb];  
   end
end


always @(posedge clkb)
begin
      QQ1 <= rst_b; 
      QQ2 <= QQ1;
      QQ3 <= QQ2;
end
assign int_rst_a = Q1 && Q2 && (~ Q3);
assign int_rst_b = QQ1 && QQ2 && (~ QQ3);
assign clkb_o = clkb && int_en_b;
assign en_a = int_en_a;

assign en_b = int_en_b;
endmodule
