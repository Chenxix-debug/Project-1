`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 06:31:04 PM
// Design Name: 
// Module Name: data_memory_tb
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


module data_memory_tb;

    reg clk = 0;
    reg mem_read;
    reg mem_write;
    reg [15:0] address;
    reg [15:0] mem_writedata;
    wire [15:0] mem_readdata;
    
    data_memory uut (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .mem_writedata(mem_writedata),
        .mem_readdata(mem_readdata)
    );
    
    always #10 clk = ~clk;
    
    initial begin
        mem_read = 0;
        mem_write = 0;
        address = 0;
        mem_writedata = 0;
        
        #2;
        address = 16'd4;
        mem_writedata = 16'h1234;
        mem_write = 1;
        #10;
        mem_write = 0;
       // read from same 
        mem_read = 1;
        #2;
        
        if (mem_readdata === 16'h1234)
            $display("Passed reading and writing");
        else
            $error("Fail");
        
        if (uut.memory[4] === 8'h12 && 
            uut.memory[5] === 8'h34)
            $display("Pass");
        else
            $error("Fail");
        
        $finish;
        
     end 
         
endmodule
