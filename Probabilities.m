%this function takes the text file in variable (file)
%and the charachters that we will calculte its probability in variable (char)
function probs = Probabilities(file, char)
charFreq = zeros(1,length(char));  %array that stores the frequency of each character
%we will make for loop to loop at each character we are searching for
for i = 1:length(char)
    %this for loop will loop on the file to count tha number of
    %repeatitions of the chracter in it
    for c = file
        if c == char(i)
            charFreq(i) = charFreq(i) + 1;
        end
    end
end
probs = charFreq ./ length(file);  %get probability of each character in the whole file
end

