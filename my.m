clc;
clear all;
close all;
Q = 1; r = 3; J = 1; % TQWT parameters
% x = test_signal(4); % Make test signal
% x=1:100;
% 
% N = length(x); % Length of test signal
% % w = tqwt_radix2(x,Q,r,J); % TQWT
% % y = itqwt_radix2(w,Q,r,N); % Inverse TQWT
% 
% w = tqwt(x,Q,r,J); % TQWT
% y = itqwt(w,Q,r,N); % Inverse TQWT
% 
% recon_err = max(abs(x - y)) % Reconstruction error


KK=imread('1.jpg');
kk=rgb2gray(KK);

[m n]=size(kk);
% outo=zeros(m,n);

 for i=1:m
  
ro=kk(i,:);
lh=tqwt(ro,Q,r,J);
lo=cell2mat(lh(2));
A1=length(lo);
ho=cell2mat(lh(1 ));
A2=length(ho);
% t=2:2:length(lo);
% low=lo(t);
% tt=2:2:length(ho);
% high=ho(t);
low=lo;
high=ho;


newrow=[high low];
outo(i,:)=newrow;
 end


[ q s]=size(outo);





for j=1:s
   
ro1=outo(:,j);
lh1=tqwt(ro1,Q,r,J);
lo1=cell2mat(lh1(2));
B1=length(lo1);
ho1=cell2mat(lh1(1 ));
B2=length(ho1);
% t=2:2:length(lo);
% low=lo(t);
% tt=2:2:length(ho);
% high=ho(t);
low1=lo1;
high1=ho1;


newrow1=[high1 low1];
puto(:,j)=newrow1';
end






%%%%%%%%%%%%inverse
[ff gg]=size(puto);

 for k=1:gg
% k=2;
    ro2=puto(:,k);
    rro=mat2cell(ro2',[1],[B2 B1]);
%     kkkk=rro(1)';pppp=rro(2)';
%     rro=[kkkk pppp];
N2=m;
    lh2=itqwt(rro,Q,r,N2);

    outed(:,k)=lh2;
 end
 
[ccc vvv]=size(outed);

for e=1:ccc
    ro3=outed(e,:);
        rro3=mat2cell(ro3,[1],[A2 A1]);
        N3=n;
        lh3=itqwt(rro3,Q,r,N3);
        imgg(e,:)=lh3;
end


figure;
imshow(uint8(imgg));

