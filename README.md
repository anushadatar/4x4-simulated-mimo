# 4x4 Simulated MIMO
*Mark Goldwater and Anusha Datar*
Olin College SP21 Principles of Wireless Communications Lab 2b.
# Summary
This repository contains code and documentation associated with
decoding signals sent and received by a MIMO system with 4 transmitting antennas
and 4 receiving antennas. We created a data file with the training signal
(available in the [data/ directory](https://github.com/anushadatar/4x4-simulated-mimo/tree/main/data) 
of this repository. We simulated sending the data through a channel using
[the function provided in class](https://github.com/anushadatar/4x4-simulated-mimo/blob/main/MIMOChannel4x4.m)
and then decoded the data with both an MMSE-based approach (where the
transmitter does not have the ability to characterize the channel before 
sending data) and an SVD-based approach (where the transmitter can characterize
the channel before sending data). 

The main function associated with the MMSE-based receiver is
[mmse_simulation.m](https://github.com/anushadatar/4x4-simulated-mimo/blob/main/mmse_simulation.m),
and the main function associated with the SVD-based decoder is 
[SVD_simuation.m](https://github.com/anushadatar/4x4-simulated-mimo/blob/main/SVD_simulation.m).
Both of these functions call many modular functions included in this repository.

Our [final report](https://github.com/anushadatar/4x4-simulated-mimo/blob/main/docs/report.pdf) 
includes more details about our implementation and additional theoretical background.
