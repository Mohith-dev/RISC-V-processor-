module Imm_gen(
    input  logic [31:0] instr,
    output logic [31:0] extend_offset
);

always_comb begin
    case(instr[6:0])

    // I-type (ALU immediate)
    7'b0010011:
        extend_offset =
            {{20{instr[31]}}, instr[31:20]};

    // Load (I-type)
    7'b0000011:
        extend_offset =
            {{20{instr[31]}}, instr[31:20]};

    // Store (S-type)
    7'b0100011:
        extend_offset =
            {{20{instr[31]}},
              instr[31:25],
              instr[11:7]};

    // Branch (B-type)
    7'b1100011:
        extend_offset =
            {{19{instr[31]}},
              instr[31],
              instr[7],
              instr[30:25],
              instr[11:8],
              1'b0};

    default:
        extend_offset = 32'd0;

    endcase
end

endmodule