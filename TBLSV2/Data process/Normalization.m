function [D1,D2,D3] = Normalization(DownLimi, UpLimi,Data1,Data2,Data3)
[m, n] = size(Data1);
Minx = min(Data1);
Maxx = max(Data1);
if nargin == 3
    for i = 1:n
        delta(i) = Maxx(i) - Minx(i);
        D1(:,i) = DownLimi + ((Data1(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
    end
end
if nargin == 4
    for i = 1:n
        delta(i) = Maxx(i) - Minx(i);
        D1(:,i) = DownLimi + ((Data1(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
        D2(:,i) = DownLimi + ((Data2(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
    end
end
if nargin == 5
    for i = 1:n
        delta(i) = Maxx(i) - Minx(i);
        D1(:,i) = DownLimi + ((Data1(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
        D2(:,i) = DownLimi + ((Data2(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
        D3(:,i) = DownLimi + ((Data3(:,i) - Minx(i))./delta(i))*(UpLimi - DownLimi);
    end
end