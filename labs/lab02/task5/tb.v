module tb;

reg [3:0] a, b;
reg op;
wire [3:0] result;

alu U1 (
    .a(a),
    .b(b),
    .op(op),
    .result(result)
);

integer i, j;
reg [3:0] expected;

initial begin
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin

            // Addition
            a = i;
            b = j;
            op = 0;
            #1;
            expected = i + j;

            if (result !== expected)
                $display("FAIL ADD: a=%d b=%d result=%d expected=%d",
                         i, j, result, expected);

            // Subtraction
            op = 1;
            #1;
            expected = i - j;

            if (result !== expected)
                $display("FAIL SUB: a=%d b=%d result=%d expected=%d",
                         i, j, result, expected);
        end
    end

    $display("Test complete");
    $finish;
end

endmodule