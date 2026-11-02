`timescale 1ns / 1ps

module top_level_cpu (
    input wire clk,
    input wire reset,
    output wire [15:0] pc_out,
    output wire [15:0] instruction_out
);

    wire [15:0] pc;
    wire [15:0] pc_plus_2;
    wire [15:0] pc_load_addr;
    wire pc_load;

    assign pc_plus_2 = pc + 16'd2;
    assign pc_out = pc;

    program_counter pc_unit (
        .rst(reset),
        .clk(clk),
        .en(1'b1),
        .load(pc_load),
        .load_addr(pc_load_addr),
        .pc(pc)
    );

    wire [15:0] instruction;

    instruction_memory imem (
        .address(pc),
        .instruction(instruction)
    );

    assign instruction_out = instruction;
    
    wire [3:0] opcode;
    wire [3:0] rt_rd;
    wire [3:0] rs;
    wire [3:0] funct;
    wire [3:0] immediate;
    wire [11:0] jump_bits;

    assign opcode    = instruction[15:12];
    assign rt_rd     = instruction[11:8];
    assign rs        = instruction[7:4];
    assign funct     = instruction[3:0];
    assign immediate = instruction[3:0];
    assign jump_bits = instruction[11:0];

    wire reg_write;
    wire mem_read;
    wire mem_write;
    wire alu_src;
    wire mem_to_reg;
    wire branch;
    wire branch_ne;
    wire jump;
    wire [2:0] alu_op;

    control_unit ctrl (
        .opcode(opcode),
        .funct(funct),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .branch_ne(branch_ne),
        .jump(jump),
        .alu_op(alu_op)
    );

    wire [15:0] rs_data;
    wire [15:0] rd_data;
    wire [15:0] write_back_data;

    register_file regs (
        .clock(clk),
        .reg_write(reg_write && !reset),
        .reg1(rs),
        .reg2(rt_rd),
        .write_reg(rt_rd),
        .write_data(write_back_data),
        .data1(rs_data),
        .data2(rd_data)
    );

    wire [15:0] extended_imm;
    wire [15:0] extended_jump;

    sign_extend imm_ext (
        .immediate(immediate),
        .final_extend(extended_imm)
    );

    sign_extend_j jump_ext (
        .jump_bits(jump_bits),
        .extended(extended_jump)
    );
    
    wire [15:0] selected_b;
    wire [15:0] alu_a;
    wire [15:0] alu_b;

    wire is_sll;

    assign is_sll =
        (opcode == 4'b0000) &&
        (funct == 4'b0010);

    multiplexor_2to1 alu_src_mux (
        .a(rd_data),
        .b(extended_imm),
        .in(alu_src),
        .out(selected_b)
    );

    assign alu_a = is_sll ? rd_data : rs_data;
    assign alu_b = is_sll ? rs_data : selected_b;

    wire [15:0] alu_result;
    wire eq;
    wire lt;

    alu alu_unit (
        .a(alu_a),
        .b(alu_b),
        .alu_op(alu_op),
        .result(alu_result),
        .eq(eq),
        .lt(lt)
    );

    wire [15:0] memory_data;

    data_memory dmem (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write && !reset),
        .address(alu_result),
        .mem_writedata(rd_data),
        .mem_readdata(memory_data)
    );

    multiplexor_2to1 writeback_mux (
        .a(alu_result),
        .b(memory_data),
        .in(mem_to_reg),
        .out(write_back_data)
    );
    
    wire branch_taken;
    wire [15:0] branch_target;
    wire [15:0] jump_target;

    assign branch_taken =
        branch && (branch_ne ? !eq : eq);

    assign branch_target =
        pc_plus_2 + (extended_imm << 1);

    assign jump_target =
        pc_plus_2 + (extended_jump << 1);

    assign pc_load = branch_taken || jump;

    assign pc_load_addr =
        jump ? jump_target : branch_target;

endmodule
