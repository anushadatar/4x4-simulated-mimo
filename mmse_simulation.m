function [x1_err, x2_err, x3_err, x4_err] = mmse_simulation(x_train, x_data)
    % Simulate the behavior and operation of the MMSE receiver (i.e. a
    % receiver setup in which the channel characterisitics are not known)
    % and compute the error associated with decoding the values.
    % Input Parameters:
    % x_train : The training signal to transmit across the channel.
    % x_data  : The data to transmit across the channel.
    % Returns:
    % x1_err  : The percent error in decoding the signal from antenna 1. 
    % x2_err  : The percent error in decoding the signal from antenna 2. 
    % x3_err  : The percent error in decoding the signal from antenna 3. 
    % x4_err  : The percent error in decoding the signal from antenna 4. 
    
    % Use the training data to estimate the channel matrix and the variance
    % of the noise acorss the channel.
    [H, n0_var] = estimate_channel(x_train);
    % Run the transmit data through the channel (see the data directory for
    % data and associated documentation).
    received_data = MIMOChannel4x4(x_data);
    % Generate and apply the MMSE weight matrix to the data.
    weight_matrix = mmse_generate_weight_matrix(H, n0_var);
    [x1, x2, x3, x4] = mmse_decode_matrix(received_data, weight_matrix);
    % Compute the error for each signal.
    x1_err = compute_error(x1, x_data(1,:));
    x2_err = compute_error(x2, x_data(2,:));
    x3_err = compute_error(x3, x_data(3,:));
    x4_err = compute_error(x4, x_data(4,:));
end