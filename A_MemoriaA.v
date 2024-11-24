`timescale 1ns / 1ps

// Módulo de memoria asincrónica con 3 entradas y una salida
module A_MemoriaA(
    input [4:0] index,        // Índice de la memoria de 5 bits
    input R_B,                // Señal de lectura
    input w_B,                // Señal de escritura
    input [31:0] DATA,        // Dato de entrada
    output reg [31:0] DATA_OUT // Dato de salida
);

// Memoria de 32 registros de 32 bits
reg [31:0] M_AS [0:31]; 

// Bloque siempre que se activa cuando hay un cambio en las señales
always @(*) begin
    if (w_B) begin
        M_AS[index] = DATA; // Escribe el dato en la posición de memoria especificada por 'index'
    end
end

// Bloque siempre que se activa cuando hay un cambio en las señales
always @(*) begin
    if (R_B == 1) begin
        DATA_OUT = M_AS[index]; // Si R_B es 1, se lee el dato almacenado en la posición de memoria 'index'
    end
end

endmodule
