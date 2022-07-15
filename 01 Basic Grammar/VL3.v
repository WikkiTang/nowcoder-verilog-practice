`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);
    reg check1;
//*************code***********//
    always@(*)
        begin
            if(sel)
                check1=^bus;
            else
                check1=~^bus;
        end
            
assign check=check1;
//*************code***********//
endmodule
