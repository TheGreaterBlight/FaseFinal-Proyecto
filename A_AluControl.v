`timescale 1ns/1ps

module A_Alu_Control(
    input [2:0] signal_u_con, // SEÑAL DE LA UNIDAD CONTROL
    input [5:0] FUNCION, // SEÑAL DE LA FUNCION (CAMBIADO A 6 BITS)
    output reg [3:0] operacion // SEÑAL QUE VA AL SELECTOR DE LA ALU
);

always @(*) begin
    case(signal_u_con)
        3'b000: begin // Tipo R
            case (FUNCION)
                6'b000000: operacion = 4'b0000; // SUMA
                6'b100001: operacion = 4'b0001; // RESTA
                6'b011000: operacion = 4'b0010; // MULTIPLICACIÓN
                6'b011010: operacion = 4'b0011; // DIVISIÓN
                6'b100100: operacion = 4'b0100; // AND
                6'b100101: operacion = 4'b0101; // OR
                6'b100110: operacion = 4'b0110; // XOR
                6'b100111: operacion = 4'b0111; // NOR
                6'b101011: operacion = 4'b1000; // SLT
                default: operacion = 4'b1111; // OPERACIÓN INVÁLIDA
            endcase
        end
        3'b001: operacion = 4'b0000; // SUMA EN LA ALU
        3'b010: operacion = 4'b0100; // AND EN LA ALU
        3'b011: operacion = 4'b0101; // OR EN LA ALU
        default: operacion = 4'b1111; // LA ALU NO HACE NADA
    endcase
end

endmodule
