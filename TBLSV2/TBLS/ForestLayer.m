function Layer_Forest= ForestLayer(X_train,Y_train, ParaMode)

CART_Tree = ParaMode.CART_Tree;
FeaturesNum = ParaMode.FeaturesNum;
MinSamples = ParaMode.MinSamples;

for j=1:CART_Tree  
    % Bootstrap 
    [X_Train,Y_Train,~,~] = Bootstrap([X_train,Y_train]);
    % RSM 
    tag_num = zeros(2,FeaturesNum);
    [m,n] = size(X_train);
    num = randperm(n);
    x_train = X_Train(:,num(1,1:FeaturesNum));

    for i = 1:FeaturesNum
        tag_num(1,i) = i;
        tag_num(2,i) = num(i);
    end
    dataSet = [x_train,Y_Train];
    CARTTree = Make_Tree(dataSet, MinSamples,tag_num);
    RandomForest{1,j}= CARTTree;  
end  
Layer_Forest = RandomForest;
end

