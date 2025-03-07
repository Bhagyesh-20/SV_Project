class transaction;
  //inputs
    randc bit [7:0] a;
    randc bit [7:0] b; 
    randc bit sign_a; 
    randc bit sign_b;
  //outputs
	bit sign;
  	bit [8:0] result; 
  
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











