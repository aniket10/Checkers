function [S v]=ValidateUserMoveRed(S,a,b,aa,bb)
disp('in red');
disp(S(b,a));
if((b>=1 && b<=8) && (a>=1 && a<=8))
    disp('in if1');
    if(S(b,a)==1)   %For a normal Checker
        disp('in if2');
        if((bb-b)==2 && abs(a-aa)==2 && (bb>=1 && bb<=8) && (aa>=1 && aa<=8) && S(bb,aa)==0 && (S((b+bb)/2,(a+aa)/2)==2 || S((b+bb)/2,(a+aa)/2)==4))
            disp('in jump');
            S=MakeJump(S,a,b,(a+aa)/2,(b+bb)/2,aa,bb,1,0,0);
            v=1;
        elseif ((bb-b)==1 && abs(a-aa)==1 && (bb>=1 && bb<=8) && (aa>=1 && aa<=8)&& S(bb,aa)==0)
            disp('in ifelse');
            S=MakeMove(S,a,b,aa,bb,0);
            v=1;
        else
            v=0;
        end
    elseif(S(b,a)==3)   %For a King Checker
        if(abs(b-bb)==2 && abs(a-aa)==2 && (bb>=1 && bb<=8) && (aa>=1 && aa<=8)&& S(bb,aa)==0 && (S((b+bb)/2,(a+aa)/2)==2 || S((b+bb)/2,(a+aa)/2)==4))
            S=MakeJump(S,a,b,(a+aa)/2,(b+bb)/2,aa,bb,1,0,0);
            v=1;
        elseif (abs(b-bb)==1 && abs(a-aa)==1 && (bb>=1 && bb<=8) && (aa>=1 && aa<=8)&& S(bb,aa)==0)
            S=MakeMove(S,a,b,aa,bb,0);
            v=1;
        else
            v=0;
        end
    else
        v=0;
    end
else
    disp('in else');
    v=0;
end
        
end

    