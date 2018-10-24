BEGIN {
	"date" | getline # shell执行date, getline取得显示结果并以$0记录
	print "Today is ", $2, $3 > "today_rp2"
	print "================" > "today_rp2"
	print "ID Number Arrival Time" > "today_rp2"
	close ("today_rp2")
	}
	{printf( "%s %s\n", $1, $2) | "sort -t ' ' -k 2 -n >> today_rp2"  } 


