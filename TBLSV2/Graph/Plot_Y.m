function [] = Plot_Y(Y_Actual,num)
Fig = figure (num);
Fig.Position = [500 300 800 400];
plot(Y_Actual,'r-h','LineWidth',1,'MarkerSize',5);
ylim([min(Y_Actual) max(Y_Actual)])
xlabel('Sample');
ylabel('Value');
legend('Curve');
end
