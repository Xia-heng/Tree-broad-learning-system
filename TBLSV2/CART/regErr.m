function [ Error ] = regErr( Dataset )  
[m,n] = size(Dataset);
% Error = Variance ¡Á Total
DataVar = var(Dataset(:,n));  
Error = DataVar * m;  
end  