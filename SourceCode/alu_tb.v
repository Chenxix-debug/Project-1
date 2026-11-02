`timescale 1ns / 1ps

module alu_tb;
    reg[15:0] a;
    reg[15:0] b;
    reg[2:0] alu_op;
    wire[15:0] result;
    
    alu uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .result(result)
    );
    
    initial begin
        a = 16'd10;
        b = 16'd5;
        alu_op = 3'b000; //add
        #20;
        
        a = 16'd15;
        b = 16'd10;
        alu_op = 3'b001; //sub
        #20;
        
        a = 16'b1010;
        b = 16'b1000;
        alu_op = 3'b010; //and
        #20;
        
        a = 16'b1111;
        b = 16'b0001;
        alu_op = 3'b011; //or
        #20
        
        a = 16'b1010;
        b = 16'b1010;
        alu_op = 3'b100; //xor
        #20
        
        a = 16'd8;
        b = 16'd2;
        alu_op = 3'b101; //SLL
        #20
        
        a = 16'd16;
        b = 16'd3;
        alu_op = 3'b110; //SRL
        #20
        
        $finish;
     
    end    
   
endmodule
