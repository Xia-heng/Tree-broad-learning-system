function Result = IncrementPredict(Model,X,Tree1)
% Model: Tree model
% X: Input
[m,~] = size(X);
% Results = zeros(m,Tn);
x_test = X;
for j = 1 : Tree1  
    for i = 1:m 
        % Prediction using CART
        results(i,1) = Compute(x_test(i,:),Model{1,j}); 
    end
    Results(:,j) = results;
end

for i = 1:m
    Result = Results;
end
end

