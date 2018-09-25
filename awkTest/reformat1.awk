BEGIN {
	print "ID Number	Arrival Time" > "today_rp1"
	print "====================" > "today_rp1"
	}
	{ printf("	%s	%s\n", $1, $2) > "today_rp1" }
