function Efficiency(codes, probs, entropy)
%to calculate the efficiency we need to calculate the average code length
avgLength = 0;
for i = 1:length(probs)
    avgLength = avgLength + probs(i)*length(codes{i}); %calculate average code length
end
efficiency = entropy / avgLength; %calculate efficiency
fprintf('The average code word length = %f\nThe efficiency = %f\n', avgLength, efficiency);
end

