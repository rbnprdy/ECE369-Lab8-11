`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2017 03:21:48 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(Clk, RD1In, RD2In, InstructionIn, SignExtendIn, MsubIn, MaddIn, HiWriteIn, LoWriteIn, RegWriteIn, MoveNotZeroIn, DontMoveIn, HiOrLoIn, MemToRegIn, HiLoToRegIn, MemWriteIn, BranchIn, MemReadIn, RegDestIn, ALUSrcIn, LbIn, LoadExtendedIn, RD1Out, RD2Out, InstructionOut, SignExtendOut, MsubOut, MaddOut, HiWriteOut, LoWriteOut, RegWriteOut, MoveNotZeroOut, DontMoveOut, HiOrLoOut, MemToRegOut, HiLoToRegOut, MemWriteOut, BranchOut, MemReadOut, RegDestOut, ALUSrcOut, LbOut, LoadExtendedOut, JumpIn, JumpOut, JalIn, JalOut, RaIn, RaOut);
    input [31:0] RD1In, RD2In, InstructionIn, SignExtendIn, RaIn;
    input MsubIn, MaddIn, HiWriteIn, LoWriteIn, RegWriteIn, MoveNotZeroIn, DontMoveIn, HiOrLoIn, MemToRegIn, HiLoToRegIn, MemWriteIn, BranchIn, MemReadIn, RegDestIn, ALUSrcIn, LbIn, LoadExtendedIn, Clk, JumpIn, JalIn;
    
    output reg [31:0] RD1Out, RD2Out, InstructionOut, SignExtendOut, RaOut;
    output reg MsubOut, MaddOut, HiWriteOut, LoWriteOut, RegWriteOut, MoveNotZeroOut, DontMoveOut, HiOrLoOut, MemToRegOut, HiLoToRegOut, MemWriteOut, BranchOut, MemReadOut, RegDestOut, ALUSrcOut, LbOut, LoadExtendedOut, JumpOut, JalOut;

    always @(negedge Clk) begin
        RD1Out <= RD1In;
        RD2Out <= RD2In;
        InstructionOut <= InstructionIn;
        SignExtendOut <= SignExtendIn;
        MsubOut <= MsubIn;
        MaddOut <= MaddIn;
        HiWriteOut <= HiWriteIn;
        LoWriteOut <= LoWriteIn;
        RegWriteOut <= RegWriteIn;
        MoveNotZeroOut <= MoveNotZeroIn;
        DontMoveOut <= DontMoveIn;
        HiOrLoOut <= HiOrLoIn;
        MemToRegOut <= MemToRegIn;
        HiLoToRegOut <= HiLoToRegIn;
        MemWriteOut <= MemWriteIn;
        BranchOut <= BranchIn;
        MemReadOut <= MemReadIn;
        RegDestOut <= RegDestIn;
        ALUSrcOut <= ALUSrcIn;
        LbOut <= LbIn;
        LoadExtendedOut <= LoadExtendedIn;
        JumpOut <= JumpIn;
        JalOut <= JalIn;
        RaOut <= RaIn;
    end

endmodule
