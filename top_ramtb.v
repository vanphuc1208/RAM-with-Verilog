`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2024 10:04:43 PM
// Design Name: 
// Module Name: top_ramtb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_ramtb();
reg clk;
    reg wr;
    reg rst;
    reg [15:0] din;
    reg [7:0] addr;
    wire [15:0] dout;
    reg [15:0] data [19:0];
    reg [15:0] res;
    integer err = 0;
     
    initial begin
    clk = 0;
    rst = 0;
    wr = 0;
    end
     
    top_ram dut (clk,rst,wr,din,addr,dout);
     
    always #5 clk = ~clk;
    
    initial begin
    rst=1'b1;
    #50;
    end
     
    integer i;
    integer file;
    integer rfile;
     
     
     
     
    /////////////////Writing data to file
     
     
     
     
     
     
     
    initial begin
    file = $fopen("C:/Users/OS/IOproject/IOproject.srcs/sim_1/imports/Desktop/data.txt", "w");
    for(i =0; i < 10 ; i = i + 1) begin
    @(posedge clk);
    wr = 1'b1;
    rst = 1'b0;
    addr = i;
    din = $urandom();
    $fdisplay(file, "%x",din);
    end
    $fclose(file);
     
     
    file = $fopen("C:/Users/OS/IOproject/IOproject.srcs/sim_1/imports/Desktop/data.txt", "r");
    $readmemh("C:/Users/OS/IOproject/IOproject.srcs/sim_1/imports/Desktop/data.txt", data);
    $fclose(file);
     
     
    #10;
     
    for(i =0; i < 10 ; i = i + 1) begin ////1, 3, 5, 7
    @(posedge clk);
    wr = 1'b0;
    rst = 1'b0;
    addr = i;
    @(posedge clk);
    res = data[i];
    $display("%d %d", res,dout);
     
    if(dout != res)
    begin
    err = err + 1;
    end
     
    end
     
     
    if(err == 0)
    $display("--------------TEST PASSED---------");
    else
    $display("--------------TEST FAILED---------");
     
    end
    endmodule
