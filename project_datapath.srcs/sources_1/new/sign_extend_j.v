`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 07:19:25 PM
// Design Name: 
// Module Name: sign_extend_j
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


module sign_extend_j(
    input wire[11:0] jump_bits,
    output wire[15:0] extended
    );
    assign extended = {{4{jump_bits[11]}}, jump_bits};
endmodule
