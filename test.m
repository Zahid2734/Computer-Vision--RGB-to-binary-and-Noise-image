%%
%a=[1,2,3,4,5;6,7,8,9,10;11,25,13,14,15;16,17,999,19,20;21,22,23,24,25];
a= I3;
[x,y]=size(a)
window=7;
b=a;
[x,y]=size(a);
for i = ceil(window/2):(x-floor(window/2))
    for j = ceil(window/2):(y-floor(window/2))
        b(i,j)= mean2(a(i-floor(window/2):i+floor(window/2),j-floor(window/2):j+floor(window/2)));
    end
end
imshow(b)

%%
a= I3;
pad=zeros(654,312);
[x,y]= size(pad)
pad(4:651,4:309) = I3;
dum=pad;
for i = ceil(window/2):(x-floor(window/2))
    for j = ceil(window/2):(y-floor(window/2))
        pad(i,j)= mean2(dum(i-floor(window/2):i+floor(window/2),j-floor(window/2):j+floor(window/2)));
    end
end

final= pad(4:651,4:309);
imshow(final)

%%
X=[2,1;1,2]
A = rand(2,2)
dot2dot(A*X)