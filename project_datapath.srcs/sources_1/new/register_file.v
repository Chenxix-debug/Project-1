`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 11:09:23 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input wire clock,
    input wire reg_write,
    
    input wire [3:0] reg1,
    input wire [3:0] reg2,
    input wire [3:0] write_reg,
    
    input wire [15:0] write_data,
    
    output wire [15:0] data1,
    output wire [15:0] data2
   
    );
    
    reg [15:0] registers [0:15];
    
    assign data1 = registers[reg1];
    assign data2 = registers[reg2];
    
    always @(posedge clock) begin
        if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
