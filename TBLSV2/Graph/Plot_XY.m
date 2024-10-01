function [] = Plot_XY(Y_Actual,Y_Predicted,num)
Fig = figure (num);
Fig.Position = [500 300 800 400];
% plot(Y_Predicted,'- .','Color',[0.0000,0.4470,0.7410],'LineWidth',1);
% plot(Y_Predicted,'- .','Color',[0.4660,0.6740,0.1880],'LineWidth',1);
plot(Y_Predicted,'b-o','LineWidth',1,'MarkerSize',5);
% plot(Y_Predicted,'b-','LineWidth',1);
hold on
% plot(Y_Actual,'-o','Color',[0.8500,0.3250,0.0980],'LineWidth',1);
plot(Y_Actual,'r-h','LineWidth',1,'MarkerSize',5);
% plot(Y_Actual,'r-','LineWidth',1);
xlim([0 size(Y_Actual,1)])
ylim([min([Y_Actual;Y_Predicted]) max([Y_Actual;Y_Predicted])])
xlabel('Sample');
ylabel('Value');
legend('Predicted value','Actual value');
end

