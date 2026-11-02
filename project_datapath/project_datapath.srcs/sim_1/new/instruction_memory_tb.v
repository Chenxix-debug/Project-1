`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 06:57:15 PM
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb;
    reg [15:0] address;
    wire [15:0] instruction;
    
    instruction_memory uut(
        .address(address),
        .instruction(instruction)
    );
    
    initial begin
        address = 16'd0;
        #10;
        
        if (instruction === 16'b0000000100100000)
            $display("Grabbed First Instruction");
        else
            $display("Failed to grab first Instruction");
        
        address = 16'd2;
        #10;
        
        if (instruction === 16'b0000001101000001)
            $display("Grabbed Second Instruction");
        else
            $display("Failed to grab second Instruction");
        
        address = 16'd4;
        #10;
        
        if (instruction === 16'b0000010101100010)
            $display("Grabbed Third Instruction");
        else
            $display("Failed to grab third instruction");
        
        address = 16'd6;
        #10;
        
        if (instruction === 16'b0000011110000011)
            $display("Grabbed fourth instruction");
        else
            $display("Failed to grab fourth instruction");
       
       $finish;
    
    end
endmodule
