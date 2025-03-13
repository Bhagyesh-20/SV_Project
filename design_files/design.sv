module signed_adder (
    input  logic [3:0] A_mag, B_mag,  
    input  logic       A_sign, B_sign,
    output logic [4:0] Out_mag,       
    output logic       Out_sign       
);
    logic signed [5:0] A_signed, B_signed, Sum_signed;  
    
    assign A_signed = A_sign ? -A_mag : A_mag;
    assign B_signed = B_sign ? -B_mag : B_mag;

    assign Sum_signed = A_signed + B_signed;

    assign Out_sign = Sum_signed[5];   
    assign Out_mag  = Out_sign ? -Sum_signed : Sum_signed;

endmodule
