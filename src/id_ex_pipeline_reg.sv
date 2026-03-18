
module ID_EX(

	input logic clk,
	input logic rst,
	input logic flush,
	input logic stall,

	input logic [4:0] Rs1_in,
	input logic [4:0] Rs2_in,
	input logic [4:0] Rd_in,
	input logic [31:0] Rs1_data_in,
	input logic [31:0] Rs2_data_in,
	input logic [31:0] Imm_in,
	input logic [31:0] pc_in

	input logic PCSrc_in,
	input logic RegWrite_in,
	input logic AluSrc_in,
	input logic ALUOp_in,
	input logic MemRead_in,
	input logic MemWrite_in,
	input logic MemtoReg_in

	output logic [4:0] Rs1_out,
	output logic [4:0] Rs2_out,
	output logic [4:0] Rd_out,
	output logic [31:0] Rs1_data_out,
	output logic [31:0] Rs2_data_out,
	output logic [31:0] Imm_out,
	output logic [31:0] pc_out

	output logic PCSrc_out,
	output logic RegWrite_out,
	output logic AluSrc_out,
	output logic ALUOp_out,
	output logic MemRead_out,
	output logic MemWrite_out,
	output logic MemtoReg_out


);

always_ff @(posedge clk) begin
	// we coudl have differnet ways to deal with stall, as we just need to need to set the control signalst to zero for stall, but to zero out the other reg fields in this is our choice , and its easy to zero them and does it not make any differece
	if(reset || flush || stall) begin
		PCSrc_out <= 0 ;
		RegWrite_out <= 0;
		AluSrc_out <= 0;
		ALUOp_out <= 0;
		MemRead_out <= 0;
		MemWrite_out <= 0;
		MemtoReg_out <= 0;
		Rs1_out <= 0;
		Rs2_out <= 0;
		Rs1_data_out <= 0;
		Rs2_data_out <= 0;
		Rd_out <= 0;
		Imm_out <= 0;
		pc_out <= 0;
	end

	else begin
		PCSrc_out <= PCSrc_in;
		RegWrite_out <= RegWrite_in;
		AluSrc_out <= AluSrc_in;
		ALUOp_out <= ALUOp_in;
		MemRead_out <= MemRead_in;
		MemWrite_out <= MemWrite_in;
		Rs1_out <= Rs1_in;
		Rs2_out <= Rs2_in;
		Rs1_data_out <= Rs1_data_in;
		Rs2_data_out <= Rs2_data_in;
		Rd_out <= Rd_in;
		Imm_out <= Imm_in;
		pc_out <= pc_in;
	end


end

endmodule