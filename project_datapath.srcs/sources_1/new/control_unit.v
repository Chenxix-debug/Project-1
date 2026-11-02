`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 08:56:55 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input wire [3:0] opcode,
    input wire [3:0] funct,
    
    output reg reg_write,
    output reg mem_read,
    output reg alu_src,
    output reg mem_write,
    output reg mem_to_reg,
    output reg branch,
    output reg branch_ne,
    output reg jump,
    output reg [2:0] alu_op
    );
    
    always @(*) begin
        reg_write = 0;
        mem_read = 0;
        alu_src = 0;
        mem_write = 0;
        mem_to_reg = 0;
        branch = 0;
        branch_ne = 0;
        jump = 0;
        alu_op = 3'b000;
        
        case (opcode)
            4'b0000 : begin
                case (funct)
                    4'b0000: begin
                        reg_write = 1;
                        alu_op = 3'b000;
                    end
                    
                    4 'b0001: begin
                        reg_write = 1;
                        alu_op = 3'b001;
                    end
                    
                    4 'b0010: begin
                        reg_write = 1;
                        alu_op = 3'b101;
                    end
                    
                    4'b0011: begin
                        reg_write = 1;
                        alu_op = 3'b010;
                    end
                    
                    default: begin
                    
                    end
                endcase     
            end
            
            4'b0001: begin
                reg_write = 1;
                mem_read = 1;
                alu_src = 1;
                mem_to_reg = 1;
                alu_op = 3'b000;
            end
            
            4'b0010: begin
                mem_write = 1;
                alu_src = 1;
                alu_op = 3'b000;
            end
            
            4'b0011: begin
                reg_write = 1;
                alu_src = 1;
                alu_op = 3'b000;
            end
            
            4'b0100: begin
                branch = 1;
                branch_ne = 0;
                alu_op = 3'b001;
            end
            
            4'b0101: begin
                branch = 1;
                branch_ne = 1;
                alu_op = 3'b001;
            end
            
            4'b0110: begin
                jump = 1;
            end
            
            default: begin 
            
            end
        endcase  
    end 
                   
endmodule                   
        
       
        
        
    
    
    
    

