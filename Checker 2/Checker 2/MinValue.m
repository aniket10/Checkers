function [value] = MinValue(S, RW, flag, depth)

%similat to MaxValue.m

[list_of_S,list_of_moves, flag, Jump] = Successors(S, RW, flag);

if TerminalTest(S, RW, flag, depth, Jump)
    value = Utility(S, RW);
else
    value = inf;
    for i = 1:length(list_of_S(1,1,:))
        value = min(value, MaxValue(list_of_S(:,:,i), mod(RW+1,2), flag, depth + 1));
    end
end

end