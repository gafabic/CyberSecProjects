# Accepts a string and outputs a caeser decryption

uppers = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
#lowers = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

#get input string
ciphertext = input('Provide cipher text sample:').upper()

#output a permutation of the string run through every rotation value
for rot in range(1,26):
	out = ''
	for char in ciphertext:
		if char in uppers:
			#add rot to index of character in alphabet, looping from beginning if needed
			i = uppers.index(char)
			i = i - rot
			if i < 0:
				i = i + 25
			out = out + uppers[i]
	print("For ROT" + str(rot) + " you output:\t" + str(out))