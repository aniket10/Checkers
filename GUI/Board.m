function Board(Checker,turn)

for ii=1:8
     for jj=1:8  
          hold on
          rectangle('Position', [0+ii 0+jj 1 1],'linewidth',0.5,'edgecolor',[0.8 0.9 0.9]);
          X=[0+ii 1+ii 1+ii 0+ii];
          Y=[0+jj 0+jj 1+jj 1+jj];
          
          if mod(mod(ii,2)+mod(jj,2),2)==0,                
              fill(X,Y,'k'); 
          end          
          if mod(mod(ii,2)+mod(jj,2),2)==1,                
              fill(X,Y,'w');
          end
          
          Xcir=(0.5+ii)+0.4*cos(0:1/50:2*pi);
          Ycir=(0.5+jj)+0.4*sin(0:1/50:2*pi);
          
          if ((Checker(ii,jj)==1) || (Checker(ii,jj)==3)),                
              fill(Xcir,Ycir,'r','EdgeColor','w');
          end
          if ((Checker(ii,jj)==2) || (Checker(ii,jj)==4)),                
              fill(Xcir,Ycir,'b','EdgeColor','w');  
          end
          
          SXcir=(0.5+ii)+0.2*cos(0:1/50:2*pi);
          SYcir=(0.5+jj)+0.2*sin(0:1/50:2*pi);
          
          if (Checker(ii,jj)==3 || Checker(ii,jj)==4),                
              fill(SXcir,SYcir,'y','EdgeColor','w');  
          end       
     end
end

text(-2,9,'Player','color','b','fontsize',15);
text(10,9,'CPU','color','b','fontsize',15);

rectangle('Position', [1 1 8 8],'linewidth',2,'edgecolor',[0.0 1.0 0.9]);
axis([0 10 0 10]);
title('Checker','fontsize',18,'color','b');
axis equal
axis off
set(gcf,'Resize','off');
hold off
if mod(turn,2)==0,
    Checkers('UUU');
end
if mod(turn,2)==1,   
    Checkers('CPU');
end
%--------------------------------------------------------------------------