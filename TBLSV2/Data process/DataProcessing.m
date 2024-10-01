function [DataSpliTran]= DataProcessing(ParaData,X,Y)
%% Data preprocess
% Split way // SpliStra=2:train and test, SpliStra=2:train validation and test
% Standardization and Normalization// ProcStra=1:Standardization£¬ProcStra=0:Normalization
%% Data split
Choose = ParaData.splisequ;
SpliStra = ParaData.spliNumb;
if SpliStra == 2
    DataSpliTran = TT_SampleGeneration(X,Y,Choose);
end
if SpliStra == 3
    DataSpliTran = TVT_SampleGeneration(X,Y,Choose);
end
%% Standardization or Normalization
DataSpliTran = StanOrNorm(ParaData,DataSpliTran);
end