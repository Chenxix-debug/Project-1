`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 08:28:24 PM
// Design Name: 
// Module Name: multiplexor_tb
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


module multiplexor_tb;
    
    reg [15:0] a;
    reg [15:0] b;
    reg in;
    wire [15:0] out;
    
    multiplexor_2to1 uut (
        .a(a),
        .b(b),
        .in(in),
        .out(out)
    );
    
    initial begin
        a = 16'd5;
        b = 15'd10;
        
        //Select A 
        
        in = 0;
        #10;
        
        if (out === 16'd5)
            $display("Pass");
        else
            $error("Fail");
        
        in = 1;
        #10;
        
        if (out === 16'd10)
            $display("Pass");
        else
            $error("Fail");
        
        $finish;
    end
endmodule
