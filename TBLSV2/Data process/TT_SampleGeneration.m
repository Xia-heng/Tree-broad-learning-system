function [Data] = TT_SampleGeneration(X,Y,Choose)
[N,~] = size(X);
switch Choose
    case 1
        train_num = 26; 
        % Training
        Data.OriginalX1 = X((1:train_num),:);
        Data.OriginalY1 = Y((1:train_num),:);       
        % Tesing
        Data.OriginalX2 = X((train_num+1:end),:);
        Data.OriginalY2 = Y((train_num+1:end),:);
    case 2
       %% Random
        rng default
        num = randperm(N); 
        % Training 2/3
        train_num = round(N*(2/3));  
        Data.OriginalX1 = X(num(1:train_num),:);
        Data.OriginalY1 = Y(num(1:train_num),:);
        % Tesing 1/3
        Data.OriginalX2 = X(num(train_num+1:end),:);
        Data.OriginalY2 = Y(num(train_num+1:end),:);

    case 3 
        % Training  Odd numbers
        Data.OriginalX1 = X(1:2:end,:);
        Data.OriginalY1 = Y(1:2:end,:);
        % Tesing Even numbers
        Data.OriginalX2 = X(2:2:end,:);
        Data.OriginalY2 = Y(2:2:end,:);
    case 4 
       %% Å¼ÊıÑµÁ·£¬ÆæÊı²âÊÔ
        % Training  Even numbers
        Data.OriginalX1 = X(2:2:end,:);
        Data.OriginalY1 = Y(2:2:end,:);
        % Tesing  Odd numbers
        Data.OriginalX2 = X(1:2:end,:);
        Data.OriginalY2 = Y(1:2:end,:);
    case 5
       %% 1-2-3
        % Training  
        trainset_X_1 = X(1:3:end,:);
        trainset_Y_1 = Y(1:3:end,:);
        trainset_X_2 = X(2:3:end,:);
        trainset_Y_2 = Y(2:3:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Tesing  1/3
        Data.OriginalX2 = X(3:3:end,:);
        Data.OriginalY2 = Y(3:3:end,:);
    case 6
       %% 2-3-1
        % Training  
        trainset_X_1 = X(2:3:end,:);
        trainset_Y_1 = Y(2:3:end,:);
        trainset_X_2 = X(3:3:end,:);
        trainset_Y_2 = Y(3:3:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Tesing 1/3
        Data.OriginalX2 = X(1:3:end,:);
        Data.OriginalY2 = Y(1:3:end,:);
    case 7
       %% 3-1-2
        % Training  
        trainset_X_1 = X(3:3:end,:);
        trainset_Y_1 = Y(3:3:end,:);
        trainset_X_2 = X(1:3:end,:);
        trainset_Y_2 = Y(1:3:end,:);
        Data.OriginalX1 = [trainset_X_1;trainset_X_2];
        Data.OriginalY1 = [trainset_Y_1;trainset_Y_2];
        % Tesing 1/3
        Data.OriginalX2 = X(2:3:end,:);
        Data.OriginalY2 = Y(2:3:end,:);
    case 8
         %% 0.632Bootstrap
        [M,~] = size(X);
        tag_number = 1:M;
        % bootstrap sampling
        train_tag=bootrsp(tag_number,1);
        % Training  
        Data.OriginalX1 = X(train_tag,:);
        Data.OriginalY1 = Y(train_tag,:);
        % Tesing 
        test_tag = setdiff(tag_number,train_tag); 
        Data.OriginalX2 = X(test_tag,:);
        Data.OriginalY2 = Y(test_tag,:);
    case 9
        %% 50%-50%
        % Training
        train_num = ceil(N/2);  
        Data.OriginalX1 = X((1:train_num),:);
        Data.OriginalY1 = Y((1:train_num),:);
        
        % Tesing 1/3
        Data.OriginalX2 = X((train_num+1:end),:);
        Data.OriginalY2 = Y((train_num+1:end),:);

    otherwise
        disp('Please select correct data set ID');
        
end

