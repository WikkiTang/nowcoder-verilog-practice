`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//
    reg data1;
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            data1<=1'b0;
        else
            data1<=data1^data;
    end
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            q<=1'b0;
        else
            q<=q^data1;
    end
    
        
    
//*************code***********//
endmodule
