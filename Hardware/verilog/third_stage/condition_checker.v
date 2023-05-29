module CONDITION_CHECKER (
    s,
    b4_0, b4,
    w4, v4,
    out
);
    input   s,
            b4_0, b4,
            w4, v4;
    
    output  out;

    wire in_1, in_2;
    assign in_1 = (w4 | b4_0) & s;
    assign in_2 = (v4 ~| b4) & (~s);

    assign out = in_1 | in_2;

endmodule