
module PC(
	input logic clk,
	input logic rst,
	input logic pc_enable,
	input logic [31:0] pc_next,
	output logic [31:0] pc
);

// keeping a synchronous reset 
always_ff @(posedge clk) begin
	if(rst)begin
		pc <= 32'h0000_0000;
	end
	else if(pc_enable) begin
		pc <= pc_next;
	end
end

endmodule