function IncrementModel = IncrementLayer(X1,Y1, ParaMode,Tree1)


FeaturesNum = ParaMode.FeaturesNum;
MinSamples = ParaMode.MinSamples;

for j=1:Tree1  
    % Bootstrap 
    [X_Train,Y_Train,~,~] = Bootstrap([X1,Y1]);
    % RSM 
    tag_num = zeros(2,FeaturesNum);
    [m,n] = size(X1);
    num = randperm(n);
    x_train = X_Train(:,num(1,1:FeaturesNum));

    for i = 1:FeaturesNum
        tag_num(1,i) = i;
        tag_num(2,i) = num(i);
    end
    DataSet = [x_train,Y_Train];
    CTree = Make_Tree(DataSet, MinSamples,tag_num);
    Forest1{1,j}= CTree;  
end  

IncrementModel = Forest1;

end

