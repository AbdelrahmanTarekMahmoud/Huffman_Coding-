%this function calculates the information of each character
function info = Info(probs)

for i = 1:length(probs)
    if probs(i) ~= 0
        info(i) = - log2(probs(i));
    end
end
end

