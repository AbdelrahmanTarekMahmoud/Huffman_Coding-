function codes = HuffmanCreator(characters, probsArray)
n = length(probsArray); 
codes = cell(1, n); %cell of matrices each matrix will carry 1 row of the bits of the code
temp = cell(1, n);
for i = 1:n
    temp{i} = i; %cell of arrays only numbered to be used as index for the cell codes
end
temp2 = [probsArray; 1:n]; %making a matrix of 2 rows to number the probabillities with indices from 1 to n
for i = 1:n-1
    temp2 = (sortrows(temp2.', 1)).'; %getting transpose of the matrix and sorting it according to the first column (probabilities)
    temp = sortTempAsTemp2(temp, temp2(2, :)); %sorting temp by the same sort of second row of temp2 (indices after sorting)
    for j = 1:length(temp{1})
        codes{temp{1}(j)} = strcat('0', codes{temp{1}(j)}); %adding 0 bit to the least probability symbol
    end
    for j = 1:length(temp{2})
        codes{temp{2}(j)} = strcat('1', codes{temp{2}(j)}); %adding 1 bit to the second least probability symbol
    end
    temp2(1, 1) = temp2(1,1) + temp2(1, 2); %add the least two probabilities and store it in first element of the array
    temp{1} = [temp{1} temp{2}]; %make the first array representing the first two old arrays as we did in the array temp2 because temp is connected to temp2
    temp2(1, 2) = 100; %put very high probability for the element we don't need anymore to send it to the end of the matrix because we need yo sum the first two elements of the least probabilities next time
    temp{2} = 0; %cancel the corresponding array to the removed probability
    temp2(2, :) = 1:n; %renumbering the array of probabilities to re-sort it again according to the new probabilities
end
fprintf('Huffman table\n');
for i = 1:n
    fprintf('%c      %s\n', characters(i), codes{i});  %print characters and the strings that have the codes
end 
end 