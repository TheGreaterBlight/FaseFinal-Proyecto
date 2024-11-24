`timescale 1ns/1ps

// Módulo principal: parte2 proyecto
module A_Runner(
    input [31:0] Instruccion  // Instrucción de 32 bits
);

// Señales internas para la unidad de control y demás componentes
// Unidad de control
wire escri_banco, escri_memo, lec_memo, mux_f, mux_ins, mux_data;
wire [2:0] habili;

// Señales de ALU control
wire [3:0] opera;

// Banco de registros
wire [31:0] r1_o, r2_o;
wire [4:0] mux_ins_o;    // MUX de instrucción
wire [31:0] ext_o;       // Extensión de signo
wire [31:0] mux_d_o;     // MUX de datos ALU

// Señales de ALU
wire zf_o;
wire [31:0] alu_o;       // Resultado de la ALU

// Memoria
wire [31:0] memo_o;      // Salida de la memoria

// MUX final
wire [31:0] mux_f_o;

// Instancias de módulos

// Instancia de la unidad de control
unidad_control unidad_control_1 (
    .opera_in(Instruccion[31:26]), // Señal de operación
    .we_banco(escri_banco),         // Habilitador del banco de registros
    .w_e_memo(escri_memo),          // Habilitador de escritura de memoria
    .r_e_memo(lec_memo),            // Habilitador de lectura de memoria
    .habilitador(habili),           // Señal habilitadora para ALU control
    .MUX_F(mux_f),                  // Señal para MUX de datos
    .MUX_INS(mux_ins),
    .MUX_D_A(mux_data)
);

// Instancia del ALU control
ALU_control ALU_control_1 (
    .signal_u_con(habili),         // Señal de habilitación
    .funcion(Instruccion[5:0]),    // Señal de función de la operación
    .opera(opera)                  // Señal de operación
);

// Instancia del banco de registros
banco_reg banco_reg_1 (
    .data(mux_f_o),                // Datos de entrada
    .enable_w(escri_banco),        // Señal de habilitación para escritura
    .read_data1(Instruccion[25:21]),  // Dirección de lectura 1
    .read_data2(Instruccion[20:16]),  // Dirección de lectura 2
    .write_data(mux_ins_o),        // Dirección de destino para escritura
    .out_d1(r1_o),                 // Salida de lectura 1
    .out_d2(r2_o)                  // Salida de lectura 2
);

// Instancia de la ALU
ALU ALU_C_1 (
    .A(r1_o),                      // Entrada A
    .B(mux_d_o),                   // Entrada B (MUX de datos)
    .SELECTOR(opera),              // Selector de la operación
    .RESULTADO(alu_o),             // Resultado de la ALU
    .ZF(zf_o)                      // Flag de cero
);

// Instancia de la memoria asincrónica
MEMO_ASIN MEMO_ASIN_1 (
    .Index(alu_o[4:0]),            // Dirección de memoria (5 bits)
    .RB(lec_memo),                 // Señal de lectura de memoria
    .w_B(escri_memo),              // Señal de escritura de memoria
    .DATA(mux_d_o),                // Dato de entrada
    .DATA_OUT(memo_o)              // Dato de salida
);

// Instancia del MUX 3-1 para MUX de final
MUX_3_1 MUX_3_1_f (
    .IN_M(alu_o),                  // Entrada ALU
    .IN_ALU(memo_o),               // Entrada de la memoria
    .SELECTOR(mux_f),              // Selector para el MUX
    .RESULTADO(mux_f_o)            // Resultado del MUX final
);

// Instancia del MUX 3-1 para MUX de datos
MUX_3_1 MUX_3_1_d (
    .IN_M(r2_o),                   // Entrada r2_o
    .IN_ALU(ext_o),                // Entrada ALU
    .SELECTOR(mux_data),           // Selector para el MUX
    .RESULTADO(mux_d_o)            // Resultado del MUX de datos
);

// Instancia de la extensión de signo
EXT_SIG EXT_SIG1 (
    .data_in(Instruccion[15:0]),   // Entrada de 16 bits de la instrucción
    .extendido(ext_o)               // Salida de la extensión de signo
);

// Instancia del MUX de instrucción
MUX_INST MUX_INST_1 (
    .RT(Instruccion[20:16]),        // Dirección de lectura 2 (tipo I)
    .RD(Instruccion[15:11]),        // Dirección de destino (tipo R)
    .selector(mux_ins),             // Selector para el MUX de instrucción
    .SALIDA(mux_ins_o)              // Dato de salida del MUX
);

endmodule

