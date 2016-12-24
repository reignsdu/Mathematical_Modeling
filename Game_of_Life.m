function Game_of_Life(n) 
if nargin==0; 
   n=500; 
end 
B=round(rand(n+2));
Z=B(2:end-1,2:end-1);
H=imshow(Z,[]);
set(gcf,'position',[241 132 560 420]) 
set(gcf,'doublebuffer','on'); 
xlabel('Please press "space" key and stop this program!',... 
 'fontsize',12,'color','r'); 
k=1; 
title('Game of life','color','b'); 
while k; 
  s=get(gcf,'currentkey'); 
  if strcmp(s,'space'); 
      clc;k=0; 
  end 
  A=sumfun(B); 
  X=zeros(n); 
  X(Z==1 & (A==2 | A==3))=1; 
  X(Z==0 & A==3)=1; 
  B(2:end-1,2:end-1)=X; 
  Z=X; 
  set(H,'CData',1-X); 
  pause(1); 
end 
figure(gcf); 
function S=sumfun(B); 
% 周围8个位置的和 
S=B(1:end-2,2:end-1)+... 
   B(3:end,2:end-1)+... 
   B(2:end-1,1:end-2)+... 
   B(2:end-1,3:end)+... 
   B(2:end-1,1:end-2)+... 
   B(1:end-2,3:end)+... 
   B(3:end,1:end-2)+... 
   B(3:end,3:end); 