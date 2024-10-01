%% Environment clear
clear all
clc
warning off
%% Import data
load CCS-LowDimension.mat
% Data = RB(1:3:end,1:end-1);
% Data_Tag = RB(1:3:end,end);
Data = CCS(1:1:end,1:end-1);
Data_Tag = CCS(1:1:end,end);
DataSet = [Data,Data_Tag];
[N,D] = size(DataSet); % D-Dimensional£»N-Sample number
disp(['Sample number= ', num2str(N),' ;  ', 'Dimensional= ', num2str(D-1)]);
%% Data split and preprocess
ParaData.spliNumb = 2;
ParaData.splisequ = 3;
ParaData.StanOrNorm = 1; % Standard = 1; Normal = 0
DataSpliTran = DataProcessing(ParaData,Data,Data_Tag);

%% Hypermeter setting
ParaMode.MinSamples = 3; % minimum sample in leaf
ParaMode.FeaturesNum = round(sqrt(size(Data,2))); % Selected feature number
ParaMode.CART_Tree = 10; % Number of tree
ParaMode.Lamda_Reg = 0.1; % 2^-10

%% Training model
X1 = DataSpliTran.TransformX1;
Y1 = DataSpliTran.TransformY1;
tic;
[Model,TrainRecord] = BroadForest_Reg(X1,Y1,X1,Y1,ParaMode);
t2=toc;
fprintf('\n Time of model training: %f\n',  t2);
Plot_Y(TrainRecord(:,2),111);
%% Testing and data store
Result = RegreIndiStat(Model,ParaData,DataSpliTran,ParaMode);
T = clock;
str = [num2str(T(1)),'_',num2str(T(2)),'_',num2str(T(3)),'_',num2str(T(4)),...
    '_',num2str(T(5))];
save(str,'*')
