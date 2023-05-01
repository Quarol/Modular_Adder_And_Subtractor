module HAL (
    x, y,
    not_b, b,
    not_a, a 
);
    input x, y;
    output not_b, b,
           not_a, a;

    wire t;
    assign t = x ^ y;  // temporary variable
    
    assign not_b = x | y;
    assign b = x & y;
    assign not_a = ~t;
    assign a = t;

endmodule