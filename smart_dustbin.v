module smart_dustbin (
    input  wire clk,
    input  wire reset,
    input  wire object_detected,
    input  wire bin_full,
    output reg  lid_open,
    output reg full_led
);

    reg [3:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lid_open <= 1'b0;
            full_led <= 1'b0;
            counter  <= 4'd0;
        end
        else begin
            full_led <= bin_full;

            if (bin_full) begin
                lid_open <= 1'b0;
                counter  <= 4'd0;
            end
            else if (object_detected) begin
                lid_open <= 1'b1;
                counter  <= 4'd0;
            end
            else if (lid_open) begin
                if (counter < 4'd10)
                    counter <= counter + 1'b1;
                else begin
                    lid_open <= 1'b0;
                    counter  <= 4'd0;
                end
            end
        end
    end

endmodule
