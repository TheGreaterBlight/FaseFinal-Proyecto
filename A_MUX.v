`timescale 1ns/1ps


module A_MUX(
    input [4:0] RT,       
    input [4:0] RD,      
    input selector,      
    output reg [4:0] SALIDA 
);

always @(*) begin
    case (selector) 
        1'b0: SALIDA = RT; 
        1'b1: SALIDA = RD;
        default: SALIDA = 5'b00000; 
    endcase
end

endmodule