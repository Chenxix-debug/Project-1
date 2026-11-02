`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 12:04:15 AM
// Design Name: 
// Module Name: instruction_memory
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
module instruction_memory(
    input wire [15:0] address,
    output wire [15:0] instruction
    );
    
    reg [15:0] instruction_mem [0:31];
    
    initial begin
        $readmemb("instructions.mem", instruction_mem);
    end
    
    assign instruction = instruction_mem [address >> 1];
    
endmodule
