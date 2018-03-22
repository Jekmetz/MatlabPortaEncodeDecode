function charArray = crypt(word,key)
%%This function takes a word and a key and encrypts or decrypts them. Since
%%the porta cipher uses the exact same method to encode and decode, the
%%command can be run on the encrypted word with the same key to decrypt it.

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
    
    %Make the key a repeated thing      
    newKey = [''];
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
    charArrayNumVector = [''];
    for i = 1:length(wordToNum)
        charArrayNumVector(i) = cipher(cipherKey(i),wordToNum(i));
    end
    
    
    
    charArray = charArrayNumVector;
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    function wordToNum = lettToNum(word)
        %Make word a string of numbers
        alphaNum = ['abcdefghijklmnopqrstuvwxyz'];
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