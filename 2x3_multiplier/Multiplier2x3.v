module Multiplier2x3(
//inputs for 2x3 multiplier
    input  [1:0] m,
    input  [2:0] q,

//output for 2x3 multiplier 
    output [4:0] p
);

// Interconnecting wire for cout, mout and s  
	wire c, m1, m2, s0, s1, s2, s3;  

// Interconnecting wire for assigned 2 bits qout
	wire [1:0] qOR;  

// Interconnecting wires that are not required which are coming from q0 and q1.
	wire [4:0] qOW;

//Performing AND operation 
//with q[0], m[0] as the inputs and the output is p[0];

	and(p[0], q[0], m[0]);

//Performing Multiple first row submodule operation to the code
//instancingMultiple first row submodule 1 operation from MultiplierFirstRow.v file
//Designing according to task flow given
	MultiplierFirstRow MFRw1(
		.m(m[1:0]),         //m input i.e. m0 and m1 to row 1 submodule 1 multiplier.     
		.q(q[1:0]),         //q input i.e q0 and q1 to row 1 submodule 1 multiplier.
		.cIn(1'b0),         //cin input i.e cin = 0 to row 1 submodule 1 multiplier.
		.qOut(qOR[1:0]),   //qout output row 1 submodule 1 multiplier coming from q0 and q1.
		.cOut(c),     //cout output signal fi1st bit     
		.mOut(s0),     //mout  output sinal first bit i.e. mk
		.s(p[1]));          //s output signal which is the input pp in next row submodule.

//instancingMultiple first row submodule 2 operation from MultiplierFirstRow.v file
	MultiplierFirstRow MFRw2(
		.m({1'b01,m[1]}),         // give inputs m1 and 0 i.e. m1 to row 1 submodule 2.	
		.q(q[1:0]),      //q input to row 1 submodule 2 coming from qout of row 1 submodule 1 multiplier. 
		.cIn(c),      //cin input to row 1 submodule 2 multiplier coming from cout of row 1 submodule 1. 
		.qOut(qOW[1:0]),     //qout output from row 1 submodule 2 coming from q0 and q1.
		.cOut(s3),     //cout output coming from row 1 submodule 2.       
		.mOut(s2),     //mout output coming from ro1 submodule 2 i.e. from m1.
		.s(s1));          //s output which coming out of row 1 submodule 2.

//Performing Multiple second row submodule operation to the code
//instancing Multiple second row submodule 1 operation from MultiplierFirstRow.v file
//Designing according to task flow given
	MultiplierRemainingRow MRRw1(
		.pp(s1),         //pp input to row 2 submodule 1 which is taking s output from row 1 submodule 2 
		.m(s0),       //mk input to row 2 submodule 1 which is coming out from row 1 submodule 1 output of m0.
		.q(q[2]),          //input from q2 to row 2 submodule 1.
		.cIn(1'b0),        //input zero for cin to row 2 submodule 1.
		.qOut(m1),    //output from row 2 submodule 1 i.e. q2. 
		.cOut(m2),    //output from cout row 2 submodule 1. 
		.mOut(qOW[2]),    //output from mout row 2 submodule 1 i.e. m0. 
		.s(p[2]));         //s output i.e. p2 output from row 2 submodule 1.

//instancing Multiple second row submodule 2 operation from MultiplierFirstRow.v file
	MultiplierRemainingRow MRRw2(
		.pp(s3),      //pp input to row 2 submodule 2 which is taking cout output from row 1 submodule 2.
		.m(s2),       //mk input to row 2 submodule 2 which is taking output from row 2 submodule 2 of m1.
		.q(m1),       //qi input to row 2 submodule 2 which is taking from the output of q2 of row 2 submodule 1.  
		.cIn(m2),     //cin input to row 2 submodule 2 which is taking from cout of row 2 submodule 1.
		.qOut(qOW[3]),    //output from row 2 submodule 2 i.e. q2.
		.cOut(p[4]),    //output from cout row 2 submodule 2.
		.mOut(qOW[3]),    //output from mout row 2 submodule 2 i.e. m1.
		.s(p[3]));         //s output i.e. p3 output from row 2 submodule 2.
	
endmodule
