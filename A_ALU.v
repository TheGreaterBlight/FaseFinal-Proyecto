`timescale 1ns/1ps

// Declaración del módulo principal ALU
module A_ALU(
    input [31:0] A_ALUC,  // Entrada A de 32 bits
    input [31:0] B_ALUC,  // Entrada B de 32 bits
    input [3:0] SELECTOR, // Selector de operación
    output reg [31:0] RESULTADO, // Resultado de la operación
    output reg ZF // Flag de cero (Zero Flag)
);

// Declaración de cables para operaciones intermedias
wire [31:0] C1, C2, C3, C4, C5, C6, C7, C8; // Cables de 32 bits para cada operación

// Asignación de operaciones entre las entradas A y B
assign C1 = A_ALUC + B_ALUC; // Suma
assign C2 = A_ALUC - B_ALUC; // Resta
assign C3 = A_ALUC * B_ALUC; // Multiplicación
assign C4 = A_ALUC / B_ALUC; // División
assign C5 = A_ALUC & B_ALUC; // Operación AND
assign C6 = A_ALUC | B_ALUC; // Operación OR
assign C7 = A_ALUC ^ B_ALUC; // Operación XOR
assign C8 = ~(A_ALUC | B_ALUC); // Operación NOR

// Bloque ALWAYS que se ejecuta cuando hay cambios en las entradas
always @(*) begin
    case (SELECTOR) // Caso basado en el valor del selector
        4'b0000: begin
            RESULTADO = C1; // Resultado de la suma
        end
        4'b0001: begin
            RESULTADO = C2; // Resultado de la resta
        end
        4'b0010: begin
            RESULTADO = C3; // Resultado de la multiplicación
        end
        4'b0011: begin
            RESULTADO = C4; // Resultado de la división
        end
        4'b0100: begin
            RESULTADO = C5; // Resultado de la operación AND
        end
        4'b0101: begin
            RESULTADO = C6; // Resultado de la operación OR
        end
        4'b0110: begin
            RESULTADO = C7; // Resultado de la operación XOR
        end
        4'b0111: begin
            RESULTADO = C8; // Resultado de la operación NOR
        end
        4'b1000: begin // Comparación menor
            if (A_ALUC < B_ALUC) begin
                RESULTADO = 32'b1; // A es menor que B
            end else begin
                RESULTADO = 32'b0; // A no es menor que B
            end
        end
        default: begin
            RESULTADO = 32'b0; // En caso de que el selector no coincida
        end
    endcase
end

// Generación del flag ZF (Zero Flag)
always @(*) begin
    if (RESULTADO == 32'b0) begin
        ZF = 1; // Si el resultado es cero, se establece el Zero Flag
    end else begin
        ZF = 0; // Si el resultado no es cero, se limpia el Zero Flag
    end
end

endmodule // Fin del módulo ALU_C

