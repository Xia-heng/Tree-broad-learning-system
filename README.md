《Tree Broad Learning System for Small Data Modeling》
                                              ---Author by _heng xia_
▶_Basic information introduction_
This is a MATLAB code for a TBLS approach.              
Note: if anyone using this code, please cited the follow information:
H. Xia, J. Tang, W. Yu and J. Qiao, "Tree Broad Learning System for Small Data Modeling," IEEE Transactions on Neural Networks and Learning Systems, vol. 35, no. 7, pp. 8909-8923, July 2024, doi: 10.1109/TNNLS.2022.3216788. 

▶Description for code
● **Environment clear** (Users do not need to make any modifications)
● **Import data** (Users need to make modifications according to special task)
● **Data split and preprocess**
  ⇲ParaData.spliNumb = 2; %  2: training and testing; 3: training, validation and testing   
  ⇲ParaData.splisequ = 3; % this can be revised by user  
  ⇲ParaData.StanOrNorm = 1; % Standard = 1; Normal = 0
  ⇲DataSpliTran = DataProcessing(ParaData,Data,Data_Tag);
● **Hyperparameter setting** (Users modifications by artificial experience)  
  ⇲ParaMode.MinSamples = 3; % minimum sample in leaf, Integer type
  ⇲ParaMode.FeaturesNum = round(sqrt(size(Data,2))); % Selected feature number. The number of features in the data must be less than the number of features in the training data
  ⇲ParaMode.CART_Tree = 10; % Number of tree 
  ⇲ParaMode.Lamda_Reg = 0.1; % 2^-10, it is determined to be consistent with the special data 
● **Training model** (Users do not need to make any modifications)
● **Testing and data store** (Users do not need to make any modifications)
  ⇲Result = RegreIndiStat(Model,ParaData,DataSpliTran,ParaMode); % All results are included in the variable "Result"
