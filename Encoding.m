function Encoding(characters, codes, input)
fileID = fopen('encodedText.txt', 'w+'); %open file to write the encoded text in it
for i = input 
    for j = 1:length(characters) %to search for all characters
        if i == characters(j) %if the input file contains this character we execute the code
            fprintf(fileID, codes{j}); %print the code of the character in the file of encoded text
        end
    end 
end 
fclose(fileID); %closing the file
end 