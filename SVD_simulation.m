function [x1_err, x2_err, x3_err, x4_err] = SVD_simulation(x_train, x_data)
    % TODO
    
    [H, ~] = estimate_channel(x_train);
    [U, S, V] = svd(H);
    x_tilda = V'*x_data;
    received_data = MIMOChannel4x4(x_tilda);
    y = U*received_data;
    x1_err = compute_error(y(1,:), x_data(1,:));
    x2_err = compute_error(y(2,:), x_data(2,:));
    x3_err = compute_error(y(3,:), x_data(3,:));
    x4_err = compute_error(y(4,:), x_data(4,:));
end