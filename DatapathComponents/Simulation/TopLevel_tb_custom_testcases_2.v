`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2017 11:21:07 AM
// Design Name: 
// Module Name: TopLevel_tb_custom_testcases_2
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


module TopLevel_tb_custom_testcases_2();

    reg Clk, Rst;
        
    wire [31:0] WriteData, PCValue, HiReg, LoReg;
    
    integer tests, passed;
    
    TopLevel m0(
        .Clk(Clk),
        .Rst(Rst),
        .WriteData(WriteData),
        .PCValue(PCValue),
        .HiReg(HiReg),
        .LoReg(LoReg)
    );
          
    initial begin
        Clk <= 1'b0;
        forever #100 Clk <= ~Clk;
    end
    
    initial begin
        tests <= 0;
        passed <= 0;
        Rst <= 1;
        
        $display("\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        $display("Starting Unit Tests.");
        
        @(negedge Clk);
        @(negedge Clk);
        Rst <= 0;
        @(negedge Clk);
        @(negedge Clk);
        @(negedge Clk);
        
        // main:
        
        
        // la $a1, asize0        
        @(negedge Clk);
        tests = tests + 1; // Test #1
        #5 if (WriteData == 32'h0)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #1: la $a1, asize0. Exceptect WriteData: 0. Actual WriteData: %h", $time, WriteData);
        
        
        //// BEGIN FORWARDING TESTS ////
        
        
        //// Forward from addi to mthi ////
        
        // addi $s1, $zero, 4    
        @(negedge Clk);
        tests = tests + 1; // Test #2
        #5 if (WriteData == 32'd4)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #2: addi $s1, $zero, 4. Exceptect WriteData: 4. Actual WriteData: %d", $time, WriteData);
        
        // mthi $s1
        @(negedge Clk);
        
        // mfhi $s2              
        @(negedge Clk);
        tests = tests + 1; // Test #3
        #5 if (WriteData == 32'd4)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #3: mfhi $s2. Exceptect WriteData: 4. Actual WriteData: %d", $time, WriteData);
        
        
        //// Forward from lw to mthi ////
        
        // lw $s3, 0($a1)        
        @(negedge Clk);
        tests = tests + 1; // Test #4
        #5 if (WriteData == 32'd100)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #4: lw $s3, 0($a1). Exceptect WriteData: 100. Actual WriteData: %d", $time, WriteData);
        
        // Stalling. 
        @(negedge Clk);
        
        // mthi $s3
        @(negedge Clk);
        
        // mfhi $s1              
        @(negedge Clk);
        tests = tests + 1; // Test #5
        #5 if (WriteData == 32'd100)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #5: mfhi $s1. Exceptect WriteData: 100. Actual WriteData: %d", $time, WriteData);
        
        
        //// Forward from lw to addi ////
        
        // lw $s4, 0($a1)        
        @(negedge Clk);
        tests = tests + 1; // Test #6
        #5 if (WriteData == 32'd100)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #6: lw $s4, 0($a1). Exceptect WriteData: 100. Actual WriteData: %d", $time, WriteData);
        
        // lw $s4, 4($a1)        
        @(negedge Clk);
        tests = tests + 1; // Test #7
        #5 if (WriteData == 32'd200)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #7: lw $s4, 4($a1). Exceptect WriteData: 200. Actual WriteData: %d", $time, WriteData);
        
        // lw $s4, 8($a1)        
        @(negedge Clk);
        tests = tests + 1; // Test #8
        #5 if (WriteData == 32'd300)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #8: lw $s4, 8($a1). Exceptect WriteData: 300. Actual WriteData: %d", $time, WriteData);
        
        // Stalling. 
        @(negedge Clk);
        
        // add $s4, $s4, $s1     
        @(negedge Clk);
        tests = tests + 1; // Test #9
        #5 if (WriteData == 32'd400)
            passed = passed + 1;
        else
            $display("Time: %0d. Failed Test #9: add $s4, $s4, $s1. Exceptect WriteData: 400. Actual WriteData: %d", $time, WriteData);
        
        // Stalling. 
        @(negedge Clk);
        
        // bgez $s4, branch1     
        @(negedge Clk);
        
        // branch1:
        
        
        //// flush ////
        
        // bgez $s4, branch2     
        @(negedge Clk);
        
        // branch2:
        
        
        //// flush ////
        
        // bgez $s1, branch3     
        @(negedge Clk);
        
        // branch3:
        
        // j done
        @(negedge Clk);
        
        // done:
        
        // j done
        @(negedge Clk);
        
        // Report results
        if (passed == tests)
            $display("All tests passed.");
        else
            $display("%3d out of %3d tests passed.", passed, tests);
        $display("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n");

    end
endmodule