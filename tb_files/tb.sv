module tb;
  intf inf();
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;
    mailbox #(transaction) mbx;

    comp dut(inf);

    initial begin
        mbx = new();
        gen = new(mbx);
        drv = new(mbx);
        drv.inf = inf ; 
        mon = new(mbx);
        mon.inf = inf;  
        scb = new(mbx);
        scb.inf = inf;
    end


    initial begin
        fork
            gen.main();
            drv.main();
            mon.main();
            scb.main();
        join
    end

endmodule