function [Result] = RegreIndiStat(Model,ParaData,DataSpliTran,ParaMode)
% Evaluate Index
if ParaData.spliNumb == 2
    % Table 
    Indicators = {'Training set';'Testing set'};
    X1 = DataSpliTran.TransformX1;
    X2 = DataSpliTran.TransformX2;
    Y1 = DataSpliTran.OriginalY1;
    Y2 = DataSpliTran.OriginalY2;
    % Training
    resuX1 = BDFR_predict(Model,X1,ParaMode);
    ResuX1 = DataRestore(resuX1,ParaData,DataSpliTran);
    Result.resuX1 = resuX1;
    Result.ResuX1 = ResuX1;
    D1 = 'Training';
    IndicatorResult1 = ModelEvaluate(Y1,ResuX1,1111,D1);
    % Testing
    resuX2 = BDFR_predict(Model,X2,ParaMode);
    ResuX2 = DataRestore(resuX2,ParaData,DataSpliTran);
    Result.resuX2 = resuX2;
    Result.ResuX2 = ResuX2;
    D2 = 'Testing';
    IndicatorResult2 = ModelEvaluate(Y2,ResuX2,1112,D2);

    MSE = [IndicatorResult1.MSE;IndicatorResult2.MSE];
    RMSE = [IndicatorResult1.RMSE;IndicatorResult2.RMSE];
    MAE = [IndicatorResult1.MAE;IndicatorResult2.MAE];
    MdAE = [IndicatorResult1.MdAE;IndicatorResult2.MdAE];
    MPE = [IndicatorResult1.MPE;IndicatorResult2.MPE];
    MAPE = [IndicatorResult1.MAPE;IndicatorResult2.MAPE];
    MAAPE = [IndicatorResult1.MAAPE;IndicatorResult2.MAAPE];
    RMSPE = [IndicatorResult1.RMSPE;IndicatorResult2.RMSPE];
    R2 = [IndicatorResult1.R2;IndicatorResult2.R2];
    Accuracy = [IndicatorResult1.Accuracy;IndicatorResult2.Accuracy];
    Explained_Variance = [IndicatorResult1.Explained_Variance;IndicatorResult2.Explained_Variance];
    Result.IndicatorTable = table(Indicators,MSE,RMSE,MAE,MdAE, ...
                                                MPE,MAPE,MAAPE,RMSPE,R2,Accuracy,Explained_Variance);
end

if ParaData.spliNumb == 3
    Indicators = {'Training set';'Validation set';'Testing set'};
    X1 = DataSpliTran.TransformX1;
    X2 = DataSpliTran.TransformX2;
    X3 = DataSpliTran.TransformX3;
    Y1 = DataSpliTran.OriginalY1;
    Y2 = DataSpliTran.OriginalY2;
    Y3 = DataSpliTran.OriginalY3;
    % Training
    resuX1 = BDFR_predict(Model,X1,ParaMode);
    ResuX1 = DataRestore(resuX1,ParaData,DataSpliTran);
    Result.resuX1 = resuX1;
    Result.ResuX1 = ResuX1;
    D1 = 'Training';
    IndicatorResult1 = ModelEvaluate(Y1,ResuX1,1111,D1);
    % Validation
    resuX2 = BDFR_predict(Model,X2,ParaMode);
    ResuX2 = DataRestore(resuX2,ParaData,DataSpliTran);
    Result.resuX2 = resuX2;
    Result.ResuX2 = ResuX2;
    D2 = 'Validation';
    IndicatorResult2 = ModelEvaluate(Y2,ResuX2,1112,D2);
    % Testing
    resuX3 = BDFR_predict(Model,X3,ParaMode);
    ResuX3 = DataRestore(resuX3,ParaData,DataSpliTran);
    Result.resuX3 = resuX3;
    Result.ResuX3 = ResuX3;
    D3 = 'Testing';
    IndicatorResult3 = ModelEvaluate(Y3,ResuX3,1113,D3);

    MSE = [IndicatorResult1.MSE;IndicatorResult2.MSE;IndicatorResult3.MSE];
    RMSE = [IndicatorResult1.RMSE;IndicatorResult2.RMSE;IndicatorResult3.RMSE];
    MAE = [IndicatorResult1.MAE;IndicatorResult2.MAE;IndicatorResult3.MAE];
    MdAE = [IndicatorResult1.MdAE;IndicatorResult2.MdAE;IndicatorResult3.MdAE];
    MPE = [IndicatorResult1.MPE;IndicatorResult2.MPE;IndicatorResult3.MPE];
    MAPE = [IndicatorResult1.MAPE;IndicatorResult2.MAPE;IndicatorResult3.MAPE];
    MAAPE = [IndicatorResult1.MAAPE;IndicatorResult2.MAAPE;IndicatorResult3.MAAPE];
    RMSPE = [IndicatorResult1.RMSPE;IndicatorResult2.RMSPE;IndicatorResult3.RMSPE];
    R2 = [IndicatorResult1.R2;IndicatorResult2.R2;IndicatorResult3.R2];
    Accuracy = [IndicatorResult1.Accuracy;IndicatorResult2.Accuracy;IndicatorResult3.Accuracy];
    Explained_Variance = [IndicatorResult1.Explained_Variance;...
                                                        IndicatorResult2.Explained_Variance;...
                                                        IndicatorResult3.Explained_Variance];
    Result.IndicatorTable = table(Indicators,MSE,RMSE,MAE,MdAE, ...
                                            MPE,MAPE,MAAPE,RMSPE,R2,Accuracy,Explained_Variance);
end
end