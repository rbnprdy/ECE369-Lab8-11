`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 10:32:01 AM
// Design Name: 
// Module Name: ALUController
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALUController(Instruction_31_16, Instruction_10_0, ALUOp);
    
    input [31:16] Instruction_31_16;
    input [10:0] Instruction_10_0;
    
    output reg [4:0] ALUOp;
    
    always@(*) begin
        
        // Add
        if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100000) || (Instruction_31_16[31:26] == 6'b001000) || (Instruction_31_16[31:26] == 6'b100000) || (Instruction_31_16[31:26] == 6'b100001) || (Instruction_31_16[31:26] == 6'b100011) || (Instruction_31_16[31:26] == 6'b101000) || (Instruction_31_16[31:26] == 6'b101001) || (Instruction_31_16[31:26] == 6'b101011))
            ALUOp <= 5'b00000;

        // Subtract
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100010) || (Instruction_31_16[31:26] == 6'b000100))
            ALUOp <= 5'b00001;
        
        // Multiply
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b011000) || Instruction_31_16[31:26] == 6'b011100)
            ALUOp <= 5'b00010;
            
        // And
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100100) || Instruction_31_16[31:26] == 6'b001100)
            ALUOp <= 5'b00011;
        
        // Or
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100101) || Instruction_31_16[31:26] == 6'b001101)
            ALUOp <= 5'b00100;
        
        // Xor
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100110) || Instruction_31_16[31:26] == 6'b001110)
            ALUOp <= 5'b00101;
            
        // Nor
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100111)
            ALUOp <= 5'b00110;
            
        // Sll
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b000000)
            ALUOp <= 5'b00111;
            
        // Srl
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_31_16[25:21] == 5'b00000 && Instruction_10_0[5:0] == 6'b000010)
            ALUOp <= 5'b01000;
       
        // Rotr
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_31_16[25:21] == 5'b00001 && Instruction_10_0[5:0] == 6'b000010)
            ALUOp <= 5'b01001;
            
        // Sra
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b000011)
            ALUOp <= 5'b01010;
            
        // Seh
        else if (Instruction_31_16[31:26] == 6'b011111 && Instruction_10_0[10:6] == 5'b11000 && Instruction_10_0[5:0] == 6'b100000)
            ALUOp <= 5'b01011;
            
        // Addu
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b100001) || Instruction_31_16[31:26] == 6'b001001)
            ALUOp <= 5'b01100;
            
        // Multu
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b011001)
            ALUOp <= 5'b01101;
        
        // Slt
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b101010) || Instruction_31_16[31:26] == 6'b001010)
            ALUOp <= 5'b01110;
            
        // Seb
        else if (Instruction_31_16[31:26] == 6'b011111 && Instruction_10_0[10:6] == 5'b10000 && Instruction_10_0[5:0] == 6'b100000)
            ALUOp <= 5'b01111; 
            
        // Sltu
        else if ((Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[10:6] == 5'b00000 && Instruction_10_0[5:0] == 6'b101011) || (Instruction_31_16[31:26] == 6'b001011))
            ALUOp <= 5'b10000;
            
        // Sllv
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b000100)
            ALUOp <= 5'b10001;
            
        // Srlv
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[10:6] == 5'b00000 && Instruction_10_0[5:0] == 6'b000110)
            ALUOp <= 5'b10010;
            
        // Srav
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[5:0] == 6'b000111)
            ALUOp <= 5'b10011;
            
        // Rotrv
        else if (Instruction_31_16[31:26] == 6'b000000 && Instruction_10_0[10:6] == 5'b00001 && Instruction_10_0[5:0] == 6'b000110)
            ALUOp <= 5'b10100;
            
        // Movn/Movz/Mtlo/Mthi
        else if (Instruction_31_16[31:26] == 6'b000000 && (Instruction_10_0[5:0] == 6'b001011 || Instruction_10_0[5:0] == 6'b001010 || Instruction_10_0[5:0] == 6'b010011 || Instruction_10_0[5:0] == 6'b010001))
            ALUOp <= 5'b10101;
            
        // Lui
        else if (Instruction_31_16[31:26] == 6'b001111)
            ALUOp <= 5'b10110;
        
        // Bltz
        else if (Instruction_31_16[31:26] == 6'b000001 && Instruction_31_16[20:16] == 5'b00000)
            ALUOp <= 5'b10111;
            
        // Blez
        else if (Instruction_31_16[31:26] == 6'b000110)
            ALUOp <= 5'b11000;
            
        // Bgtz
        else if (Instruction_31_16[31:26] == 6'b000111)
            ALUOp <= 5'b11001;
        
        // Bgez
        else if (Instruction_31_16[31:26] == 6'b000001 && Instruction_31_16[20:16] == 5'b00001)
            ALUOp <= 5'b11010;
            
        // bne
        else if (Instruction_31_16[31:26] == 6'b000101)
            ALUOp <= 5'b11011;
       
        // Default to 11111
        else
            ALUOp <= 5'b11111;
           
    end
endmodule
