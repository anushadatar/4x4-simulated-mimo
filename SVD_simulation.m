function [x1_err, x2_err, x3_err, x4_err] = SVD_simulation(x_train, x_data)
    % Simulate sending and receiving data with an SVD-based technique (i.e.
    % the scenario when both the transmitter and the receiver know the
    % channel parameters.
    % x_train : The training signal to transmit across the channel.
    % x_data  : The data to transmit across the channel.
    % Returns:
    % x1_err  : The percent error in decoding the signal from antenna 1. 
    % x2_err  : The percent error in decoding the signal from antenna 2. 
    % x3_err  : The percent error in decoding the signal from antenna 3. 
    % x4_err  : The percent error in decoding the signal from antenna 4. 
    
    % Use the training signal to estimate the channel parameters/
    [H,~] = estimate_channel(x_train);
    % Use the SVD of the channel to prepare the training data.
    [U,S,V] = svd(H);
    x_tilda = V*x_data;
    % Send the data through the channel.
    received_data = MIMOChannel4x4(x_tilda);
    % Use the SVD of the channel to recover the signal.
    y = (U'*received_data)./(ones(size(received_data)).*diag(S));
    % Compute the error for each transmitted signal.
    x1_err = compute_error(y(1,:), x_data(1,:));
    x2_err = compute_error(y(2,:), x_data(2,:));
    x3_err = compute_error(y(3,:), x_data(3,:));
    x4_err = compute_error(y(4,:), x_data(4,:));
end