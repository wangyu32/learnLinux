awk '
BEGIN {
	while( getline <ARGV[1] ){
		English[++n] = $1 
		Chinese[n] = $2
	}
	ARGV[1] = "-"
	srand() 
	question( )
}
{
	if( $1 != English[ind] )
		print "Try again!"
	else{
		print "nnYou are right !! Press Enter to Continue | "
		getline
		question( )
	}
}
function question(){
	ind = int(rand( )* n) + 1 
	system("clear")
	print " Press n"ctrl-d n" to exit"
	printf("nn%s ", Chinese[ind] "的英文是:")
}
' $*


