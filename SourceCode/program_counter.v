`timescale 1ns/1ps

module program_counter #(
	parameter WIDTH = 16, INCREMENT = 2, RESET_ADDR = 0
) ( 
	input  wire			          clk, rst, inc, load,
	input  wire [WIDTH-1:0]		load_addr, 
	output reg  [WIDTH-1:0]		pc
  );
	always @(posedge clk) begin
		if (rst)   	  
			pc <= RESET_ADDR;
		else if (load) 	  
			pc <= load_addr;
		else if (inc)	  
			pc <= pc + INCREMENT;
	end
endmodule
		
