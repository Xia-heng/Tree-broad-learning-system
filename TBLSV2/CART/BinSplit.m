function [ Subset1, Subset2 ] = BinSplit( Data, Index, Value )  
%% Generate two subsets form Data
DataTemp = Data(:,Index)'; 
% Prepare 
Index1 = []; 
Index2 = [];  

for i = 1:size(Data,1)  
    if DataTemp(1,i) > Value % more than target value
        Index1 = [Index1,i];  
    else  
        Index2 = [Index2,i]; % less than target value
    end  
end  
[~,Col1] = size(Index1);
[~,Col2] = size(Index2);  

if Col1 > 0 && Col2 > 0  
    for j = 1:Col1  
        Subset1(j,:) = Data(Index1(1,j),:);  
    end  

    for j = 1:Col2  
        Subset2(j,:) = Data(Index2(1,j),:);  
    end  
elseif Col1 == 0  
        Subset1 = [];  
        Subset2 = Data;  
elseif Col2 == 0  
        Subset2 = [];  
        Subset1 = Data;  
end  
end  
