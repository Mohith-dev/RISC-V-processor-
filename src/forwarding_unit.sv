module Forwarding_unit (

    input logic [4:0] Rs1,
    input logic [4:0] Rs2,
    input logic [4:0] Rd,
    input logic [4:0] EX_MEM_Rd,
    input logic EX_MEM_Regwrite,
    input logic MemtoReg,
    input logic [4:0] MEM_WB_Rd,
    input logic MEM_WB_Regwrite,
    output logic [1:0] ForwardA,
    output logic [1:0] ForwardB

);

  always_comb begin : Ex_hazard


    ForwardA = 2'b00;
    ForwardB = 2'b00;
    // for forwarding from EX_MEM pipeline register(1a or 1b hazard) and not load instructions,because we have the address not the value for such instructions at the pipeline register 
    if ((EX_MEM_Rd != 0) && EX_MEM_Regwrite && (EX_MEM_Rd == Rs1) && !MemtoReg)
      ForwardA = 2'b10;

    if ((EX_MEM_Rd != 0) && EX_MEM_Regwrite && (EX_MEM_Rd == Rs2) && !MemtoReg)
      ForwardB = 2'b10;


    // Mem forwarding must only happen only if Ex forwarding is not happening , because EX hazard indicate teh dependency is immediate so the insturction which requires it gets the latest value 

    /*
add x1, x2, x3     // produces x1
sub x1, x1, x4     // produces NEW x1
and x5, x1, x6     // needs x1

EX/MEM.rd  = x1   (sub result → CORRECT VALUE)
MEM/WB.rd  = x1   (add result → OLD VALUE)

Which value must be forwarded?
 EX/MEM, because it is newer.
*/
    if((MEM_WB_Rd != 0) && MEM_WB_Regwrite &&
       (MEM_WB_Rd == Rs1) &&
       !((EX_MEM_Rd != 0) && EX_MEM_Regwrite && (EX_MEM_Rd == Rs1)))
      ForwardA = 2'b01;

    if ((MEM_WB_Rd != 0) && MEM_WB_Regwrite &&
        (MEM_WB_Rd == Rs2) &&
        !((EX_MEM_Rd != 0) && EX_MEM_Regwrite && (EX_MEM_Rd == Rs2)))
      ForwardB = 2'b01;

  end

endmodule