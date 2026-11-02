`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2026 07:22:19 PM
// Design Name: 
// Module Name: sign_extend_I_tb
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


module sign_extend_I_tb;
    reg [3:0] immediate;
    wire[15:0] final_extend;
    
    reg[11:0] jump_bits;
    wire[15:0] extended;
    
    sign_extend uut(
        .immediate(immediate),
        .final_extend(final_extend)
    );
    
    sign_extend_j uut2(
        .jump_bits(jump_bits),
        .extended(extended)
    );
    
    initial begin
    
    immediate = 4'b0101;
    #10;
    
    if (final_extend === 16'b0000000000000101)
        $display("I instruction sign extend Passed");
    else
        $display("I instruction sign extend failed");
    
    immediate = 4'b1111;
    #10;
    
    if (final_extend === 16'b1111111111111111)
        $display("I type negative sign extend passed");
    else
        $display("I type negative sign extend failed");
    
    jump_bits = 12'b111111111111;
    #10;
    
    if (extended === 16'b1111111111111111)
        $display("J type negative sign extend passed");
    else
        $display("J type negative sign extend failed");
        
    jump_bits = 12'b000010101100;
    #10;
    
    if (extended === 16'b0000000010101100)
        $display("J type sign extend passed");
    else
        $display("J type sign extend failed");
    
    $finish;
    
    end
   
endmodule
