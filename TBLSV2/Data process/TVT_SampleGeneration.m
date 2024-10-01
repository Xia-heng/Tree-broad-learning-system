function [Data] = TVT_SampleGeneration(X,Y,Choose)
[N,~] = size(X);
switch Choose
    case 1
       %% Sequence
        % Training 1/2
        train_num = round(N*(1/2));  
        Data.OriginalX1 = X((1:train_num),:);
        Data.OriginalY1 = Y((1:train_num),:);
        
        % Validation  1/4
        Validation_num = round(N*(3/4));
        Data.OriginalX2 = X((train_num+1:Validation_num),:);
        Data.OriginalY2 = Y((train_num+1:Validation_num),:);
        
        % Tesing 1/4
        Data.OriginalX3 = X((Validation_num+1:end),:);
        Data.OriginalY3 = Y((Validation_num+1:end),:);

    case 2 
       %% Random
        rng default
        num = randperm(N); 
        % Training 1/2
        train_num = round(N*(1/2));  
        Data.OriginalX1 = X(num(1:train_num),1:end-1);
        Data.OriginalY1 = Y(num(1:train_num),end);

        % Validation  1/4
        Validation_num = round(N*(3/4));
        Data.OriginalX2 = X(num((train_num+1):Validation_num),:);
        Data.OriginalY2 = Y(num((train_num+1):Validation_num),:);


        % Tesing 1/4
        Data.OriginalX3 = X(num((Validation_num+1):end),:);
        Data.OriginalY3 = Y(num((Validation_num+1):end),:);
    case 4
       %% 12-3-4
        % Training
        trainset_X_1 = X(1:4:end,:);
        trainset_Y_1 = Y(1:4:end,:);
        trainset_X_2 = X(2:4:end,:);
        trainset_Y_2 = Y(2:4:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Validation  1/4
        Data.OriginalX2 = X(3:4:end,:);
        Data.OriginalY2 = Y(3:4:end,:);
        
        % Tesing 1/4
        Data.OriginalX3 = X(4:4:end,:);
        Data.OriginalY3 = Y(4:4:end,:);
    case 5
       %% 23-4-1
        % Training  
        trainset_X_1 = X(2:4:end,:);
        trainset_Y_1 = Y(2:4:end,:);
        trainset_X_2 = X(3:4:end,:);
        trainset_Y_2 = Y(3:4:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Validation  1/4
        Data.OriginalX2 = X(4:4:end,:);
        Data.OriginalY2 = Y(4:4:end,:);
        
        % Tesing 1/4
        Data.OriginalX3 = X(1:4:end,:);
        Data.OriginalY3 = Y(1:4:end,:);
    case 6
       %% 34-1-2
        % Training  
        trainset_X_1 = X(3:4:end,:);
        trainset_Y_1 = Y(3:4:end,:);
        trainset_X_2 = X(4:4:end,:);
        trainset_Y_2 = Y(4:4:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Validation  1/4
        Data.OriginalX2 = X(1:4:end,:);
        Data.OriginalY2 = Y(1:4:end,:);
        
        % Tesing 1/4
        Data.OriginalX3 = X(2:4:end,:);
        Data.OriginalY3 = Y(2:4:end,:);
    case 7
       %% 41-2-3
        % Training  
        trainset_X_1 = X(4:4:end,:);
        trainset_Y_1 = Y(4:4:end,:);
        trainset_X_2 = X(1:4:end,:);
        trainset_Y_2 = Y(1:4:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Validation  1/4
        Data.OriginalX2 = X(2:4:end,:);
        Data.OriginalY2 = Y(2:4:end,:);
        
        % Tesing 1/4
        Data.OriginalX3 = X(3:4:end,:);
        Data.OriginalY3 = Y(3:4:end,:);
    otherwise
        disp('Please select correct data set ID');
        
end

