function charArray = crypt(word,key,spaces)
	whichCipher = input('What kind of cipher would you like to use?\n(Please type ''porta'',''beaufort'',''auto'', We will put the rest here: ','s');
	
	stay = 1;
	while(stay)
		switch(whichCipher)
		case 'porta'
			%do Stuff
			stay = 0;

		case 'beaufort'
			%do Stuff
			stay = 0;

		case 'auto'
			%do Stuff
			stay = 0;

		otherwise
			whichCipher = input('Please input a valid cipher. (''porta'', ''beaufort'', ''auto'', The rest needs to go here: ','s');
			
		end
	end

end
