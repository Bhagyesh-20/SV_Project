class scoreboard;
  
  virtual intf inf;
  transaction mon2scb;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
  	this.mbx = mbx;  
    mon2scb = new();
  endfunction
  
  task main();
    forever begin
      mbx.get(mon2scb);
      check_result(mon2scb);
    end
  endtask
  
  task check_result(transaction trans);
    logic signed [8:0] signed_a, signed_b, expected_sum;
    bit expected_sign;
    bit overflow;

    signed_a = trans.sign_a ? -{1'b0, trans.a} : {1'b0, trans.a};
    signed_b = trans.sign_b ? -{1'b0, trans.b} : {1'b0, trans.b};
    expected_sum = signed_a + signed_b;

    overflow = (~signed_a[8] & ~signed_b[8] & expected_sum[8]) | (signed_a[8] & signed_b[8] & ~expected_sum[8]);

    if (overflow) begin
        if (expected_sum[8]) begin
            expected_sign = 1;
            expected_sum = 9'b100000000;
        end else begin
            expected_sign = 0;
            expected_sum = 9'b011111111;
        end
    end else begin
        expected_sign = expected_sum < 0;
        if (expected_sum < 0)
            expected_sum = -expected_sum;
    end

    if (trans.result !== expected_sum || trans.sign !== expected_sign) begin
        $display("[ERROR] Mismatch: Expected sign=%0b, result=%0d | Got sign=%0b, result=%0d",
                 expected_sign, expected_sum, trans.sign, trans.result);
    end else begin
        $display("[PASS] Correct: sign=%0b, result=%0d", trans.sign, trans.result);
    end
endtask
endclass
