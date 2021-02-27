function [H, n0_var] = estimate_channel(x_train)
    % TODO

    % Make zeros vector for transmission
    z = zeros(1, size(x_train,2));

    % Package training signals
    x1 = [x_train; z; z; z];
    x2 = [z; x_train; z; z];
    x3 = [z; z; x_train; z];
    x4 = [z; z; z; x_train];
    send_zeros = [z; z; z; z];
        
    %Estimate first column of H
    Y1 = MIMOChannel4x4(x1);
    h_col_1 = mean(Y1./x_train, 2);
    
    %Estimate first column of H
    Y2 = MIMOChannel4x4(x2);
    h_col_2 = mean(Y2./x_train, 2);
    
    %Estimate first column of H
    Y3 = MIMOChannel4x4(x3);
    h_col_3 = mean(Y3./x_train, 2);
    
    %Estimate first column of H
    Y4 = MIMOChannel4x4(x4);
    h_col_4 = mean(Y4./x_train, 2);
    
    % Avengers assemble
    H = [h_col_1, h_col_2, h_col_3, h_col_4];
    
    N = MIMOChannel4x4(send_zeros);
    n0_var = mean(var(N, 0, 2));
    
end