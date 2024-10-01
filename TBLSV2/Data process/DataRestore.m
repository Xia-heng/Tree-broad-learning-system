function RawData = DataRestore(Data,ParaData,DataSpliTran)
StanOrNorm = ParaData.StanOrNorm;

if StanOrNorm
    MY = DataSpliTran.TransformMeanY;
    SY = DataSpliTran.TransformStanY;
    RawData = rescale(Data,MY,SY);
end

if ~StanOrNorm
    NormDown = DataSpliTran.TransformNormDown;
    NormUp = DataSpliTran.TransformNormUp ;
    YTrai = DataSpliTran.OriginalY1;
    RawData = ReNormalization(YTrai, Data, NormDown,NormUp);
end

end