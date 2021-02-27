function [x1, x2, x3, x4] = mmse_decode_matrix(received_data, weight_matrix)
    % TODO
    x1 = weight_matrix(1, :)*received_data;
    x2 = weight_matrix(2, :)*received_data;
    x3 = weight_matrix(3, :)*received_data;
    x4 = weight_matrix(4, :)*received_data;
end