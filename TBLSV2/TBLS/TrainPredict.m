function Result = TrainPredict(Model,X,ParaMode)
% Model: Tree model
% X: Input
[m,~] = size(X);
% Results = zeros(m,Tn);

CART_Tree = ParaMode.CART_Tree;
x_test = X;
for j = 1 : CART_Tree  
        for i = 1:m
            % Prediction using CART
            results(i,1) = Compute(x_test(i,:),Model{1,j}); 
        end
    Results(:,j) = results;
end
Result = Results;
end

