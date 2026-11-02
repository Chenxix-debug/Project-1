`timescale 1ns / 1ps

module top_level_cpu_tb;

    reg clk = 0;
    reg reset = 1;

    wire [15:0] pc_out;
    wire [15:0] instruction_out;

    top_level_cpu uut (
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out),
        .instruction_out(instruction_out)
    );
    
    always #5 clk = ~clk;

    initial begin
    
        #12;
        reset = 0;

        #30;

        if (uut.regs.registers[1] === 16'd8)
            $display("PASS");
        else
            $error("FAIL");

        $finish;
    end

endmodule
