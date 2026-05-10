`timescale 1ns / 1ps
module Display1(
    input clk,rst,
    output reg lcd_rs =1'b0,
    output reg lcd_rw =1'd0,
    output reg lcd_en =1'b1,
    output reg [7:0] lcd_data = 8'd0,
  
     input [7:0] lcd_data1,
   input [7:0] lcd_data2,
     input [7:0] lcd_data3,
       input [7:0] lcd_data4,
         input [7:0] lcd_data5
           
    );
       reg flag;
   reg [16:0] count = 17'd0;
   reg [4:0] state = 5'd0;

 always @ (posedge clk) begin
if (rst) begin
     count <= 4'd0;
     flag  <= 1'b0;
     
 end
 else if (count == 17'd100000) begin          // clock devider for lcd  1ms delay
     count <= 4'd0;
     flag  <= 1'b1;  
 end
 else begin
     count <= count + 1'b1;
     flag  <= 1'b0;
 end
     
           end 
       always @(posedge clk) begin
       if (rst || state == 5'd19 ) begin   // state rst
            state <= 0; end
         else if (flag) begin 
             state <= state +1'd1; 
           end   
         else begin state <= state ; end
        
       case (state)               // lcd execution steps 
       5'd0: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h38;
            end
       5'd1: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                  end 
         5'd2: begin 
           lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h0c;
           end
        5'd3: begin 
           lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                 end  
          5'd4: begin 
              lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h06;
              end
         5'd5: begin 
              lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                    end  
         5'd6: begin 
             lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h01;
             end
        5'd7: begin 
             lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                   end 
         5'd8: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h80;
            end
        5'd9: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;end
            5'd10: begin  lcd_rs <= 1'd1;lcd_data <= lcd_data1; lcd_en <= 1'd1; end
                5'd11:begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end
              5'd12: begin lcd_rs <= 1'd1;lcd_data <= lcd_data2; lcd_en <= 1'd1; end
                5'd13:  begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end 
             5'd14: begin lcd_rs <= 1'd1; lcd_data <= lcd_data3; lcd_en <= 1'd1; end
              5'd15:  begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end   
               5'd16: begin lcd_rs <= 1'd1; lcd_data <= lcd_data4; lcd_en <= 1'd1; end
                5'd17:  begin lcd_rs <= 1'd1;lcd_en <= 1'd0; end      
             5'd18: begin lcd_rs <= 1'd1; lcd_data <= lcd_data5; lcd_en <= 1'd1; end
                5'd19:  begin lcd_rs <= 1'd1;lcd_en <= 1'd0; end 
                 default : begin  lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h38; end  
            endcase
            end
      
        
endmodule
