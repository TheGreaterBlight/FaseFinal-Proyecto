`timescale 1ns/1ps

module A_ExSig(
    input signed [15:0] data_in,        // Ent de 16 bits 
    output reg signed [31:0] extendido // Sal de 32
);

always @(*) begin
    extendido = data_in; 
end

endmodule

