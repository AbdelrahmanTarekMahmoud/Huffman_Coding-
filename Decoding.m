function decoded = Decoding(characters, codes)
fileID_Encoded = fopen('encodedText.txt','r'); %read the text file
encodedText = fscanf(fileID_Encoded, '%c'); %reads and converts data from a text file into array in column order
fileID_Decoded = fopen('decodedText.txt', 'w+'); %open file to write the encoded text in it
decoded = [];
currentCode = [];
for i = encodedText %takes every charachter of the encoded text
   currentCode = [currentCode i]; %if the code of the characters didn't equal the current code we take the next bit in the file and search for the new current code in our codes
   for j = 1:length(codes) %counter j is used to search for current code in our character codes
       if isequal(currentCode, codes{j})
           decoded = [decoded characters(j)]; %we get the character if the current code is similarto its code
           currentCode = []; %making current code empty to serch for the code of next character
           fprintf(fileID_Decoded, characters(j)); %print the character in decoded text
           break;
       end
   end
end 
fclose(fileID_Decoded); %closing the file
end