module tb;

reg [1:0] A, B;
wire GT, LT, EQ;

comp2 U1 (
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
);

integer a, b;

initial begin
    for (a = 0; a < 4; a = a + 1) begin
        for (b = 0; b < 4; b = b + 1) begin
            A = a;
            B = b;
            #1;

            if ((GT !== (a > b)) ||
                (LT !== (a < b)) ||
                (EQ !== (a == b))) begin
                $display("FAIL: A=%d B=%d | GT=%b LT=%b EQ=%b",
                         a, b, GT, LT, EQ);
            end
            else begin
                $display("PASS: A=%d B=%d", a, b);
            end
        end
    end

    $finish;
end

endmodule