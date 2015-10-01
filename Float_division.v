/*  Code for Floating point division. Code captures the basic mechanism for dividing 8 bit floating point nos based on IEEE standard
 and stores quotient and remainder in fixed point.*/
 
module float_point(reset,clock);
input clock;
input reset;
reg[7:0] numerator;
reg[7:0] denominator;
reg [7:0] init_num;
reg[7:0] initial_num;
reg [7:0] remainder;
reg[3:0] quotient;
reg sum;

parameter [1:0]
S0 = 2'b00,
S1 = 2'b01,
S2 = 2'b10,
S3 = 2'b11;

reg[1:0] current_state, next_state;



always@(posedge clock)
begin 
if(reset)
begin
current_state <= S0;
numerator <= 8'b01001000
denominator <= 8'b00101000
quotient <= 4'b000;
end
else
begin
current_state <= next_state;
num_fixed <= a;
init_num <= initial_num;
if(sum == 1'b1)
begin
den_fixed <= b;
quotient <= quotient + 1'b1;
end
end
end

always@(*)
begin
case(current_state)
S0: begin
c[3:0] = numerator[3:0];
d[3:0] = denominator[3:0];
if(numerator[6:4] == 3'b000)
		 a = c>>3;
		 else if(numerator[6:4] == 3'b001)
		 a = c>>2;
		 else if(numerator[6:4] == 3'b010)
		 a = c>>1;
		 else if(numerator[6:4] == 3'b011)
		 a = c;
		 else if(numerator[6:4] == 3'b100)
		 a = c<<1;
		 else if(numerator[6:4] == 3'b101)
		 a = c<<2;
		 else if(numerator[6:4] == 3'b110)
		 a = c<<3;
		 else if(numerator[6:4] == 3'b111)
		 begin
		 a = c<<4;
		 end
		 if(denominator[6:4] == 3'b000)
		 b = c>>3;
		 else if(denominator[6:4] == 3'b001)
		 b = c>>2;
		 else if(denominator[6:4] == 3'b010)
		 b = c>>1;
		 else if(denominator[6:4] == 3'b011)
		 b = c;
		 else if(denominator[6:4] == 3'b100)
		 b = c<<1;
		 else if(denominator[6:4] == 3'b101)
		 b = c<<2;
		 else if(denominator[6:4] == 3'b110)
		 b = c<<3;
		 else if(denominator[6:4] == 3'b111)
		 begin
		 b = c<<4;
		 end
initial_num = a;
if(a<b)
next_state = S4;
else 
next_state = S1;
sum = 1'b0;
end

S1: begin
if(den_fixed < num_fixed)
begin
a = den_fixed + den_fixed;
sum = 1'b1;
next_state = S1;
end
else
begin
a = den_fixed;
sum = 1'b0;
next_state = S2;
end
end

S2: begin
if(den_fixed == num_fixed)
remainder = 4'b0;
else if(den_fixed > num_fixed) 
begin
remainder = num_fixed - (den_fixed -init_num);
end
next_state = S3;
sum = 1'b0;
end

S3: begin

sum = 1'b0;
remainder = a;
a= 0;
b = 0;
end


endcase
end

endmodule

 
