`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2026 07:06:36 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(
parameter WIDTH = 16, INCREMENT = 2, RESET_ADDR = 0) 
    (
    input rst,
    input clk,
    input en,
    input load,
    input [15:0] load_addr,
    output reg [15:0] pc
    );
    always @(posedge clk) begin
        if (rst)
            pc <= RESET_ADDR;
        else if (load)
            pc <= load_addr;
        else if (en)
            pc <= pc + INCREMENT; end
endmodule
