function [err, bits_x, bits_y] = compute_error(rx_data, tx_data)
    % Compute the percent difference between the complete original signal
    % and the complete received signal. In doing so, this function
    % downsamples the received data (assuming a 40 bit pulse width) and
    % returns the downsampled x and y bits.
    % Input Parameters:
    % rx_data : Vector containing the decoded received signal.
    % tx_data : Vector containing the transmitted signal to compare
    %           against.
    %
    % Returns:
    % err     : Percent error between transmitted and received message.
    pulseWidth = 40;
    % Create sampled data vectors according to pulse width.
    bits_x = [];
    bits_y = [];
    for i=pulseWidth/2:pulseWidth:length(rx_data)
        bits_x = [bits_x sign(real(tx_data(i)))];
        bits_y = [bits_y sign(real(rx_data(i)))];
    end
    
    % Compute percent difference.
    err = sum((bits_x ~= bits_y)) / length(bits_x);
end