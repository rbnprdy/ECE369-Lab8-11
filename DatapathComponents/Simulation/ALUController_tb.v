`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2017 11:19:17 AM
// Design Name: 
// Module Name: ALUController_tb
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


module ALUController_tb();
    
    reg [31:0] Instruction;
    
    wire [4:0] ALUOp;
    
    integer tests;
    integer passed;
    
    ALUController u0(
        .Instruction(Instruction), 
        .ALUOp(ALUOp)
    );
    
    initial begin
        // Initial Assignment
        Instruction <= 32'd0;
        tests <= 0;
        passed <= 0;
                
        $display("\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        $display("Starting Unit Tests.");
        
        ///////// TYPE-R INSTRUCTIONS //////////
        
        #5 // Test Add
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 6'b100000}; // add
        #5 if (ALUOp == 5'b00000)
            passed = passed + 1;
        else
            $display("Test Add Failed.");
        
        #5 // Test Addu
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 6'b100001}; // add
        #5 if (ALUOp == 5'b01100)
            passed = passed + 1;
        else
            $display("Test Addu Failed.");
            
        #5 // Test And
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 6'b100100}; // add
        #5 if (ALUOp == 5'b00011)
            passed = passed + 1;
        else
            $display("Test And Failed.");
            
        #5 // Test Nor
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00010, 5'b00001, 5'b00000, 6'b100111}; // add
        #5 if (ALUOp == 5'b00110)
            passed = passed + 1;
        else
            $display("Test Nor Failed.");
            
        #5 // Test Or
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00010, 5'b00001, 5'b00000, 6'b100101}; // add
        #5 if (ALUOp == 5'b00100)
            passed = passed + 1;
        else
            $display("Test Or Failed.");
            
        #5 // Test Rotr
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00001, 5'b00010, 5'b00001, 5'b00000, 6'b000010}; // add
        #5 if (ALUOp == 5'b01001)
            passed = passed + 1;
        else
            $display("Test Rotr Failed.");
            
        #5 // Test Rotrv
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00010, 5'b00001, 5'b00001, 6'b000110};
        #5 if (ALUOp == 5'b10100)
            passed = passed + 1;
        else
            $display("Test Rotrv Failed. ALUOp: %b", ALUOp);
            
        #5 // Test Sll
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00010, 5'b00001, 5'b00000, 6'b000000}; // add
        #5 if (ALUOp == 5'b00111)
            passed = passed + 1;
        else
            $display("Test Sll Failed.");
            
        #5 // Test Sllv
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b000100}; // add
        #5 if (ALUOp == 5'b10001)
            passed = passed + 1;
        else
            $display("Test Sllv Failed.");
            
        #5 // Test Slt
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b101010}; // add
        #5 if (ALUOp == 5'b01110)
            passed = passed + 1;
        else
            $display("Test Slt Failed.");
                        
        #5 // Test Sltu
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b101011}; // add
        #5 if (ALUOp == 5'b10000)
            passed = passed + 1;
        else
            $display("Test Sltu Failed.");
            
        #5 // Test Sra
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 6'b000011}; // add
        #5 if (ALUOp == 5'b01010)
            passed = passed + 1;
        else
            $display("Test Sra Failed.");
            
        #5 // Test Srav
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b000111}; // add
        #5 if (ALUOp == 5'b10011)
            passed = passed + 1;
        else
            $display("Test Srav Failed.");
            
        #5 // Test Srl
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00000, 5'b00000, 5'b00001, 5'b00000, 6'b000010}; // add
        #5 if (ALUOp == 5'b01000)
            passed = passed + 1;
        else
            $display("Test Srl Failed.");
            
        #5 // Test Srlv
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b000110}; // add
        #5 if (ALUOp == 5'b10010)
            passed = passed + 1;
        else
            $display("Test Srlv Failed.");
        
        #5 // Test Sub
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b100010}; // add
        #5 if (ALUOp == 5'b00001)
            passed = passed + 1;
        else
            $display("Test Sub Failed.");
            
        #5 // Test Xor
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b100110}; // add
        #5 if (ALUOp == 5'b00101)
            passed = passed + 1;
        else
            $display("Test Xor Failed.");
            
        #5 // Test Movn
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b001011}; // add
        #5 if (ALUOp == 5'b10101)
            passed = passed + 1;
        else
            $display("Test Movn Failed.");
            
        #5 // Test Movz
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00000, 5'b00001, 5'b00000, 6'b001010}; // add
        #5 if (ALUOp == 5'b10101)
            passed = passed + 1;
        else
            $display("Test Movz Failed.");
            
        #5 // Test Mult
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b00010)
            passed = passed + 1;
        else
            $display("Test Mult Failed.");
           
        #5 // Test Multu
        tests = tests + 1;
        Instruction <= {6'b000000, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011001};
        #5 if (ALUOp == 5'b01101)
            passed = passed + 1;
        else
            $display("Test Multu Failed.");
            
        ///////// TYPE-I INSTRUCTIONS //////////
        
        #5 // Test Addi
        tests = tests + 1;
        Instruction <= {6'b001000, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b00000)
            passed = passed + 1;
        else
            $display("Test Addi Failed.");
            
        #5 // Test Addiu
        tests = tests + 1;
        Instruction <= {6'b001001, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b01100)
            passed = passed + 1;
        else
            $display("Test Addiu Failed.");
            
        #5 // Test Slti
        tests = tests + 1;
        Instruction <= {6'b001010, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b01110)
            passed = passed + 1;
        else
            $display("Test Slti Failed.");
            
        #5 // Test Sltiu
        tests = tests + 1;
        Instruction <= {6'b001011, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b10000)
            passed = passed + 1;
        else
            $display("Test Sltiu Failed.");
            
        #5 // Test Andi
        tests = tests + 1;
        Instruction <= {6'b001100, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b00011)
            passed = passed + 1;
        else
            $display("Test Andi Failed.");
            
        #5 // Test Ori
        tests = tests + 1;
        Instruction <= {6'b001101, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b00100)
            passed = passed + 1;
        else
            $display("Test Ori Failed.");
            
        #5 // Test Xori
        tests = tests + 1;
        Instruction <= {6'b001110, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b011000};
        #5 if (ALUOp == 5'b00101)
            passed = passed + 1;
        else
            $display("Test Xori Failed.");
            
        #5 // Test Mul
        tests = tests + 1;
        Instruction <= {6'b011100, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b000010};
        #5 if (ALUOp == 5'b00010)
            passed = passed + 1;
        else
            $display("Test Mul Failed.");
            
        #5 // Test Madd
        tests = tests + 1;
        Instruction <= {6'b011100, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b000000};
        #5 if (ALUOp == 5'b00010)
            passed = passed + 1;
        else
            $display("Test Madd Failed.");
            
        #5 // Test Msub
        tests = tests + 1;
        Instruction <= {6'b011100, 5'b00011, 5'b00001, 5'b00000, 5'b00000, 6'b000100};
        #5 if (ALUOp == 5'b00010)
            passed = passed + 1;
        else
            $display("Test Msub Failed.");
            
        #5 // Test Seb
        tests = tests + 1;
        Instruction <= {6'b011111, 5'b00011, 5'b00001, 5'b00000, 5'b10000, 6'b100000};
        #5 if (ALUOp == 5'b01111)
            passed = passed + 1;
        else
            $display("Test Seb Failed.");
            
        #5 // Test Seh
        tests = tests + 1;
        Instruction <= {6'b011111, 5'b00011, 5'b00001, 5'b00000, 5'b11000, 6'b100000};
        #5 if (ALUOp == 5'b01011)
            passed = passed + 1;
        else
            $display("Test Seh Failed.");
            
        // Report results
        if (passed == tests)
            $display("All tests passed.");
        else
            $display("%2d out of %2d test passed.", passed, tests);
        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n");
   
    end
endmodule
