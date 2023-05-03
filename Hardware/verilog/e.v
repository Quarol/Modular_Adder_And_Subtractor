`include "second_stage/eight_mux.v"

module moduleName (
);

    reg     s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    wire    a3, b3, 
            a2, b2,
            a1, b1,
            a0, b4;


   EIGHT_MUX dut (
        .s(s),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1),
        .a3(a3), .b3(b3), .a2(a2), .b2(b2), .a1(a1), .b1(b1), .a0(a0),
        .b4(b4)
    );

 
    initial begin
        s = 0;
        b4_0 = 0; b4_1 = 1; a3_0 = 1; a3_1 = 0;
        b3_0 = 0; b3_1 = 1; a2_0 = 1; a2_1 = 0;
        b2_0 = 0; b2_1 = 0; a1_0 = 0; a1_1 = 1;
        b1_0 = 0; b1_1 = 1; a0_0 = 1; a0_1 = 0;

        #1

        $display(a3, b3, 
            a2, b2,
            a1, b1,
            a0, b4);
    end

endmodule