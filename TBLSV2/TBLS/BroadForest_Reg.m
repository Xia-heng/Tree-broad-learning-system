function [Model,Record] = BroadForest_Reg(X1,Y1,X2,Y2,ParaMode)
%% Model training
Lamda = ParaMode.Lamda_Reg;
%% Feature mapping layer model
Layer1 = ForestLayer(X1,Y1,ParaMode);
Layer1Map = TrainPredict(Layer1,X1,ParaMode);
%% Enhancement layer model
X11 = [X1,Layer1Map];
Layer2 = ForestLayer(X11,Y1,ParaMode);
Layer2Map = TrainPredict(Layer2,X11,ParaMode);
%% Calculate weight of base model
L12Map = [Layer1Map,Layer2Map];
W1 = (L12Map'*L12Map + Lamda * eye(size(L12Map',1)))\L12Map'*Y1;
L12Pre = L12Map * W1;
RMSE_Train2 = sqrt(sum((L12Pre-Y1).^2)/size(Y1,1));
Record = [];
Record = [Record; 0 RMSE_Train2 0 inf];
%% Increment learning
% Data reorganization
X12 = [X1,L12Map];
Tana = inf;
for i = 1:1000
    %% Increment layer
    Layer3 = IncrementLayer(X12,Y1,ParaMode,i);
    Layer3Map = IncrementPredict(Layer3,X12,i);  
    %% Update weight
    L123Map = [L12Map,Layer3Map];
    UpdateWeight = (L123Map'*L123Map + Lamda * eye(size(L123Map',1))) \ L123Map' * Y1;
    WeightCell{1,i} =  UpdateWeight;
    %% Error of training
    L123Pre = L123Map * UpdateWeight;
    Tra_RMSE = sqrt(sum((L123Pre-Y1).^2)/size(Y1,1));
    %% Error of validation
    Val_MapL1 = TrainPredict(Layer1,X2,ParaMode);
    Val_MapL2 = TrainPredict(Layer2,[X2,Val_MapL1],ParaMode);
    Val_MapL3 = IncrementPredict(Layer3,[X2,Val_MapL1,Val_MapL2],i);
    Val_Pre = [Val_MapL1,Val_MapL2,Val_MapL3] * UpdateWeight;
    Val_RMSE = sqrt(sum((Val_Pre-Y2).^2)/size(Y2,1));
    Record = [Record; i Tra_RMSE Val_RMSE Tana];
    if i >= 2
        Tana = abs(Record(i,2) - Record(i-1,2)); % convergence rate
        if Tana < 1e-4 
            BDTLS = {Layer1;Layer2;Layer3(:,1:i)};
            Model.BDTLSWeight = WeightCell{1,i};
            Model.IncrementNum = i;
            Model.BDTLS = BDTLS;
            Model.W1 = W1;
            return
        end
    end
    fprintf('\n Incremented models: %d; Training RMSE:%f', i,Tra_RMSE);
end
%% Optimal model
[value,IncrementNum] = min(Tra_RMSE);
BDTLS = {Layer1;Layer2;Layer3(:,1:IncrementNum)};
BDTLSWeight = WeightCell{1,IncrementNum};
Model.BDTLS = BDTLS;
Model.IncrementNum = IncrementNum;
Model.BDTLSWeight = BDTLSWeight;
Model.W1 = W1;
end