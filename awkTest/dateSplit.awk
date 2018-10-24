BEGIN {
	Result = "dateSplit.dat"
     #	FS = "[\t:]+"   #书中例子是tab分隔，实际列子是空格分隔
     	FS = "[ :]+"
     	"date" | getline
     	print "Today is ", "|"  $1, "|",  $2, "|"  $3 > Result     
	close(Result)
}

{
	printf("aaaa\n")
}

END{
	close(Result)

	printf("\n  abc  ") >> Result	
}

