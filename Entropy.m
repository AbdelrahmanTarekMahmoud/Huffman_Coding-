%this function takes the calculated probabilities and get the entropy
function entropy = Entropy(probs)
entropy = 0; %initial value
for i = probs
    if i ~= 0 %to avoid calculating log(0) that gives Math Error
      entropy = entropy - i * log2(i);
    end
end
end
