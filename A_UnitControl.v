`timescale 1ns/1ps
//Unidad de control

module A_UnitControl(
    input [5:0] oper_in, 
    output reg w_e_banco, 
    output reg w_e_memo, 
    output reg r_e_memo, 
    output reg [1:0] habilitador, 
    output reg signal_MUX_F, 
    output reg MUX_INS,
    output reg MUX_D_A
);

always @(*) begin
    case (oper_in)
        // Tipo- R
        6'b000000: begin
            habilitador = 3'b000;
            w_e_banco = 1'b1;
            w_e_memo = 1'b0;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b0;
            MUX_INS = 1'b0;
            MUX_D_A = 1'b0;
        end
        // Cargar
        6'b100011: begin
            habilitador = 3'b001;
            w_e_banco = 1'b1;
            w_e_memo = 1'b0;
            r_e_memo = 1'b1;
            signal_MUX_F = 1'b1;
            MUX_INS = 1'b1;
            MUX_D_A = 1'b0;
        end
        // Guardar
        6'b101011: begin
            habilitador = 3'b001;
            w_e_banco = 1'b0;
            w_e_memo = 1'b1;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b1;
            MUX_INS = 1'b1;
            MUX_D_A = 1'b1;
        end
        // Suma
        6'b001000: begin
            habilitador = 3'b001;
            w_e_banco = 1'b1;
            w_e_memo = 1'b0;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b0;
            MUX_INS = 1'b1;
            MUX_D_A = 1'b0;
        end
        // And
        6'b001100: begin
            habilitador = 3'b001;
            w_e_banco = 1'b1;
            w_e_memo = 1'b0;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b0;
            MUX_INS = 1'b1;
            MUX_D_A = 1'b0;
        end
        // Or
        6'b001101: begin
            habilitador = 3'b001;
            w_e_banco = 1'b1;
            w_e_memo = 1'b0;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b0;
            MUX_INS = 1'b1;
            MUX_D_A = 1'b0;
        end
//Bloque 
        default: begin
            habilitador = 3'b000;
            w_e_banco = 1'b0;
            w_e_memo = 1'b0;
            r_e_memo = 1'b0;
            signal_MUX_F = 1'b0;
            MUX_INS = 1'b0;
            MUX_D_A = 1'b0;
        end
    endcase
end
endmodule

