function [ ] = PlotFunction(X,Y)
[Rule,FigureNum] = size(Y);
% Color matrix
Color = {'r';'g';'b';'c';'m';'r';'g';'b';'c';'m';'r';'g';'b';'c';'m';'r';'g';'b';'c';'m'};
Color = Color(:,ones(1,Rule));
for i = 1 : FigureNum
    figure (i)
    for j = 1 : Rule
        plot(X,Y{j,i},'LineStyle',':','Color',Color{j,i},'LineWidth',1.8)
        legend
        hold on
    end
end
end

