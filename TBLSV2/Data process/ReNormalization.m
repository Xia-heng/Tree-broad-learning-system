function [D2] = ReNormalization(D1, D2, a, b)
[m, n] = size(D1);
minx = min(D1);
maxx = max(D1);
for i = 1:n
    delta(i) = maxx(i) - minx(i);
    D2(:,i) = minx(i) + ((D2(:,i) - a)*delta(i)/(b - a));
end