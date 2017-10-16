`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2017 09:03:26 PM
// Design Name: 
// Module Name: Memory
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


module Memory(
        Clk,
        Zero,
        MemoryAddress,
        MemoryWriteData,
        // Control Signals
        MemWrite, 
        MemRead, 
        Branch,
        // Outputs
        MemoryReadData,
        BranchOut
);
    input Clk, Zero, MemWrite, MemRead, Branch;
    input [31:0] MemoryAddress, MemoryWriteData;
    
    output [31:0] MemoryReadData;
    output BranchOut;
    
    DataMemory Memory(
        .Address(MemoryAddress),
        .WriteData(MemoryWriteData),
        .Clk(Clk),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ReadData(MemoryReadData)
    );
    
    AndGate1Bit(
        .A(Branch),
        .B(Zero),
        .O(BranchOut)
    );
    
endmodule
