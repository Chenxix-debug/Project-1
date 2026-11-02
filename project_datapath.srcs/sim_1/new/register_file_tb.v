`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2026 11:41:43 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
    reg clock;
    reg reg_write;
    reg[3:0] reg1;
    reg[3:0] reg2;
    reg[3:0] write_reg;
    reg [15:0] write_data;
    
    wire[15:0] data1;
    wire[15:0] data2;
    
    register_file uut(
        .clock(clock),
        .reg_write(reg_write),
        .reg1(reg1),
        .reg2(reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .data1(data1),
        .data2(data2)
    );
    initial clock = 0;
    always #10 clock = ~clock;
    
    initial begin
        reg_write = 0;
        reg1 = 0;
        reg2 = 0;
        write_reg = 0;
        write_data = 0;
        
        @(negedge clock);
        reg_write = 1;
        write_reg = 4'd1;
        write_data = 16'd15;
        
        @(posedge clock);
        #1;
        
        if(uut.registers[1] == 16'd15)
            $display("Write Test Passed");
        else
            $display("Write Test Failed");
            
        @(negedge clock);
        reg_write = 1;
        write_reg = 4'd2;
        write_data = 16'd10;
        
        @(posedge clock);
        #1;
        
        reg_write = 0;
        reg1 = 4'd1;
        reg2 = 4'd2;
        #1;
        
        if ((data1 === 16'd15) && (data2 === 16'd10))
            $display("Both Reg Test Passed");
        else
            $display("Both Reg Test Failed");
        
       $finish;      
    end
endmodule
