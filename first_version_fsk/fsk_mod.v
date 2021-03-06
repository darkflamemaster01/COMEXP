module fsk_mod(clk_4,clk_8,control_sig,sig_rf,sig_enable);
  input clk_4,clk_8,control_sig,sig_enable;
  output wire sig_rf;
  
  assign sig_rf=(sig_enable==0)?0:
                (control_sig==0)?clk_8:clk_4;
  
endmodule