function Result = BDFR_predict(Model,X,ParaMode)
% Model: Tree model
% X: input
TBLS = Model.BDTLS;
Weight = Model.BDTLSWeight;
IncrementNum = Model.IncrementNum;
% Mapping layer
Layer1Map = TrainPredict(TBLS{1,1},X,ParaMode);
% Data reorganization
Enhdata = [X,Layer1Map];
% Enhancement layer
Layer2Map = TrainPredict(TBLS{2,1},Enhdata,ParaMode);
% Data reorganization
Incdata = [X,Layer1Map,Layer2Map];
% Increment layer
Layer3Map = IncrementPredict(TBLS{3,1},Incdata,IncrementNum);

Result = [Layer1Map,Layer2Map,Layer3Map] * Weight;
end

