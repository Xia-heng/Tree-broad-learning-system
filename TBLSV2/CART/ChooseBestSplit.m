function [Index, Value] = ChooseBestSplit( Dataset, MinSamples )  
% Dataset��Training data
% MinSamples��the minimum number of sample
[m,n] = size(Dataset);
% Execute the following program If the minimum number of sample is small
if m <= MinSamples
    Index = 0;  
    Value = regLeaf(Dataset(:,n));  
    return;  
end  
% Prepare
IniErr = regErr(Dataset);
BestErr = inf;  
BestIndex = 0;  
BestValue = 0;  
      
% ���õݹ�ķ�ʽѰ�ң���ѵ�λ�ú����ŵ�ֵ

for j = 1:(n-1) % Find optimal locate and value using recursive
    % Outside loop: Traverse each feature 
    b = unique(Dataset(:,j)); % ����ȥ����һ���������ظ�������
    lenFeatures = length(b);  
    for i = 1:lenFeatures % Outside loop
        temp = b(i,:); 
        [mat0,mat1] = BinSplit(Dataset, j ,temp);  
        m0 = size(mat0);  
        m1 = size(mat1);  
        % Note: it needs to be determined whether it has already fallen below the minimum number of samples to prevent the regErr function from throwing an exception
        if m0(:,1) < (round(MinSamples/2)) || m1(:,1) < (round(MinSamples/2))  
            continue;  
        end 
        newErr = regErr(mat0) + regErr(mat1); 
        if newErr < BestErr  
            BestErr = newErr;  
            BestIndex = j;  
            BestValue = temp;  
        end  
    end  
end  

Index = BestIndex;  
Value = BestValue;  
end  