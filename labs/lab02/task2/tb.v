// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  // TODO: declare the inputs and outputs
reg [1:0] sel;
wire [7:0] dout;

lut U1 (
    .sel(sel),
    .dout(dout)
);
  // TODO: instantiate DUT here

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, U1);
    end
  end

  initial begin
    sel = 0;
    #5 sel = 1;
    #5 sel = 2;
    #5 sel = 3;
    #5 $finish;
end

  initial
    $monitor($time, " sel=%b | dout=%b", sel, dout); // change as required

endmodule
