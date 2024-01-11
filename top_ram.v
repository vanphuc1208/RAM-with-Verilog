`timescale 1ns / 1ps
 
module top_ram(
    input clk,rst,wr,
    input [15:0] din,
    input [7:0] addr,
    output reg [15:0] dout
    );
reg [15:0] mem [255:0];
integer i=0;
always@(posedge clk)
begin
if(rst == 1'b1) begin
    dout<=16'h0000;
    for (i = 0; i <= 255 ; i= i + 1) 
        begin
        mem[i] <= 0;
        end
end
else begin
if(wr == 1'b1)  begin
  mem[addr] <= din;
  dout<=16'h0000;
end
else
  dout <= mem[addr];
end
end  
 
 
endmodule
