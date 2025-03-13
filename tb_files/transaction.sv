class transaction;
  //inputs
    randc bit [3:0] A_mag;
    randc bit [3:0] B_mag; 
    randc bit A_sign; 
    randc bit B_sign;
  //outputs
	bit Out_sign;
  bit [5:0] Out_mag; 
  
	function transaction copy();
        copy = new();
        copy.a = this.a;
        copy.b = this.b;
        copy.result = this.result;
    endfunction
  
    function void display;
      $display(a,b,sign_a,sign_b);
    endfunction
  	
endclass











