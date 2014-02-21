function [Button]=Check(Checker,Xnew,Ynew)

Button=1;% NOT a valid Coin

%Soldier
if Checker(Xnew,Ynew)==0,
  if (Xnew>=0 && Xnew<8 && Ynew>=0 && Ynew<8)
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<8 && Ynew>1 && Ynew<=9)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==1 || Checker(Xnew+1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==1 || Checker(Xnew+1,Ynew-1)==3), 
        Button=0;    
    end
  end
end
%--------------------------------------------------------------------------
if Checker(Xnew,Ynew)==1,
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==0 || Checker(Xnew-1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==0 || Checker(Xnew-1,Ynew-1)==2), 
        Button=0;    
    end
  end
end
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%King
if Checker(Xnew,Ynew)==2,
  if (Xnew>=0 && Xnew<=7 && Ynew>=0 && Ynew<=7)  
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=7 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==1 || Checker(Xnew+1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==1 || Checker(Xnew+1,Ynew-1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==1 || Checker(Xnew-1,Ynew+1)==3), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==1 || Checker(Xnew-1,Ynew-1)==3), 
        Button=0;    
    end
  end
end

%--------------------------------------------------------------------------
if Checker(Xnew,Ynew)==3,
  if (Xnew>=0 && Xnew<=7 && Ynew>=0 && Ynew<=7)  
    if (Checker(Xnew+1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=7 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew+1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew+2,Ynew+2)==9 && Checker(Xnew+1,Ynew+1)==0 || Checker(Xnew+1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=0 && Xnew<=6 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew+2,Ynew-2)==9 && Checker(Xnew+1,Ynew-1)==0 || Checker(Xnew+1,Ynew-1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=0 && Ynew<=7)
    if (Checker(Xnew-1,Ynew+1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=2 && Xnew<=8 && Ynew>=2 && Ynew<=8)
    if (Checker(Xnew-1,Ynew-1)==9), 
        Button=0;
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=0 && Ynew<=6)
    if (Checker(Xnew-2,Ynew+2)==9 && Checker(Xnew-1,Ynew+1)==0 || Checker(Xnew-1,Ynew+1)==2), 
        Button=0;    
    end
  end
  
  if (Xnew>=3 && Xnew<=8 && Ynew>=3 && Ynew<=8)
    if (Checker(Xnew-2,Ynew-2)==9 && Checker(Xnew-1,Ynew-1)==0 || Checker(Xnew-1,Ynew-1)==2), 
        Button=0;    
    end
  end
end
%--------------------------------------------------------------------------