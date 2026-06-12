module testbench;

reg [3:0] A;
reg [3:0] B;
reg [2:0] SEL;

wire [3:0] RESULT;
wire CARRY;

alu_4bit uut(
    .A(A),
    .B(B),
    .SEL(SEL),
    .RESULT(RESULT),
    .CARRY(CARRY)
);

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    A = 4'b0101;   // 5
    B = 4'b0011;   // 3

    SEL = 3'b000; #10;   // ADD
    SEL = 3'b001; #10;   // SUB
    SEL = 3'b010; #10;   // AND
    SEL = 3'b011; #10;   // OR
    SEL = 3'b100; #10;   // XOR
    SEL = 3'b101; #10;   // NOT
    SEL = 3'b110; #10;   // LEFT SHIFT
    SEL = 3'b111; #10;   // RIGHT SHIFT

    $finish;

end

endmodule