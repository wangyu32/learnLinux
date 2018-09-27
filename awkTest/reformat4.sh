awk '
BEGIN {
	Sys_Sort = "sort -n >> today_rp4"
	Result = "today_rp4"
#	FS = "[\t:]+"   #书中例子是tab分隔，实际列子是空格分隔
	FS = "[ :]+"
	"date" | getline
	print "Today is ", "|"  $1, "|",  $2, "|"  $3 > Result  # 测试date格式
	print "=====================" > Result
  	print "ID Number Arrival Time" > Result
	close (Result)
#	late_file = $2 "late.dat"
	late_file = $2"late.dat"
	while(getline < late_file > 0 ){
	       	cnt[$1] = $2
	}
	close(late_file)	
{
	arrival = HM_to_M($2, $3)
	if(arrival > 480){
		mark = "*"
		cnt[$1] ++ 	
	} else {
		mark = " "
	}

	message = cnt[$1] ? cnt[$1] "times" : ""

	printf ("%s %2d:%2d %5s %s\n", $1, $2, $3, mark, message) | Sys_sort
	total += arrival
}

END{
	close(Result)
	close(Sys_sort)
	printf(" Average arrivel time: %d:%d\n", total/NR/60, (total/NR)%60 ) >> Result
	for(any in cnt){
		print any, cnt[any] > late_file
	}
	
}


function HM_to_M(hour, min){
	return hour*60 + min
}
' $*



