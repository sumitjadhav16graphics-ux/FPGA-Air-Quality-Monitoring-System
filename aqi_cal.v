`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2026 12:15:54
// Design Name: 
// Module Name: aqi_cal
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


module aqi_cal(
    input clk,rst,
   input [7:0] adc_val,
    output reg [7:0] AQI_VAL,
     output reg aqi_done
    );
    
 parameter AQI_MAX = 8'd200;
 parameter ADC_MAX = 8'd255;
  reg [15:0] mul_result;

 always @(posedge clk ) begin
 if(rst) begin
 AQI_VAL <= 8'd0;
 aqi_done<=1'd0; 
mul_result <= 16'd0;
end
 else begin 
 //if(adc_done == 1'd1)
       
       mul_result <= adc_val * AQI_MAX;
   AQI_VAL <= mul_result / ADC_MAX;                   // aqi calculator
     //AQI_VAL <= adc_val * 0.7843;
   aqi_done <=1'd1;
   end
   end


       
endmodule
