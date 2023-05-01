module HAL_tb;

  // Inputs
  reg x;
  reg y;

  // Outputs
  wire not_b;
  wire b;
  wire not_a;
  wire a;

  // Instantiate the HAL module
  HAL HAL_inst(.x(x), .y(y), .not_b(not_b), .b(b), .not_a(not_a), .a(a));

  // Stimulus generation
  initial begin
    integer i, j;

    $dumpfile("test.vcd");
    $dumpvars(0, testbench);

    for (i = 0; i < 2; i = i + 1) begin
      for (j = 0; j < 2; j = j + 1) begin
        x = i;
        y = j;

        #10;

        $display("x = %b, y = %b, not_b = %b, b = %b, not_a = %b, a = %b", x, y, not_b, b, not_a, a);
      end
    end

    $finish;
  end

endmodule
