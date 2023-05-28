`include "mux.v"

module EIGHT_MUX (
    s,
    b4_0, b4_1, a3_0, a3_1,
    b3_0, b3_1, a2_0, a2_1,
    b2_0, b2_1, a1_0, a1_1,
    b1_0, b1_1, a0_0, a0_1,
    
    a3, b3, 
    a2, b2,
    a1, b1,
    a0, b4
);
reg [3:0] selects = 4'b1111;

parameter [3:0] m = 4'b1100;



    input   s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    output  a3, b3, 
            a2, b2,
            a1, b1,
            a0, b4;
    integer i=0;
    
always @(s) begin

    for (i = 0;i<4 ;i=i+1 ) begin
        if(m[i] == 1 && s==0) begin
            selects[i]=0;
        end 
        if(m[i] == 1 && s==1) begin
            selects[i]=1;
        end

        if(m[i] == 0 && s==1) begin
            selects[i]=0;
        end 
        if(m[i] == 0 && s==0) begin
            selects[i]=1;
        end
    end
end

    MUX mux7 (
        .sel(selects[3]),
        .a(b4_0),
        .b(b4_1),
        .out(b4)
    );

    MUX mux6 (
        .sel(selects[3]),
        .a(a3_0),
        .b(a3_1),
        .out(a3)
    );

    MUX mux5 (
        .sel(selects[2]),
        .a(b3_0),
        .b(b3_1),
        .out(b3)
    );   

    MUX mux4 (
        .sel(selects[2]),
        .a(a2_0),
        .b(a2_1),
        .out(a2)
    ); 

    MUX mux3 (
        .sel(selects[1]),
        .a(b2_0),
        .b(b2_1),
        .out(b2)
    );

    MUX mux2 (
        .sel(selects[1]),
        .a(a1_0),
        .b(a1_1),
        .out(a1)
    );

    MUX mux1 (
        .sel(selects[0]),
        .a(b1_0),
        .b(b1_1),
        .out(b1)
    );   

    MUX mux0 (
        .sel(selects[0]),
        .a(a0_0),
        .b(a0_1),
        .out(a0)
    ); 


endmodule