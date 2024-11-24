`timescale 1ns/1ps
module A_BancoRegistros(
    input [31:0] data,          
    input enable_w,             
    input [4:0] read_data1,     
    input [4:0] read_data2,     
    input [4:0] write_data,     
    output reg [31:0] out_d1,  
    output reg [31:0] out_d2   
);

reg [31:0] banco [0:31];      


always @(*) begin
    if (enable_w) begin
        banco[write_data] = data; 
    end
end

always @(*) begin
    out_d1 = banco[read_data1];  // Read dir 1
    out_d2 = banco[read_data2];   // Read dir 1
end

//Inicializar
initial begin
    banco[0] = 32'h00000001;    // Registro madre
    banco[1] = 32'h00000001; 
    banco[2] = 32'h00000001;    // LOAD
    banco[3] = 32'h00000001;    // SAVE
    banco[4] = 32'h00000001;    // ADD
    banco[5] = 32'h00000001;    // AND
    banco[6] = 32'h00000001;    // OR
    banco[7] = 32'h00000000; 
    banco[8] = 32'h00000000; 
 
end

endmodule
