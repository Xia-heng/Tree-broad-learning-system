function [DataSpliTran] = StanOrNorm(ParaData,DataSpliTran)
%% Data preprocess
% Standardization and Normalization// ProcStra=1:Standardization£¬ProcStra=2:Normalization
SpliStra = ParaData.spliNumb;
if SpliStra == 2
    ProcStra = ParaData.StanOrNorm;
    if ProcStra
        % Standardization
        [DataSpliTran.TransformX1,MX,SX] = auto(DataSpliTran.OriginalX1);
        [DataSpliTran.TransformY1,MY,SY] = auto(DataSpliTran.OriginalY1);
        DataSpliTran.TransformMeanX = MX;
        DataSpliTran.TransformStanX = SX;
        DataSpliTran.TransformMeanY = MY;
        DataSpliTran.TransformStanY = SY;
        % isnan(DataSpliTran.TransformX1)
        % Replace NaN with 0
        DataSpliTran.TransformX1(isnan(DataSpliTran.TransformX1)) = 0;
        % X_train = rmmissing(X_train,2);
        % Tesing 
        DataSpliTran.TransformX2 = scale(DataSpliTran.OriginalX2,MX,SX);
        DataSpliTran.TransformY2 = scale(DataSpliTran.OriginalY2,MY,SY);
        % Replace NaN with 0
        DataSpliTran.TransformX2(isnan(DataSpliTran.TransformX2)) = 0;
        % X_test = rmmissing(X_test,2);
    end
    if ~ProcStra
    % Normalization
    NormDown = 0;
    NormUp = 1;
    [DataSpliTran.TransformX1, DataSpliTran.TransformX2] = Normalization...
        ( NormDown, NormUp,DataSpliTran.OriginalX1,DataSpliTran.OriginalX2);
    % Replace NaN with 0
    DataSpliTran.TransformX1(isnan(DataSpliTran.TransformX1)) = 0;
    DataSpliTran.TransformX2(isnan(DataSpliTran.TransformX2)) = 0;
    [DataSpliTran.TransformY1, DataSpliTran.TransformY2] = Normalization...
        (NormDown, NormUp,DataSpliTran.OriginalY1,DataSpliTran.OriginalY2);
    DataSpliTran.TransformNormDown = NormDown;
    DataSpliTran.TransformNormUp = NormUp;
    end
end
if  SpliStra == 3
    ProcStra = ParaData.StanOrNorm;
    if ProcStra
        % Standardization
        [DataSpliTran.TransformX1,MX,SX] = auto(DataSpliTran.OriginalX1);
        [DataSpliTran.TransformY1,MY,SY] = auto(DataSpliTran.OriginalY1);
        % X_train = rmmissing(X_train,2);
        DataSpliTran.TransformMeanX = MX;
        DataSpliTran.TransformStanX = SX;
        DataSpliTran.TransformMeanY = MY;
        DataSpliTran.TransformStanY = SY;
        % Replace NaN with 0
        DataSpliTran.TransformX1(isnan(DataSpliTran.TransformX1)) = 0;
        % Validation
        DataSpliTran.TransformX2 = scale(DataSpliTran.OriginalX2,MX,SX);
        DataSpliTran.TransformY2 = scale(DataSpliTran.OriginalY2,MY,SY);
        % Replace NaN with 0
        DataSpliTran.TransformX2(isnan(DataSpliTran.TransformX2)) = 0;
        % X_Validation = rmmissing(X_Validation,2);
        % Testing 
        DataSpliTran.TransformX3 = scale(DataSpliTran.OriginalX3,MX,SX);
        DataSpliTran.TransformY3 = scale(DataSpliTran.OriginalY3,MY,SY);
        % Replace NaN with 0
        DataSpliTran.TransformX3(isnan(DataSpliTran.TransformX3)) = 0;
        % X_test = rmmissing(X_test,2);
    end
    if ~ProcStra
    % Normalization
    NormDown = 0;
    NormUp = 1;
    [DataSpliTran.TransformX1, DataSpliTran.TransformX2, DataSpliTran.TransformX3] = Normalization...
        (NormDown,NormUp,DataSpliTran.OriginalX1,DataSpliTran.OriginalX2,DataSpliTran.OriginalX3);
    % Replace NaN with 0
    DataSpliTran.TransformX1(isnan(DataSpliTran.TransformX1)) = 0;
    DataSpliTran.TransformX2(isnan(DataSpliTran.TransformX2)) = 0;
    DataSpliTran.TransformX3(isnan(DataSpliTran.TransformX3)) = 0;
    [DataSpliTran.TransformY1, DataSpliTran.TransformY2, DataSpliTran.TransformY3] = Normalization...
        (NormDown,NormUp,DataSpliTran.OriginalY1,DataSpliTran.OriginalY2,DataSpliTran.OriginalY3);
    DataSpliTran.TransformNormDown = NormDown;
    DataSpliTran.TransformNormUp = NormUp;
    end
end