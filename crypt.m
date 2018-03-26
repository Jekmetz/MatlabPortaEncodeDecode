function charArray = crypt(word,key,whichCipher,spaces)
%Encrypts or decrypts a word with a certain key. syntax crypt(<word to encrypt>,<any memorable string of letters>,<which cipher you want>,<1 for spaces, 0 for no spaces>)

stay = 1;
while(stay)
    switch(whichCipher)
        case 'porta'
            alphaNum = 'abcdefghijklmnopqrstuvwxyz';
            charVec = portaCrypt(word,key);
            stay = 0;
            
        case 'beaufort'
            alphaNum = upper('abcdefghijklmnopqrstuvwxyz');
            charVec = beaufortCrypt(word,key);
            stay = 0;
            
        case 'auto'
            %do Stuff
            stay = 0;
            
        otherwise
            whichCipher = input('Please input a valid cipher. (''porta'', ''beaufort'', ''auto'', The rest needs to go here: ','s');
            
    end
end

%Put spaces in the charVec if needed
if (spaces)
    charArray = '';
    countSpaces = 0;
    for i = 1:length(charVec)
        if (mod(i,5) == 0)
                charArray(i + countSpaces) = ' ';
                charArray(i + countSpaces) = charVec(i);
                countSpaces = countSpaces + 1;
        else
            charArray(i + countSpaces) = charVec(i);
        end
    end
else
    charArray = charVec;
end


%Here are all of the functions

%portaCrypt
    function charArray = portaCrypt(word,key)
        %This function takes a word, a key, and a boolean and encrypts or decrypts them. Since
        %the porta cipher uses the exact same method to encode and decode, the
        %command can be run on the encrypted word with the same key to decrypt it.
        %If you want to separate the thing into spaces, put 1, if not put 0.
        
        %Initialize the independant variables
        cipher = ['nopqrstuvwxyzabcdefghijklm';...
            'opqrstuvwxyznmabcdefghijkl';...
            'pqrstuvwxyznolmabcdefghijk';...
            'qrstuvwxyznopklmabcdefghij';...
            'rstuvwxyznopqjklmabcdefghi';...
            'stuvwxyznopqrijklmabcdefgh';...
            'tuvwxyznopqrshijklmabcdefg';...
            'uvwxyznopqrstghijklmabcdef';...
            'vwxyznopqrstufghijklmabcde';...
            'wxyznopqrstuvefghijklmabcd';...
            'xyznopqrstuvwdefghijklmabc';...
            'yznopqrstuvwxcdefghijklmab';...
            'znopqrstuvwxybcdefghijklma'];
        
        word = lower(word);
        word = regexprep(word,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');
        key = lower(key);
        key = regexprep(key,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');
        
        %Make the key a repeated thing
        newKey = '';
        for i = 1:length(word)
            newKey(i) = key(mod(i-1,length(key))+1);
        end
        
        %Convert both the word and the key to a numerical array where a -> 1 and
        %z -> 26
        wordToNum = lettToNum(word);
        keyToNum = lettToNum(newKey);
        
        %%convert the key numbers to the row number they correspond to
        cipherKey = ceil(keyToNum/2);
        
        %%lets convert some Strings!
        charArray = '';
        for i = 1:length(wordToNum)
            charArray(i) = cipher(cipherKey(i),wordToNum(i));
        end
    end

%beaufort Crypt
    function charArray = beaufortCrypt(word,key)
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

%Word to number
    function wordToNum = lettToNum(word)
        %Make word a string of numbers. a -> 1, z ->26
        wordToNum = zeros(1,length(word));
        
        for i = 1:length(word)
            for j = 1:26
                if ( word(i) == alphaNum(j) )
                    wordToNum(i) = j;
                end
            end
        end
    end


end
