`timescale 1ns/1ns

module data_cal(
input clk,
input rst,
input [15:0]d,
input [1:0]sel,

output [4:0]out,
output validout
);
//*************code***********//
    reg [4:0]out1;
    reg validout1;
    reg [15:0]d1;
    always@(posedge clk or negedge rst)
        begin
        if(!rst)
            out1<=5'd0;
    else
        case(sel)
            2'd0:
                out1<=5'd0;
            2'd1:
                out1<=d1[3:0]+d1[7:4];
            2'd2:
                out1<=d1[3:0]+d1[11:8];
            2'd3:
                out1<=d1[3:0]+d1[15:12];
        endcase
        end
                
     always@(posedge clk or negedge rst)
        begin
        if(!rst)
            d1<=16'd0;
            else if(sel==2'd0)
                d1<=d;
            else
                d1<=d1;
        end
            
            
always@(posedge clk or negedge rst)
    begin
        if(!rst||sel==2'd0)
            validout1<=1'd0;
    else
        validout1<=1'd1;
    end
    
    assign out=out1;
    assign validout=validout1;
    
//*************code***********//
endmodule
