/*
 * Multiplier test bench file
 * ----------------------------
 * By: Nikhilesh Bhaskar
 * SID: 201769643
 * For: University of Leeds
 * Date: 3rd December 2024
 *
 * Description
 * ------------
 * The module is to simulate the Multiplier 2 bit x 3 bit by creating Multiplier 2x3 bit tb module.
 *
 */

//Creating testbench file for Multiplier2x3 file
//Timescale directive
//we will be setting 1 ns for 1 unit and 100 ps for smallest delay possible
//this gives 0.1ns
`timescale 1 ns/100 ps

//testbench module declaration for Multiplier2x3 
//I have declared module names with _tb
//since they have no port declaration list
module Multiplier2x3_tb;

//inputs given as mentioned in the assignment task
reg [1:0] m;
reg [2:0] q;

//outputs given as mentioned in the assignment task
wire [4:0] p;

//Instantiating the Multiplier2x3 module
Multiplier2x3 Multiplier2x3_dut(
	.m(m),
	.q(q),
	.p(p)
	);

//declaring reg to calculate expected result
wire [4:0] known_result;

//declaring integers to loop through
integer i,j;

//claculating the expected result with the actual results
assign known_result = m * q;
	
//Testbench stimulus
initial begin 
//Printing to console that we aretesting and displaying the time 
	$display("Testing 2x3 Multiplier and time %d ns",$time);

//Looping through all possible 32 inputs using for loop
		for(i = 0; i<8;i = i+1) begin
			for(j = 0; j<4; j = j+1)begin 
				m = i;
				q = j;
				
				//wait for a 10 unit clock cycle
				#10;
				end
			end
		end
		
	endmodule
				
				
	
	