function Tree = Make_Tree(Dataset, MinSamples,Tag_num)
%% Bgain fot tree grow
% Split Feature
Tree.dim = 0; 
% Split locate 
Tree.split_loc = inf;  
Tree.Nf = []; 
% Choose the best split point
[Index,Value] = ChooseBestSplit(Dataset, MinSamples);  
if Index ~= 0
   Tree.dim = Tag_num(2,Index); 
   Tree.split_loc = Value;
   Tree.Nf = unique(Dataset(:,Index)');
end
% disp(['feat:', num2str(Index)]);  
% disp(['value:', num2str(Value)]);  
if Index == 0  
    Tree.Child = Value;
    return;  
end  
% Obtain two subset from Dataset
[LSet,RSet] = BinSplit(Dataset, Index, Value);  
Tree.Child(1) = Make_Tree( LSet,MinSamples,Tag_num );  
Tree.Child(2) = Make_Tree( RSet,MinSamples,Tag_num);  
end

