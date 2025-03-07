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
      mon2scb.a = inf.a;
      mon2scb.b = inf.b;
      mon2scb.sign_a = inf.sign_a;
      mon2scb.sign_b = inf.sign_b;
      #10;
      mon2scb.sign = inf.sign;
      mon2scb.result = inf.result;
      mbx.put(mon2scb);
      $display("[MON] : DATA RCVD a: %0d | b: %0d| signa: %0d|signb: %0d|sign: %0d|result: %0d", mon2scb.a,mon2scb.b,mon2scb.sign_a,mon2scb.sign_b,mon2scb.sign,mon2scb.result);

    end
  endtask
endclass