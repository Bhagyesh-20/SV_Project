class generator;
	transaction gen2drv;
  	mailbox #(transaction) mbx;
  	
  function new(mailbox #(transaction) mbx);
  	this.mbx = mbx;
    gen2drv = new();
  endfunction
  	
  task main();
    for(int i=0;i<100;i++)begin
            assert(gen2drv.randomize()) else $display("Randomization Failed");
            mbx.put(gen2drv.copy);
            $display("[GEN]: DATA SENT");
            gen2drv.display();
            #20;
        end
  endtask
endclass