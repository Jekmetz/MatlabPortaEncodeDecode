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

    word = upper(word);
    word = regexprep(word,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');
    key = upper(key);
    key = regexprep(key,'[ ~!@#$%^&*()_\+\-\=`1234567890{}\[\]\\|:;"''<,>.?\/]','');


    newKey = '';
    for i = 1:length(word)
        newKey(i) = key(mod(i-1,length(key))+1);
    end

    wordToNum = lettToNum(word);

    if (spaces)
        charArray = '';
        countSpaces = 0;
        for i = 1:length(wordToNum)
            if (mod(i-1,5)+1 == 1)
                charArray(i + countSpaces) = ' ';
                countSpaces = countSpaces + 1;
            end

            for j = 1:26
                if (cipher(j,wordToNum(i)) == newKey(i))
                    charArray(i + countSpaces) = cipher(j,1);
                end
            end

        end
    else
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
        %Make word a string of numbers
        wordToNum = zeros(1,length(word));
        
        for i = 1:length(word)
            for j = 1:26
                if ( word(i) == alphaNum(j) )
                    wordToNum(i) = j;
                end
            end
        end
    end

    function lett = numToLett(num)
        lett = alphaNum(num);
    end
end
