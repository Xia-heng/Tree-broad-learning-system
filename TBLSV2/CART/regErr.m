function [ Error ] = regErr( Dataset )  
[m,n] = size(Dataset);
% Error = Variance �� Total
DataVar = var(Dataset(:,n));  
Error = DataVar * m;  
end  