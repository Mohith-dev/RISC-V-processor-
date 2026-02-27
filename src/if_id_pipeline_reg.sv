// hello there , how are you 

module IF_ID (
    input logic clk,
    input logic reset,
    input logic if_id_write,
    input logic flush,
    input logic [31:0] pc_in,
    input logic [31:0] instr_in,
    output logic [31:0] pc_out,
    output logic [31:0] instr_out

);


  always_ff @(posedge clk) begin
    if (reset || flush) begin
      pc_out <= 32'b0;
      instr_out <= 32'b0;
    end else if (if_id_write) begin

      pc_out <= pc_in;
      instr_out <= instr_in;

    end



  end


endmodule
