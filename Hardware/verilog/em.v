`include "second_stage/eight_mux.v"

module MAIN_TB ();
    
    reg     s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;     

    wire    b4,
            a3, b3, 
            a2, b2,
            a1, b1,
            a0;


    EIGHT_MUX dut (
        .s(s),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1),
        .a3(a3), .b3(b3), .a2(a2), .b2(b2), .a1(a1), .b1(b1), .a0(a0),
        .b4(b4)
    );


    integer x, y, S, count;
    initial begin
        for (S = 0; S <= 1; S = S + 1) begin
            for (x = 0; x <= ; ) begin
                
            end
        end
    end

endmodule