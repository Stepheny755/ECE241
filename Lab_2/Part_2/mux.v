`timescale 1ns / 1ns // `timescale time_unit/time_precision

module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    mux2to1 u0(
        .x(SW[0]),
        .y(SW[1]),
        .s(SW[9]),
        .m(LEDR[0])
        );
endmodule

module mux2to1(input x,y,s,output m);
		wire w1,w2,w3;
		NOT_7404 mnot(.p1(s),.p2(w1));
		AND_7408 mand(.p1(w1),.p2(x),.p3(w2),.p4(s),.p5(y),.p6(w3));
		OR_7432 mor(.p1(w2),.p2(w3),.p3(m));
endmodule

module NOT_7404 (input p1, p3, p5, p9, p11, p13,
output p2, p4, p6, p8, p10, p12);
		assign p2 = ~p1;
		assign p4 = ~p3;
		assign p6 = ~p5;
		assign p8 = ~p9;
		assign p10= ~p11;
		assign p12= ~p13;
endmodule

module AND_7408 (input p1,p2,p4,p5,p9,p10,p12,p13, output p3,p6,p8,p11);
	assign p3 = p1&p2;
	assign p6 = p4&p5;
	assign p8 = p9&p10;
	assign p11 = p12&p13;
endmodule

module OR_7432 (input p1,p2,p4,p5,p9,p10,p12,p13, output p3,p6,p8,p11);
	assign p3 = p1|p2;
	assign p6 = p4|p5;
	assign p8 = p9|p10;
	assign p11 = p12|p13;
endmodule
