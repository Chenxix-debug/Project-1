`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 06:10:10 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire clk,
    input wire mem_read,
    input wire mem_write,
    input wire [15:0] address,
    input wire [15:0] mem_writedata,
    output reg [15:0] mem_readdata
    );
    
    reg [7:0] memory [0:63];
    
    integer i;
    
    initial begin
        for (i = 0; i < 64; i = i + 1)
            memory[i] = 8'b0;
    end
    
    always @(posedge clk) begin
        if (mem_write && address <= 16'd62) begin
            memory[address] <= mem_writedata[15:8];
            memory[address + 1] <= mem_writedata[7:0];
        end
    end
    
    always @(*) begin
        if (mem_read && address <= 16'd62)
            mem_readdata = {memory[address], memory[address + 1]};
        else
            mem_readdata = 16'b0;
    end
       
endmodule
