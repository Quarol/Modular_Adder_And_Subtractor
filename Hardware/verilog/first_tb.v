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

    reg [15:0] row;
    integer i, count;
    initial begin
        count = 0;

        file = $fopen("filename.txt", "r"); 
        for (i = 0; i < 242; i = i + 1) begin 

            $fread(row, 2*16, file);

            $display(row);
            
        end
        $fclose(file); // Close the file after reading all the data

        $display("Out of 242 operations the number of correct ones are: ", count);
    end

endmodule