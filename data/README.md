This folder contains [4x4mimo.mat](https://github.com/anushadatar/4x4-simulated-mimo/blob/main/data/4x4MIMO.mat),
the data we transmitted and received over the course of this lab. 

To generate the training signal, `x_train`, we used MATLAB to create a vector
of random BPSK data points (represented by positive and negative 1) and then
multiplied each data point by a pulse 40 units in width.

To generate the data signal, `x_data`, we used MATLAB to generate a 4 column
matrix of 1024 random BPSK data points (represented by positive and negative 1)
and then multiplied each data point by a pulse 40 units in width.
