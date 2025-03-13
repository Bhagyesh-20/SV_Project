class driver;
  virtual intf inf;
  transaction gen2drv; // data
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
  	this.mbx =mbx;
    gen2drv = new();
  endfunction
  
  task main();
    forever begin
      mbx.get(gen2drv);
      inf.A_mag = gen2drv.A_mag;
      inf.B_mag = gen2drv.B_mag;
      inf.A_sign = gen2drv.A_sign;
	    inf.B_sign = gen2drv.B_sign;   
      #10;
      gen2drv.Out_sign = inf.Out_sign;
      gen2drv.Out_mag= inf.Out_mag;
      $display("[DRV] : DATA RCVD a: %0d | b: %0d| signa: %0d|signb: %0d|sign: %0d|result: %0d", inf.a,inf.b,inf.sign_a,inf.sign_b,gen2drv.sign,gen2drv.result);
    end
  endtask  
endclass