`timescale 1ns / 1ps

module Testbench;

    // Entradas del módulo A_MemoriaA
    reg [4:0] index;            // Dirección de la memoria
    reg R_B;                    // Señal de lectura
    reg w_B;                    // Señal de escritura
    reg [31:0] DATA;            // Dato de entrada
    
    // Salida del módulo
    wire [31:0] DATA_OUT;       // Dato de salida
    
    // Instancia del módulo A_MemoriaA
    A_MemoriaA uut (
        .index(index),
        .R_B(R_B),
        .w_B(w_B),
        .DATA(DATA),
        .DATA_OUT(DATA_OUT)
    );

    // Bloque inicial para aplicar estímulos
    initial begin
        // Inicialización de señales
        index = 5'b00000;       // Dirección inicial de la memoria
        R_B = 0;                // Señal de lectura desactivada
        w_B = 1;                // Señal de escritura activada

        // --- Operaciones de Suma (ADD) ---
        $display("----- SUMA (ADD) -----");
        DATA = 32'b000000_00001_00010_00011_00000_100000; // ADD R3 = R1 + R2
        #10; index = index + 1;

        DATA = 32'b000000_00011_00100_00101_00000_100000; // ADD R5 = R3 + R4
        #10; index = index + 1;

        DATA = 32'b000000_00101_00110_00111_00000_100000; // ADD R7 = R5 + R6
        #10; index = index + 1;

        // --- Operaciones de Resta (SUB) ---
        $display("----- RESTA (SUB) -----");
        DATA = 32'b000000_00111_00110_01000_00000_100010; // SUB R8 = R7 - R6
        #10; index = index + 1;

        DATA = 32'b000000_01000_00011_01001_00000_100010; // SUB R9 = R8 - R3
        #10; index = index + 1;

        DATA = 32'b000000_01001_00001_01010_00000_100010; // SUB R10 = R9 - R1
        #10; index = index + 1;

        // --- Operaciones de OR ---
        $display("----- OR -----");
        DATA = 32'b000000_00001_00010_01011_00000_100101; // OR R11 = R1 | R2
        #10; index = index + 1;

        DATA = 32'b000000_00011_00100_01100_00000_100101; // OR R12 = R3 | R4
        #10; index = index + 1;

        DATA = 32'b000000_00101_00110_01101_00000_100101; // OR R13 = R5 | R6
        #10; index = index + 1;

        // --- Operaciones de AND ---
        $display("----- AND -----");
        DATA = 32'b000000_00001_00010_01110_00000_100100; // AND R14 = R1 & R2
        #10; index = index + 1;

        DATA = 32'b000000_00011_00100_01111_00000_100100; // AND R15 = R3 & R4
        #10; index = index + 1;

        DATA = 32'b000000_00101_00110_10000_00000_100100; // AND R16 = R5 & R6
        #10; index = index + 1;

        // --- Operaciones de Multiplicación (MUL) ---
        $display("----- MULTIPLICACIÓN (MUL) -----");
        DATA = 32'b000000_00001_00010_10001_00000_011000; // MUL R17 = R1 * R2
        #10; index = index + 1;

        DATA = 32'b000000_00011_00100_10010_00000_011000; // MUL R18 = R3 * R4
        #10; index = index + 1;

        DATA = 32'b000000_00101_00110_10011_00000_011000; // MUL R19 = R5 * R6
        #10; index = index + 1;

        // --- Detener la simulación ---
        $display("Simulación finalizada");
        $stop;
    end
endmodule
