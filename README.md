# WAV_Player
FPGA Audio mix table project;

Board : Agilent Arty S7;

Sub-modules : I²S2 Audio Pmod, VGA Pmod; 

Current features: 

I²S interface sampling audio @ 44.1kHz - 16-bit;
9-band FIR filter (16-bit);
2 to 2048-point FFT and Normalization (16-bit);
Equalizer;
Vu-Metre (integration on 1/10s of audio signal);
UART interface to computer;

Python GUI: 

Board connection;
Oscilloscope, FFT, Equalizer, Vu-Metre displays;
FFT, Equalizer dynamic configuration;
Band selection
