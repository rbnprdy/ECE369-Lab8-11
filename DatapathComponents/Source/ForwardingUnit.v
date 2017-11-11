`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2017 06:33:12 PM
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(Rs, Rt, Rd_Mem, Rd_Wb, ALUSrc, RegWrite_Mem, RegWrite_Wb, ForwardA, ForwardB);
    input [4:0] Rs, Rt, Rd_Mem, Rd_Wb;
    input ALUSrc, RegWrite_Mem, RegWrite_Wb;
    
    output reg [1:0] ForwardA, ForwardB;
    
    always@(*) begin
        // Forwarding from Mem to ALU input A
        if ((RegWrite_Mem == 1) && (Rd_Mem != 5'd0) && (Rd_Mem == Rs))
            ForwardA <= 2'b10;
        // Forwarding from Wb to ALU input A
        else if ((RegWrite_Wb == 1) && (Rd_Wb != 5'd0) && (Rd_Wb == Rs))
            ForwardA <= 2'b01;
        else
            ForwardA <= 2'b00;
            
        // Forwarding from Mem to ALU input B
        if ((RegWrite_Mem == 1) && (Rd_Mem != 5'd0) && (Rd_Mem == Rt) && (ALUSrc == 0))
            ForwardB <= 2'b10;
        // Forwarding from Wb to ALU input B
        else if ((RegWrite_Wb == 1) && (Rd_Wb != 5'd0) && (Rd_Wb == Rt) && (ALUSrc == 0))
            ForwardB <= 2'b01;
        else
            ForwardB <= 2'b00;     
    end
endmodule