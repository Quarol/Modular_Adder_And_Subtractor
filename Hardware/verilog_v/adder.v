module ADDER (
    a, b,
    H, G, P
);
    input a, b;
    output H, G, P;

    assign H = a ^ b;
    assign G = a & b;
    assign P = a | b;

endmodule