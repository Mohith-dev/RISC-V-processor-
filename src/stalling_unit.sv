
// we need to stall the pipeline when we have a load insturction followed by arithmetic insturction trying to read the same register 

//we are going to check this data hazard by checking the destination and source registers at if_id and id_ex pipeline registers 

// stalling is acheived by not allowing the progress of the next two instructions , so we wont allow pc to change and also we have the freezed teh state of the if_id pipeline register, becuase it has the state of hte immeidate instruction after load 

// we are correct as far as the freezing part is concerned, but if we just freeze ,then we have no issues in the IF and ID stage, but we have to have something in the exection stage , once the load insturction finishes and moves to mem stage , what happpens in the exe stage is again teh same instruction will be executed because the id_ex has teh same values 

// this bubble is inserted by settign all the control signals to zero , this way we will not affect any state or do any kind of writing and no touching of memory 

// by insertion of the bubble , the dependencies go forward in time 

module Hazard_unit(

	input logic ID_EX_MemtoReg,
	input logic [4:0] ID_EX_Rd,
	input logic [4:0] IF_ID_Rs1,
	input logic [4:0] IF_ID_Rs2,
	output logic Stall
);

assign stall = (ID_EX_MemtoReg && ((ID_EX_Rd == IF_ID_Rs1) || (ID_EX_Rd == IF_ID_Rs2)) && ID_EX_Rd != 0)



endmodule