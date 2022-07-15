`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant=1'd0,
    output reg [10:0]out=11'd0
);
//*************code***********//
    reg [2:0]state,next_state;
    reg [7:0]d1; 
 localparam A=3'd0,B=3'd1,C=3'd2,D=3'd3,IDLE=3'd4;
    
    always@(posedge clk or negedge rst)
    begin
    if(!rst)
        state<=IDLE;
    else
        state<=next_state;
    end
    
    always@(*)
        case(state)
            IDLE:
                next_state=A;
            A:
                next_state=B;
            B:
                next_state=C;
            C:
                next_state=D;
            D:
                next_state=A;
        endcase
  
    always@(posedge clk or negedge rst)
        begin
            if(!rst)
                d1<=0;
            else if(next_state==A)
            d1<=d;
       else
           d1<=d1;
        end
  
    always@(*)
        begin
       if(state==A)
           begin
            out=d1;
           end
       else if(state==B)
            out=(d1<<1)+d1;
       else if(state==C)
            out=(d1<<3)-d1;
       else if(state==D)
            out=(d1<<3);
        end
    
  
    
    always@(*)
        begin
       if(state==A)
                input_grant=1'b1;
            else
                input_grant=1'b0;
        end
    
//*************code***********//
endmodule
