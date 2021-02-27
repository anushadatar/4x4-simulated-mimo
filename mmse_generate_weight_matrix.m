function [w] = generate_weight_vector_mmse(H, n0_var)
    % TODO modify docs
    % Generate the weight vector based on the channel (using the mmse
    % receiver).
    % Input Parameters:
    % H       : The aggregated channel parameter matrix.
    % Returns:
    % w1       : Weight vector used to retrieve x1
    % w2       : Weight vector used to retrieve x2
    w = inv(H'*H + n0_var.*eye(4, 4))*H';
end