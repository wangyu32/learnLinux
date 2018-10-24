awk '
 BEGIN {
 	"date" | getline
	Result = "date_split.txt"
	print $1 > Result
	print $2 >> Result
	print $3 >> Result
	close(Result)
 }

 {
	printf("a")
 }

 # END {
 #	close(Result)
 # }

' $*
