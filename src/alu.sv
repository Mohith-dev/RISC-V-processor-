module ALU(
	input logic [3:0] alu_ctrl,
	input logic [31:0] a,
	input logic [31:0] b,
	output logic [31:0] alu_result,
	output logic zero
);	

always_comb begin : ALU_logic

	case(alu_ctrl)

	4'b0000: alu_result = a & b;
	4'b0001: alu_result = a | b;
	4'b0010: alu_result = a + b;
	4'b0110: alu_result = a - b;

	default: alu_result = 32'b0;

	endcase

	zero = (alu_result == 0);
end


endmodule