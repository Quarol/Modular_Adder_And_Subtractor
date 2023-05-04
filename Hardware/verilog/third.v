`include "third_stage/third_stage.v"

module moduleName (
);

    reg     s,
            b4_0, b4,
            w4, v4,
            v3, w3,
            v2, w2,
            v1, w1,
            v0, w0;
    wire    z3, z2, z1, z0;

    THIRD_STAGE dut (
        .s(s),
        .b4_0(b4_0), .b4(b4),
        .w4(w4), .w3(w3), .w2(w2), .w1(w1), .w0(w0),
        .v4(v4), .v3(v3), .v2(v2), .v1(v1), .v0(v0),
        .z3(z3), .z2(z2), .z1(z1), .z0(z0)
    );

    initial begin
        s = 0;
        b4_0 = 0; b4 = 0;
        w4 = 0; v4 = 1;
        v3 = 0; w3 = 1;
        v2 = 0; w2 = 1;
        v1 = 1; w1 = 0;
        v0 = 0; w0 = 1;

        #1
        $display(z3, z2, z1, z0);
    end

endmodule