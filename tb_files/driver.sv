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
      inf.a = gen2drv.a;
      inf.b = gen2drv.b;
      inf.sign_a = gen2drv.sign_a;
	  inf.sign_b = gen2drv.sign_b;   
      #10;
      gen2drv.sign = inf.sign;
      gen2drv.result= inf.result;
      $display("[DRV] : DATA RCVD a: %0d | b: %0d| signa: %0d|signb: %0d|sign: %0d|result: %0d", inf.a,inf.b,inf.sign_a,inf.sign_b,gen2drv.sign,gen2drv.result);
    end
  endtask  
endclass