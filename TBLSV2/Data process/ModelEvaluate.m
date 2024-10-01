function [Indicator] = ModelEvaluate(TureValue,PredictValue,PictureNumber,Discription)
Plot_XY(TureValue,PredictValue,PictureNumber)
str = '*****************';
disp([str,Discription,str]);

%% Smaller is better
MSE = sum((PredictValue-TureValue).^2)/size(TureValue,1);
RMSE = sqrt(sum((PredictValue-TureValue).^2)/size(TureValue,1));
MAE = sum(abs(PredictValue-TureValue))/size(TureValue,1);
MdAE = median(abs(PredictValue-TureValue));
Indicator.MSE = MSE;
Indicator.RMSE = RMSE;
Indicator.MAE = MAE;
Indicator.MdAE = MdAE;
fprintf(' MSE:%.4f \\ RMSE:%.4f \\ MAE:%.4f \n',MSE,RMSE,MAE );
%%%%%%%%% Do not use MPE and MAPE,when target less than 1 %%%%%%%%%%
MPE = (100 * sum((PredictValue-TureValue)./TureValue))/size(TureValue,1);
MAPE = (100 * sum(abs((PredictValue-TureValue)./TureValue)))/size(TureValue,1);
MAAPE = sum(atan(abs((PredictValue-TureValue)./TureValue)))/size(TureValue,1);
RMSPE = sqrt(sum((abs((PredictValue-TureValue)./TureValue)).^2)/size(TureValue,1));
Indicator.MPE = MPE;
Indicator.MAPE = MAPE;
Indicator.MAAPE = MAAPE;
Indicator.RMSPE = RMSPE;
% fprintf(' MPE:%.4f \\ MAPE:%.4f \\ MAAPE:%.4f \r RMSPE:%.4f\n',...
%     MPE,MAPE,MAAPE,RMSPE );
%% Bigger is better
R2 = 1-(sum((PredictValue-TureValue).^2)./size(TureValue,1))./var(TureValue);
Accuracy = sum(1-(abs(PredictValue-TureValue)./abs(PredictValue)))./size(TureValue,1);
Explained_Variance = 1-var(PredictValue-TureValue)./var(TureValue);
Indicator.R2 = R2;
Indicator.Accuracy = Accuracy;
Indicator.Explained_Variance = Explained_Variance;
% Adj_R2 = 1-(1-R2)*((size(TureValue,1)-1)/(size(TureValue,1)-1-4));
% fprintf(' R2 = %.4E \\ Acc = %.4E \\ Explained_Var = %.4E \r Adj_R2 = %.4E\n',...
%     R2,Accuracy,Explained_Variance,Adj_R2 );
fprintf(' R2:%.4f \\ Acc:%.4f \\ EV:%.4f\n',R2,Accuracy,Explained_Variance );
end

