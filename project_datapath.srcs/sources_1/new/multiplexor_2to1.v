`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 07:19:09 PM
// Design Name: 
// Module Name: multiplexor_2to1
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


module multiplexor_2to1(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire in,
    output reg [15:0] out
    );
    
    always @(*) begin
        if (in == 1)
            out = b;
        else
            out = a;
    end
    
endmodule


