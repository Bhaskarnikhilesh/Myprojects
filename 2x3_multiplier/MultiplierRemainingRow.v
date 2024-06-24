module MultiplierRemainingRow (
//inputs for the remaining row of multiplier
    input  pp,
    input  m,
    input  q,
    input  cIn,
//outputs for remaining row of multiplier    
    output qOut,
    output cOut,
    output mOut,
    output s
);

//Declaring the wire for interconnecting the gates and carrying the signals 
	wire A;

	assign mOut = m;
	assign qOut = q;	
	
//Performing AND operation 
//with q, pp and capturing the signalin wire A
	and(A,q,m);

//Performing 1 bit full adder operation to the code
//instancing 1 bit full adder operation from Addr1Bit.v file
	Adder1Bit Adder1Bit_Full_R(
		.a(A),
		.b(pp),
		.cin(cIn),
		.sum(s),
		.cout(cOut)
	);




endmodule
