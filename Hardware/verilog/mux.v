`ifndef MUX
`define MUX

module MUX(
    sel, a, b,
    out
);
    input sel, a, b;
    output reg out;

    always @*
    if(sel == 1'b0) begin
        out = a;
    end else begin
        out = b;
    end

endmodule

`endif