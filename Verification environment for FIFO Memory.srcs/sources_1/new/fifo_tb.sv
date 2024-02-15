`timescale 1ns / 1ps
//`include "dff_if.sv"
//`include "dff.sv"
//`include "transaction.sv"
//`include "generator.sv"
//`include "driver.sv"
//`include "monitor.sv"
//`include "scoreboard.sv"
//`include "environment.sv"
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fifo_tb
//////////////////////////////////////////////////////////////////////////////////

module tb;
    
  fifo_if fif();
  fifo dut (fif);
    
  initial begin
    fif.clock <= 0;
  end
    
  always #10 fif.clock <= ~fif.clock;
    
  environment env;
    
  initial begin
    env = new(fif);
    env.gen.count = 30;
    env.run();
  end
    
endmodule