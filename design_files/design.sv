// input [7:0] a, 
// input [7:0] b, 
// input sign_a, 
// input sign_b, 
// output reg sign, 
// output reg [8:0] result 
module comp(intf inf);

    always_comb begin
        logic signed [8:0] signed_a, signed_b, sum;
      	logic overflow; 
        signed_a = inf.sign_a ? -{1'b0, inf.a} : {1'b0, inf.a};
        signed_b = inf.sign_b ? -{1'b0, inf.b} : {1'b0, inf.b}; 

        sum = signed_a + signed_b; 
        overflow = (~signed_a[8] & ~signed_b[8] & sum[8]) | (signed_a[8] & signed_b[8] & ~sum[8]);
        
        if(overflow)begin
            if (sum[8]) begin
                inf.result = 9'b100000000; 
                inf.sign = 1;
            end else begin
                inf.result = 9'b011111111; 
                inf.sign = 0;
            end
        end
        else begin
            if (sum < 0) begin
                inf.result = -sum; 
                inf.sign = 1;      
            end else begin
                inf.result = sum;
                inf.sign = 0;
            end
        end
    end

endmodule