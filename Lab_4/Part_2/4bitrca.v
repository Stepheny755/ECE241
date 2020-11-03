module RCA_4bit(input[3:0] a,b,input cin,output[3:0] s,output cout);
	wire c1,c2,c3;
	FA fa1(a[0],b[0],cin,s[0],c1);
	FA fa2(a[1],b[1],c1,s[1],c2);
	FA fa3(a[2],b[2],c2,s[2],c3);
	FA fa4(a[3],b[3],c3,s[3],cout);
endmodule

module FA(input a,b,cin,output s,cout);
	assign s = a^b^cin;
	assign cout = (a&b)|(cin&a)|(cin&b);
endmodule
