function charArray = portaCrypt(word,key,space)
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
    if (space)
        charArray = '';
        countSpaces = 0;
        for i = 1:length(wordToNum)
            if (mod(i,6) == 0)
                charArray(i + countSpaces) = ' ';
                countSpaces = countSpaces + 1;
            end
            
            charArray(i + countSpaces) = cipher(cipherKey(i),wordToNum(i));
        end
    else
        charArray = '';
        for i = 1:length(wordToNum)
            charArray(i) = cipher(cipherKey(i),wordToNum(i));
        end
    end
    
    function wordToNum = lettToNum(word)
        %Make word a string of numbers. a -> 1, z ->26
        alphaNum = 'abcdefghijklmnopqrstuvwxyz';
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