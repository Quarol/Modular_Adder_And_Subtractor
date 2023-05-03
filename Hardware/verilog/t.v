`include "second_stage/second_stage.v"

module moduleName (
);

    reg   s,
            b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;

    wire    w4, w3, w2, w1, w0,
            v4, v3, v2, v1, v0,
            b4;

    SECOND_STAGE dut (
        .s(s),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1), 
        .w4(w4), .w3(w3), .w2(w2), .w1(w1), .w0(w0),
        .v4(v4), .v3(v3), .v2(v2), .v1(v1), .v0(v0),
        .b4(b4)
    );

    initial begin
        s = 0;
        b4_0 = 0; b4_1 = 1; a3_0 = 1; a3_1 = 0;
        b3_0 = 0; b3_1 = 1; a2_0 = 1; a2_1 = 0;
        b2_0 = 0; b2_1 = 0; a1_0 = 0; a1_1 = 1;
        b1_0 = 0; b1_1 = 1; a0_0 = 1; a0_1 = 0;

        #1

        $display(w4, w3, w2, w1, w0);
        $display(v4, v3, v2, v1, v0);
        $display(b4);
    end

endmodule