# FPGA-Air-Quality-Monitoring-System

## Overview
This project implements a real-time Air Quality Monitoring System using Zybo Z7 FPGA, MQ135 gas sensor, and MCP3008 ADC. The system detects air pollution levels, processes the data using FPGA-based Verilog modules, and displays the Air Quality Index (AQI) on a 16x2 LCD.

---

## Components Used
- Zybo Z7 FPGA Board
- MQ135 Gas Sensor
- MCP3008 ADC
- 16x2 LCD Display
- Power Supply

---

## Working Principle
1. MQ135 sensor detects air pollution.
2. Sensor outputs analog voltage.
3. MCP3008 ADC converts analog signal into digital data.
4. FPGA receives data using SPI communication.
5. FPGA calculates AQI value.
6. LCD displays air quality status.

---

## Features
- Real-time AQI monitoring
- FPGA-based fast processing
- SPI protocol implementation
- LCD display output
- Low-cost environmental monitoring

---

## Technologies Used
- Verilog HDL
- Vivado Design Suite
- FPGA (Zybo Z7)
- SPI Communication Protocol

---

## Future Scope
- IoT-based cloud monitoring
- Multiple sensor integration using MUX
- Portable SoC-based implementation
- Mobile application support

---

## Output
The system classifies air quality into:
- Good
- Moderate
- Poor

and displays the AQI on LCD.

---

## Author
Sumit Jadhav
