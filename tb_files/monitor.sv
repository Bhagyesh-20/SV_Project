class monitor;
  virtual intf inf;
  transaction mon2scb;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
  	this.mbx = mbx;  
    mon2scb = new();
  endfunction
  
  task main();
    forever begin
      mon2scb.A_mag = inf.A_mag;
      mon2scb.B_mag = inf.B_mag;
      mon2scb.A_sign = inf.A_sign;
      mon2scb.B_sign = inf.B_sign;
      #10;
      mon2scb.Out_sign = inf.Out_sign;
      mon2scb.Out_mag = inf.Out_mag;
      mbx.put(mon2scb);
      $display("[MON] : DATA RCVD a: %0d | b: %0d| signa: %0d|signb: %0d|sign: %0d|result: %0d", mon2scb.A_mag,mon2scb.B_mag,mon2scb.A_sign,mon2scb.B_sign,mon2scb.Out_sign,mon2scb.Out_mag);

    end
  endtask
endclass