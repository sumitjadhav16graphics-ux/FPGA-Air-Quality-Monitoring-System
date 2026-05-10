`timescale 1ns / 1ps
module ADC_SPI(
    input clk,
    input rst,
    input miso,
     output reg [7:0] adc_val=8'd0,
    output reg sclk=0,
   output reg mosi=0,
    output reg cs=1
    
);

reg [1:0] state =0;
reg [4:0] bit_count =5'd0;
reg [7:0] shift_reg = 8'd0;
 reg [3:0] counter = 4'd0;
 reg [4:0] cmd =5'b11000;   //logic for ch0


always @(posedge clk or posedge rst) begin
    if(rst) begin
        state <= 0;
        cs <= 1;
       mosi <= 0;
        shift_reg<=8'd0;
        bit_count <= 5'd0;
          counter <= 4'd0;
    end
    else begin
        case(state)

        2'd0: begin
            cs <= 0;
            
            bit_count <= 5'd0;
             shift_reg<=8'd0;
              counter <= 4'd0;
              sclk<=1'd0;
            state <= 2'd1;
           
            
        end

        2'd1: begin
          counter <= counter +1'd1;
          if(counter == 4'd8) begin
           counter <= 4'd0;                      // serial clk generator
            sclk <= ~sclk;
            if(sclk == 1'd0) begin
            
                // ? SEND MOSI FIRST (for first 5 bits)
                if(bit_count < 5)
                    mosi <= cmd[4 - bit_count];    // for ch0 of adc
                else
                    mosi <= 0;
            end
               else begin
                shift_reg <= {shift_reg[6:0], miso};
            
              
             if(bit_count ==5'd12 )
                      state <= 2'd2;
                          else              
                   bit_count <= bit_count + 1;        
                                 end
        end
        end
   

        2'd2: begin
            cs <= 1;
            sclk <= 0;
            adc_val<=shift_reg;
          
             //state <= 2'd0;
        end
         default : begin   cs <= 0;
               
                  bit_count <= 4'd0;
                   shift_reg<=8'd0;
                 // state <= 2'd1;
                  counter <= 4'd0;
                  sclk<=1'd0; end
        endcase
    end
    
end

endmodule