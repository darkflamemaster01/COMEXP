module Comm_system_tb;
  reg sysclk,reset;
  reg [7:0]data_in;
  wire [15:0]data_out;
  reg [1:0]out_select;
  
  Comm_system uut(.data_in(data_in),.sysclk(sysclk),.reset(reset),.data_out(data_out),.out_select(out_select));
  
  initial fork
    reset=1;
    sysclk=0;
    data_in=8'h00;
    out_select=2'b00;
    #32 reset=0;
    #36 reset=1;
    #1 data_in=8'b0110_1001;
    //#546 sig_from_adc=16'b0110_1001_1100_0011;
    #1025 data_in=8'b1110_1111;
    //#1570 sig_from_adc=16'b1110_1111_1010_1011;
    #3800 out_select=2'b01;
    #4600 out_select=2'b11;
    #10000 $stop;
    //#2594 sig_from_adc=16'b0111_1111_1111_1111;
    //#3800 $stop;
  join
 
  always #2 sysclk<=~sysclk;
  
endmodule