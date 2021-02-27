function [x1_err, x2_err, x3_err, x4_err] = mmse_simulation(x_train, x_data)
    % TODO
    
    [H, n0_var] = estimate_channel(x_train);
    received_data = MIMOChannel4x4(x_data);
    weight_matrix = mmse_generate_weight_matrix(H, n0_var);
    [x1, x2, x3, x4] = mmse_decode_matrix(received_data, weight_matrix); 
    x1_err = compute_error(x1, x_data(1,:));
    x2_err = compute_error(x2, x_data(2,:));
    x3_err = compute_error(x3, x_data(3,:));
    x4_err = compute_error(x4, x_data(4,:));
end