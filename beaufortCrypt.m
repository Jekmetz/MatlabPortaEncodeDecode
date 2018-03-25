function charArray = beaufortCrypt(word,key,spaces)
%This function takes a word, a key, and a boolean and encodes it using the
%beaufort cipher. The encryption and decryption processes are exactly the
%same. If you want to separate it with spaces, put 1 for the spaces
%argument, and if not, put 0.

    %Initialize independent variables
    cipher = ['ABCDEFGHIJKLMNOPQRSTUVWXYZ';...
              'BCDEFGHIJKLMNOPQRSTUVWXYZA';...
              'CDEFGHIJKLMNOPQRSTUVWXYZAB';...
              'DEFGHIJKLMNOPQRSTUVWXYZABC';...
              'EFGHIJKLMNOPQRSTUVWXYZABCD';...
              'FGHIJKLMNOPQRSTUVWXYZABCDE';...
              'GHIJKLMNOPQRSTUVWXYZABCDEF';...
              'HIJKLMNOPQRSTUVWXYZABCDEFG';...
              'IJKLMNOPQRSTUVWXYZABCDEFGH';...
              'JKLMNOPQRSTUVWXYZABCDEFGHI';...
              'KLMNOPQRSTUVWXYZABCDEFGHIJ';...
              'LMNOPQRSTUVWXYZABCDEFGHIJK';...
              'MNOPQRSTUVWXYZABCDEFGHIJKL';...
              'NOPQRSTUVWXYZABCDEFGHIJKLM';...
              'OPQRSTUVWXYZABCDEFGHIJKLMN';...
              'PQRSTUVWXYZABCDEFGHIJKLMNO';...
              'QRSTUVWXYZABCDEFGHIJKLMNOP';...
              'RSTUVWXYZABCDEFGHIJKLMNOPQ';...
              'STUVWXYZABCDEFGHIJKLMNOPQR';...
              'TUVWXYZABCDEFGHIJKLMNOPQRS';...
              'UVWXYZABCDEFGHIJKLMNOPQRST';...
              'VWXYZABCDEFGHIJKLMNOPQRSTU';...
              'WXYZABCDEFGHIJKLMNOPQRSTUV';...
              'XYZABCDEFGHIJKLMNOPQRSTUVW';...
              'YZABCDEFGHIJKLMNOPQRSTUVWX';...
              'ZABCDEFGHIJKLMNOPQRSTUVWXY'];
          
    alphaNum = upper('abcdefghijklmnopqrstuvwxyz');

    
    %Initialize the word and the key
    word = upper(word);
    word = regexprep(word,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');
    key = upper(key);
    key = regexprep(key,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');

    %repeat the key to match the length of the word
    newKey = '';
    for i = 1:length(word)
        newKey(i) = key(mod(i-1,length(key))+1);
    end
    
    %Make the letters a numerical value from 1-26 to use as a column number
    %for the cipher
    wordToNum = lettToNum(word);
    
    %Lets generate some encryption/decryption!
    if (spaces)
        charArray = '';     %initialize charArray as a character array
        countSpaces = 0;    %initialize countSpaces to 0
        for i = 1:length(wordToNum)
            if ((mod(i-1,5)+1 == 1) && (i > 1))     %for every fifth letter, put a space there
                charArray(i + countSpaces) = ' ';   %add the space
                countSpaces = countSpaces + 1;      %increment countSpaces by one
            end

            for j = 1:26                            %26 letters in the alphabet
                if (cipher(j,wordToNum(i)) == newKey(i))    %search through the column defined by the letter position of wordToNum(i)
                    charArray(i + countSpaces) = cipher(j,1);       %set the next letter as the letter that is on the alphabet. Using the fact that row 1 col 1 is a and row 1 col 26 is z. Simplifying code
                end
            end

        end
    else
        %Everything is the same here except for counting spaces so look
        %above
        charArray = '';
        for i = 1:length(wordToNum)
            for j = 1:26
                if (cipher(j,wordToNum(i)) == newKey(i))
                    charArray(i) = cipher(j,1);
                end
            end
        end
    end
    % charArray = [wordToNum, 0 0 0 0 , keyToNum];



    function wordToNum = lettToNum(word)
    %Make word a string of numbers. a -> 1, z -> 26
        
        wordToNum = zeros(1,length(word));      %Initialize wordToNum for efficiency
        
        for i = 1:length(word)                  %For how big the word is
            for j = 1:26                        %For how big the alphabet is
                if ( word(i) == alphaNum(j) )   %if the letter is == to the a letter in alphaNum
                    wordToNum(i) = j;           %set it to that value. line 35 is alphaNum
                end
            end
        end
    end

end
