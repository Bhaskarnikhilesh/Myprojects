module MultiplierFirstRow (
//inputs for the first row of multiplier
    input  [1:0] m,
    input  [1:0] q,
    input        cIn,
//outputs for first row of multiplier    
    output [1:0] qOut,
    output       cOut,
    output       mOut,
    output       s
);

//Declaring the wires for interconnecting the gates and carrying the signals 
	wire A,B;

//Performing AND operation 
//with q1, m0 and capturing the signalin wire A

	and(A, q[1], m[0]);

//Performing AND operation 
//with q0, m1 and capturing the signal in wire B.
	and(B, q[0], m[1]);
	
	assign qOut[0] = 1'b0;
	assign qOut[1] = q[1];
	assign mOut = m[0];
	

//Performing 1 bit full adder operation to the code
//instancing 1 bit full adder operation from Addr1Bit.v file

	Adder1Bit Adder1Bit_Full_Adder(
		.a(A),
		.b(B),
		.cin(cIn),
		.sum(s),
		.cout(cOut)
	);

endmodule
