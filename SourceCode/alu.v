module alu(
    input wire[15:0] a,
    input wire[15:0] b,
    input wire[2:0] alu_op,
    output reg[15:0] result,
    output wire eq,
    output wire lt
);

always @(*) begin
    case(alu_op)
        3'b000: result = a + b; //Add
        3'b001: result = a - b; //Sub
        3'b010: result = a & b; //and
        3'b011: result = a | b; //Or
        3'b100: result = a ^ b; //Xor
        3'b101: result = a << b; //sll
        3'b110: result = a >> b; //srl
    endcase    
end

assign eq = (a == b);
assign lt = (a < b);

endmodule