
module ALU_ctrl(

	input logic [1:0] ALU_OP,
	input logic  func_7,
	input logic [2:0] func_3,
	output logic [3:0] ALU_ctrl

);

// casez treats z and ? as wildcard bits use this over casex, as casex causes simulation bugs(X and ? are wildcard bits)
always_comb begin : control_logic_of_alu
	casez({ALU_OP,func_7,func_3})

	6'b00_?_???: ALU_ctrl = 4'b0010;
	6'b?1_?_???: ALU_ctrl = 4'b0110;
	6'b1?_0_000: ALU_ctrl = 4'b0010;
	6'b1?_1_000: ALU_ctrl = 4'b0110;
	6'b1?_0_111: ALU_ctrl = 4'b0000;
	6'b1?_0_110: ALU_ctrl = 4'b0001;

	default : ALU_ctrl = 4'b0000;
	$error("Illegeal alu combination");

	endcase
end





endmodule