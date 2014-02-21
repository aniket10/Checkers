function Checkers(action)

global turn Checker handles;

clc
%--------------------------------------------------------------------------
if nargin < 1, Checker=9*ones(8,8);  action = 'initialize'; end;
%--------------------------------------------------------------------------
if strcmp(action,'initialize')
    Checker = zeros([8,8]);
    red=1;
    black=2;
    for a=1:8
        for b=1:3
            if(mod(a+b,2)~=0)
                Checker(b,a) = red;
            end
        end
        for b=6:8
            if(mod(a+b,2)~=0)
                Checker(b,a) = black;
            end
        end
    end
    display(Checker);
    fig=figure( ...
                'Name','CHECKERS', 'NumberTitle','off', ...
                'Visible','off', 'BackingStore','off');  

    turn=0; 

%    if mod(turn,2)==0,
%        handles(3) = text(3.5,0,'Player turn...','color','w','fontsize',18);
%    end
%    if mod(turn,2)==1,
%        handles(3) = text(3.5,0,'CPU turn...','color','k','fontsize',18);
%    end
    
    handles(5)=line([1 10 1],[1 10 1],'linewidth',3,'color','g','visible','off');
    handles(6)=line([1 10 1],[1 10 1],'linewidth',3,'color','g','visible','off');
    
    Board(Checker,turn);
    figure(fig);
    
    if mod(turn,2)==0,
        Checkers('Player');    
    end
    if mod(turn,2)==1,
        Checkers('CPU');    
    end
    
end
%--------------------------------------------------------------------------
% Handling the handles

fig_handle = axes( ...
                'Units','normalized',  ...
                'Visible','off', 'DrawMode','fast', ...
                'NextPlot','replace');
            
help_handle = uicontrol('units','normalized',...
                'position',[.85 .12 .1  .05],'string','Help', ...
                'callback','Checkers(''Help'')', ...
                'interruptible','on');

exit_handle = uicontrol('units','normalized',...
                'position',[.85 .05 .1  .05],'string','Exit', ...
                'callback','delete(gcf)', ...
                'interruptible','off');
%--------------------------------------------------------------------------
if strcmp(action,'Help')
    msg=strvcat('DESCRIPTION of GAME:                                                        ',...
                '1. Checkers is played on the dark squares only.                             ',...
                '2. If one of your pieces is next to one of your opponent''s pieces and      ',...
                '   the square beyond it is free, you are required to jump over the          ',...
                '   opponent’s piece. The opponent’s piece is then removed from the board.    ',...
                '3. It is possible to jump many times in a row with the same piece.          ',...
                '4. In the beginning, pieces can only move and jump forward.                 ',...
                '   However, if a piece reaches the far end of the board (in the case of     ',...
                '   the person playing red, the top), then it becomes a king.                ',...
                '   on top of the other. In this program, the king has a star on it.)        ',...
                '5. A king is allowed to move and jump diagonally backwards and forwards.    ',...
                '6. Kings can be captured like any other piece.                              ');
     
    msgbox(msg,'GAME->CHECKERS','help');
end
%--------------------------------------------------------------------------
if strcmp(action,'UUU') 
    %getting the input
    Button=0;
    while Button==0,        

       [Xnew Ynew Button] = ginput(1);
       Ynew1=floor(Xnew);
       Xnew1=floor(Ynew);
       Xnew=floor(Xnew);
       Ynew=floor(Ynew);

       [SXnew SYnew Button] = ginput(1);
       SXnew1=floor(SYnew);
       SYnew1=floor(SXnew);
       SXnew=floor(SXnew);
       SYnew=floor(SYnew);

   %Soldier
   disp([Checker(Xnew,Ynew) Xnew Ynew SXnew SYnew Xnew1 Ynew1 SXnew1 SYnew1]);
   [Checker Button]=ValidateUserMoveRed(Checker,Xnew1,Ynew1,SXnew1,SYnew1);
   if(Button == 0)
       disp('Invalid Move');
   end
    end
 
    turn=turn+1;    

%    set(handles(3),'string','CPU turn...','color','w');

    %checking for win/loose (NO Move + NO Coin)
    count=0;
    [R,C,v]=find(Checker==2 | Checker==4);
    for kk=1:length(R)
        Button=Check(Checker,R(kk),C(kk));
        if Button==1, count=count+1;  end
    end
    if (length(find(Checker==2))+length(find(Checker==4))==0 || count==0), 
        msg=['Congrats...U WON the Game...'];
        msg_handle=msgbox(msg,'Nice Play...!');        
        pause(4);
        close(msg_handle);
        closereq
        return
    end
          
    set(handles(5),'XData',[Xnew Xnew+1 Xnew+1 Xnew Xnew],'YData',[Ynew Ynew Ynew+1 Ynew+1 Ynew],'color','r','visible','off');
    set(handles(6),'XData',[SXnew SXnew+1 SXnew+1 SXnew SXnew],'YData',[SYnew SYnew SYnew+1 SYnew+1 SYnew],'color','r','visible','off');
    Board(Checker,turn);
    drawnow;
end
%--------------------------------------------------------------------------
if strcmp(action,'CPU') 
    %getting the input
    Button=1;

    Checker=Expand(Checker,Button);

   
    %checking for win/loose (NO Move + NO Coin)
    count=0;
    [R,C,v]=find(Checker==1 | Checker==3);
    for kk=1:length(R)
        Button=Check(Checker,R(kk),C(kk));
        if Button==1, count=count+1;  end
    end
    if (length(find(Checker==1))+length(find(Checker==3))==0 || count==0), 

        msg=['Sorry...CPU WON the Game...'];

        msg_handle=msgbox(msg,'Nice Play...!');        
        pause(4);
        close(msg_handle);
        closereq
        return        
    end
    
    turn=turn+1;  
    Board(Checker,turn);
    drawnow;
end
%--------------------------------------------------------------------------