function [H, n0_var] = estimate_channel(x_train)
    % Characterize the channel based on the change in the training data.
    % Input Parameters:
    %
    % Returns:
    % H: Complete channel matrix (from H11 to H44)
    % n0_var: Variance of the noise in the channel, based on the outcome of
    %         sending a vector of zeroes across the channel.

    % Create a vector of zeroes to help isolate specific signals when
    % processing training data.
    z = zeros(1, size(x_train,2));

    % Package training signals for each signal.
    x1 = [x_train; z; z; z];
    x2 = [z; x_train; z; z];
    x3 = [z; z; x_train; z];
    x4 = [z; z; z; x_train];
    send_zeros = [z; z; z; z]; % For characterizing noise for all zeroes.
        
    %Estimate first column of H.
    Y1 = MIMOChannel4x4(x1);
    h_col_1 = mean(Y1./x_train, 2);
    
    %Estimate second column of H.
    Y2 = MIMOChannel4x4(x2);
    h_col_2 = mean(Y2./x_train, 2);
    
    %Estimate third column of H.
    Y3 = MIMOChannel4x4(x3);
    h_col_3 = mean(Y3./x_train, 2);
    
    %Estimate fourth column of H.
    Y4 = MIMOChannel4x4(x4);
    h_col_4 = mean(Y4./x_train, 2);
    
    % Assemble the final channel matrix.
    H = [h_col_1, h_col_2, h_col_3, h_col_4];
    
    % Send zeroes and estimate the variance of the noise.
    N = MIMOChannel4x4(send_zeros);
    n0_var = mean(var(N, 0, 2));
end