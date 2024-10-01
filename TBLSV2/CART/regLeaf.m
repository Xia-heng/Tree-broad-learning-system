function [ leaf ] = regLeaf( dataSet )  
m = size(dataSet);  
leaf = mean(dataSet(m,:));  
end  