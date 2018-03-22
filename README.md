This matlab program encodes and decodes strings using the porta cipher

It works like:

encryptedString = crypt('StringYouWantToConvert','KeyYouWantToUse',<1 or 0 if you would like it to be split into groups of 5 or not>)

syntax:
crypt(word,key,space)

word = the string you would like to convert
key = the key you want to use
space = 1 for splitting the string up into readable chunks, 0 for keeping it as one string
