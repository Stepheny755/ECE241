module RateDivider(iClock, iSel, iResetn, oEnable);
input iClock; // Clock
input iResetn; // Active low reset
input [2:0] iSel; // Rate select bits
output oEnable; // Enable pulse

//slowest clock is 0.3 hz, so need 28 bits to represent using 80 mhz base clock
//log_2(80*10^6/0.3)
reg[28:0] RateDivider;
reg[28:0] def;

//internal enable
//check comments below
reg enable;

//on every clock
//important part of the circuit, as we are trying to create different clock frequencies
always@(posedge CLOCK_50)
  begin
    //calculate initial counter value
    if(iSel==3'b000)//30 hz
      //set def to (80mhz/30hz-1)
      //since the value is 2666666+2/3, subtracting 1 gives just the integer part
      def = (2666666);
    else if(iSel==3'b001)//20 hz
      //set def to (80mhz/20hz-1)
      def = (4E6)-1;
    else if(iSel==3'b010)//1 hz
      //set def to (80mhz/1hz-1)
      def = (80E6)-1;
    else if(iSel==3'b011)//0.5 hz
      def = (160E6)-1;
    else if(iSel==3'b100)//0.3hz
      def = (266666666);
      //since the value is 266666666+2/3, subtracting 1 gives just the integer part
    else
      //otherwise, full speed!
      def = 1'd0;

    //count down rate divider
    RateDivider<=RateDivider-1;

    //if ratedivider reaches 0, set enable to 1
    enable <= (RateDivider == 4'b0000)?1:0;

    //check if ratedivier is 0 or if reset is 0
    if(RateDivider==0)
      RateDivider<=def;
    else if(!iResetn)
      //if resetn 0 (active low)
      begin
        //set ratedivier variable to initial count
        RateDivider<=def;
        //set enable to 0
        enable<=0;
      end
  end

  //set output enable to internal enable
  //I'm not actually sure if this works, but this is a solution that involves
  //not modifying the output variable type (I would declare oEnable as a reg)
  assign oEnable = enable;

endmodule
