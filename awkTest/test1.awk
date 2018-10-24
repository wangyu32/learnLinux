BEGIN {
	number = ARGC
	ARGC = 2
	for( i=2; i<number ; i++)
		data[i] = ARGV[i]



	for( i=0; i< length( data); i++)
		print data[i]
}	
	
