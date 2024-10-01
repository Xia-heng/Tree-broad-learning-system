function result = Compute(X,tree)
% Calculate the predicted value of Tree for input X
% Determine whether it has reached the leaf node of the tree  
if (tree.dim == 0)  
    result = tree.Child; 
    return  
end  
% Obtain the feature point and value of internal node
dim = tree.dim;
split_loc = tree.split_loc;

% Using recursive strategy
if X(1,dim) > split_loc
    result = Compute(X,tree.Child(1));
else
    result = Compute(X,tree.Child(2));
end
end

