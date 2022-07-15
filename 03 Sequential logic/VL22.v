`timescale 1ns/1ns
module seq_circuit(
   input                C   ,
   input                clk ,
   input                rst_n,
 
   output   wire        Y   
);
    reg [1:0] state,next_state;
    
    always@(posedge clk or negedge rst_n)
        begin
            if(!rst_n)
                state<=2'b00;
            else
                state<=next_state;
        end
    
    always@(*)
        begin
            case(state)
                2'b00:
                    if(C)
                        next_state=2'b01;
                    else
                        next_state=2'b00;
                2'b01:
                    if(C)
                        next_state=2'b01;
                else
                    next_state=2'b11;
                2'b11:
                    if(C)
                        next_state=2'b10;
                else
                    next_state=2'b11;
                2'b10:
                    if(C)
                        next_state=2'b10;
                else
                    next_state=2'b00;
            endcase
        end
                
    assign Y=(state==2'b10&&C==1'b1)||(state==2'b11);
                
endmodule
