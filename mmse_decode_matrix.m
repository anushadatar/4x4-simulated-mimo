function [x1, x2, x3, x4] = mmse_decode_matrix(received_data, weight_matrix)
    % Decode the matrix using the MMSE receiver (i.e. the receiver in the
    % case that we do not know the channel parameters from the get-go).
    % Input Parameters:
    % received_data : Data received by the MMSE receiver with 4 antennas.
    % weight_matrix : Computed weight matrix based on initial channel
    %                 characterization.
    % Returns:
    % x1            : Esimated signal from transmit antenna 1.
    % x2            : Esimated signal from transmit antenna 2.
    % x3            : Esimated signal from transmit antenna 3.
    % x4            : Esimated signal from transmit antenna 4.
    x1 = weight_matrix(1, :)*received_data;
    x2 = weight_matrix(2, :)*received_data;
    x3 = weight_matrix(3, :)*received_data;
    x4 = weight_matrix(4, :)*received_data;
end