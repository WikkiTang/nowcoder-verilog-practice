`timescale 1ns/1ns
module mux4_1(
input [1:0]d1,d2,d3,d0,
input [1:0]sel,
output[1:0]mux_out
);
//*************code***********//
   
   reg [1:0]mux_out1;
    always@(*)
    begin
        case(sel)
            2'b00:mux_out1=d3;
            2'b01:mux_out1=d2;
            2'b10:mux_out1=d1;
            2'b11:mux_out1=d0;
        endcase
    end
assign mux_out=mux_out1;
//*************code***********//
endmodule
