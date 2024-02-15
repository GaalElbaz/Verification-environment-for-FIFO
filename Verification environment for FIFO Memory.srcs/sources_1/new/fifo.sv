`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: fifo (First-In-First-Out)
//////////////////////////////////////////////////////////////////////////////////

module fifo #(parameter MEM_SIZE = 15, parameter COUNT = 4)(fifo_if fif);
  
  // Pointers for write and read operations
  reg [3:0] wptr = 0, rptr = 0;
  
  // Counter for tracking the number of elements in the FIFO
  reg [COUNT:0] cnt = 0;
  
  // Memory array to store data
  reg [7:0] mem [MEM_SIZE:0];
 
  always @(posedge fif.clock)
    begin
      if (fif.rst == 1'b1)
        begin
          // Reset the pointers and counter when the reset signal is asserted
          wptr <= 0;
          rptr <= 0;
          cnt  <= 0;
        end
      else if (fif.wr && !fif.full)
        begin
          // Write data to the FIFO if it's not full
          mem[wptr] <= fif.data_in;
          wptr      <= wptr + 1;
          cnt       <= cnt + 1;
        end
      else if (fif.rd && !fif.empty)
        begin
          // Read data from the FIFO if it's not empty
          fif.data_in <= 0;         //idle state of read opeartion
          fif.data_out <= mem[rptr];
          rptr <= rptr + 1;
          cnt  <= cnt - 1;
         end
    end
 
  // Determine if the FIFO is empty or full
  assign fif.empty = (cnt == 0) ? 1'b1 : 1'b0;
  assign fif.full  = (cnt == (MEM_SIZE + 1'b1)) ? 1'b1 : 1'b0;
 
endmodule