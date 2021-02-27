function [w] = mmse_generate_weight_matrix(H, n0_var)
    % Generate the weight vector based on the channel (using the MMSE
    % receiver, which does not know original channel parameters).
    % Input Parameters:
    % H      : The aggregated channel parameter matrix.
    % n0_var : The estimated value of the channel noise.
    % Returns:
    % w      : Assembled 4x4 weight vector.
    w = inv(H'*H + n0_var.*eye(4, 4))*H';
end