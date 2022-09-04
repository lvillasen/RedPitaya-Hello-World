
module counter (seconds,clk);

output reg seconds;
input clk; 
reg [26:0] count;

always @(posedge clk)
begin
   if (count == 27'd62_500_000) begin 
        count   <= 0;
        seconds <= ~seconds;
    end else begin
        count   <= count + 1'b1;    
    end 
end
endmodule

