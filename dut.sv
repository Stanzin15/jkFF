module jk_ff(j,k,q,rst,clk);//sensitivity list
        input j;
        input k;
        input rst;
        input clk;
        output reg q;// register - to store some values
			//resistor - to drop the values or oppose the flow of
			//current

        always@(posedge clk)// posedge clk- the device is working on positive edge of the clock
               if(rst == 0) begin
                    q = 0; //reset
               end
              else begin
		      if (j == 0 && k == 0) begin
				q <= q;// same as previous
		      end
		      else if ( j == 0 && k == 1) begin
				q <= 0;//reset
		      end
		      else if ( j == 1 && k == 0) begin
				q <= 1;//set
		      end
		      else
			      q <= ~q;//toggle
               //  case ({j,k})
               //        2'b00 :  q <= q;
               //         2'b01 :  q <= 0;
               //        2'b10 :  q <= 1;
               //        2'b11 :  q <= ~q;
               // endcase
                end
                endmodule
