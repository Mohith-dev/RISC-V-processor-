module Reg_file (

    input logic clk,
    input logic [4:0] rd_rg1,
    input logic [4:0] rd_rg2,
    input logic [4:0] wr_rg,
    input logic [31:0] wr_data,
    input logic RegWrite,
    output logic [31:0] rd_data1,
    output logic [31:0] rd_data2
);


  // ignore the writes to register x0 
  // and also when doing read from  the register x0 , you just dont want to prevent overwriting to this

  // register file

  logic [31:0] rg_file[31:0];

  // you dont have to initliase the register x0 with zero , you can just make the hardware interpret it as such 

  // write 

  always_ff @(posedge clk) begin
    if (RegWrite && wr_rg != 5'd0) begin
      rg_file[wr_rg] <= wr_data;
    end
  end

  // read

  always_comb begin

    rd_data1 = (rd_rg1 == 5'd0) ? 32'd0 : rg_file[rd_rg1];
    rd_data2 = (rd_rg2 == 5'd0) ? 32'd0 : rg_file[rd_rg2];



  end



endmodule
