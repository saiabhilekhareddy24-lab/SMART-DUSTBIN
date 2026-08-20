`timescale 1ns/1ps

module smart_dustbin_tb;

    reg clk;
    reg reset;
    reg object_detected;
    reg bin_full;

    wire lid_open;
    wire full_led;

    smart_dustbin uut (
        .clk(clk),
        .reset(reset),
        .object_detected(object_detected),
        .bin_full(bin_full),
        .lid_open(lid_open),
        .full_led(full_led)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("simulation_output.vcd");
        $dumpvars(0, smart_dustbin_tb);

        clk = 0;
        reset = 1;
        object_detected = 0;
        bin_full = 0;

        #10 reset = 0;

        // Object detected - lid should open
        #10 object_detected = 1;
        #10 object_detected = 0;

        // Wait for lid to close automatically
        #120;

        // Bin becomes full
        bin_full = 1;
        #20;

        // Bin is emptied
        bin_full = 0;
        #20;

        $finish;
    end

endmodule
