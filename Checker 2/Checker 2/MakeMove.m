function S = MakeMove(S, a, b, aa, bb, RB) 

%Function Name : MakeMove
%Author : Aniket Ajagaonkar

% Function to move piece from (a,b) to (aa,bb)

piece = S(b, a);
S(b, a) = 0;
if (bb == 1+7*(1-RB) && piece==(1+RB)) % King promotion for simple pieces
S(bb, aa) = 3+RB;
else
S(bb, aa) = piece;
end