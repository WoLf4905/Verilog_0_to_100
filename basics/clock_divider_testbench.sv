`timescale 1ns/1ps
module clock_divider_testbench;
    logic clk_in;
    logic reset;
    logic [1:0] N;
    logic clk_out;

    clock_divider uut(
        .clk_in(clk_in),
        .reset(reset),
        .N(N),
        .clk_out(clk_out)
    );

    always
    begin
        #5 clk_in=~clk_in;
    end

    initial
    begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,clock_divider_testbench);
        clk_in=0;
        reset=1;
        N=2'b10;
        #20 reset=0;
        #200;
        $display("Changing division factor N to 1 ...");
        N=2'b01;
        #100;
        $finish;
    end
endmodule