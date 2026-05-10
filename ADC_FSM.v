`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 11:44:40
// Design Name: 
// Module Name: ADC_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AQI_FSM(
input clk,rst,miso,
output  lcd_rs,
output  lcd_rw,
output  lcd_en,
output  [7:0] lcd_data,
output  sclk,
output  cs,
output mosi
 );
    wire aqi_done;
    wire [7:0] adc_val;
   wire [7:0] aqi_val;
     reg [7:0] lcd_data1;
     reg [7:0] lcd_data2;
     reg [7:0] lcd_data3;
     reg [7:0] lcd_data4;
      reg [7:0] lcd_data5;
    ADC_SPI a(.clk(clk)
                     ,.rst(rst)
                     ,.miso(miso)
                     ,.adc_val(adc_val)
                     ,.sclk(sclk)
                     ,.cs(cs)
                     ,.mosi(mosi)
                    );
                     
    aqi_cal A(.AQI_VAL(aqi_val),.clk(clk),.rst(rst),.adc_val(adc_val),.aqi_done(aqi_done));
   Display1 B(.clk(clk),.rst(rst),.lcd_rs(lcd_rs),.lcd_rw(lcd_rw),
                     .lcd_en(lcd_en),.lcd_data(lcd_data),.lcd_data1(lcd_data1),
                          .lcd_data2(lcd_data2),.lcd_data3(lcd_data3),
                          .lcd_data4(lcd_data4),.lcd_data5(lcd_data5)
                          );
 
  
    always @(posedge clk)    begin
          if (rst) begin
         lcd_data1 <=8'h0; end
                 
        /* else if(aqi_done == 1'd1) begin
           aqi <= aqi_val;
           adc<= adc_val;*/
    if (aqi_val >= 8'd0 && aqi_val <= 8'd67) begin
                 lcd_data1 <="G";
                  lcd_data2 <="O";
               lcd_data3 <="O";
                lcd_data4 <="D";
                 lcd_data5 <="!";
          
           end
     else if  (aqi_val >= 8'd68 && aqi_val <= 8'd136) begin
                   lcd_data1 <="B";
                    lcd_data2 <="A";
                 lcd_data3 <="D";
                  lcd_data4 <="!";
                   lcd_data5 <="!";
                  
                     end
    else if(aqi_val >= 8'd137 && aqi_val <= 8'd200) begin
                lcd_data1 <="w";
                  lcd_data2 <="O";
               lcd_data3 <="R";
               lcd_data4 <="S";
               lcd_data5 <="T";
                  end   
                  end 
                  //end  
                  
                                                 
endmodule




