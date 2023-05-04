`include "first_stage/first_stage.v"

module MAIN_TB ();
    

    reg     s,
            x3, x2, x1, x0,
            y3, y2, y1, y0;   
    wire    b4_0, b4_1, a3_0, a3_1,
            b3_0, b3_1, a2_0, a2_1,
            b2_0, b2_1, a1_0, a1_1,
            b1_0, b1_1, a0_0, a0_1;
    

    FIRST_STAGE first_stage (
        .s(s),
        .x3(x3), .x2(x2), .x1(x1), .x0(x0),
        .y3(y3), .y2(y2), .y1(y1), .y0(y0),
        .b4_0(b4_0), .b4_1(b4_1), .a3_0(a3_0), .a3_1(a3_1),
        .b3_0(b3_0), .b3_1(b3_1), .a2_0(a2_0), .a2_1(a2_1),
        .b2_0(b2_0), .b2_1(b2_1), .a1_0(a1_0), .a1_1(a1_1),
        .b1_0(b1_0), .b1_1(b1_1), .a0_0(a0_0), .a0_1(a0_1) 
    );

    reg [15:0] row [0:15];
    integer x, y, S, count;
    initial begin

        for (S = 0; S <= 1; S = S + 1) begin
            for (x = 0; x <= 10; x = x + 1) begin
                for (y = 0;  y <= 10; y = y + 1) begin
                    s = S;
                    
                    x3 = x / 8;
                    x2 = (x / 4) % 2;
                    x1 = (x / 2) % 2;
                    x0 = x % 2;
                    y3 = y / 8;
                    y2 = (y / 4) % 2;
                    y1 = (y / 2) % 2;
                    y0 = y % 2;
                    
                    #1

                    $display(b4_0, b4_1, a3_0, a3_1,
                            b3_0, b3_1, a2_0, a2_1,
                            b2_0, b2_1, a1_0, a1_1,
                            b1_0, b1_1, a0_0, a0_1);
                end
            end
        end
    end

endmodule