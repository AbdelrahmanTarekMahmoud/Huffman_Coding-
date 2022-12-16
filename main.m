fileID = fopen('trial.txt','r'); %read the text file
input = fscanf(fileID, '%c'); %reads and converts data from a text file into array in column order
 
characters = ['a':'z','A':'Z','0':'9',' ','[',']','(',')','.',',','/','-','+','!','@','#','$','%','^','&','*'];

%Calculate the probabilities
probs = Probabilities(input, characters)
fprintf("__________________________________________________________\n\n");

%Calculate the information
info = Info(probs)
fprintf("__________________________________________________________\n\n");

%Calculate the entropy
entropy = Entropy(probs)
fprintf("__________________________________________________________\n\n");

%Generate the Huffman coding table
codes = HuffmanCreator(characters, probs);
fprintf("__________________________________________________________\n\n");

%generate text file contains the Encoded text
Encoding(characters, codes, input);

%take the encoded input to decode it
Decoded = Decoding(characters, codes);

%take the codes and their probabilities to get average code length then calculate efficiency using entropy
Efficiency(codes, probs, entropy);
fprintf("__________________________________________________________\n\n");

%getting size of input text file
fileID1 = fopen('trial.txt');
fseek(fileID1, 0, 'eof');
filesize1 = ftell(fileID1);
fclose(fileID1);
%getting size of input text file
fileID2 = fopen('encodedText.txt');
fseek(fileID1, 0, 'eof');
filesize2 = ftell(fileID2);
fclose(fileID2);
%printing the compression ratio
fprintf('Compression ratio = size of encoded text / size of input text = %f/%f = %f', filesize2, filesize1, filesize2/filesize1 );
fprintf("\n__________________________________________________________\n\n");


%Checking if decoded text file = the input text file
fileID3 = fopen('trial.txt','r');
inputText = fscanf(fileID3, '%c');
fileID4 = fopen('trial.txt','r');
decodedText = fscanf(fileID4, '%c');
if(decodedText == inputText);
    fprintf('Both files are the same\n');
end
