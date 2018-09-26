awk '
 BEGIN {
#	FS = "[\t:]+"   #书中例子是tab分隔，实际列子是空格分隔
	FS = "[ :]+"
	"date" | getline
	print "Today is ", "|"  $1, "|",  $2, "|"  $3 > "today_rp3"  # 测试date格式
	print "=====================" > "today_rp3"
  	print "ID Number Arrival Time" > "today_rp3"
	close ("today_rp3")
 }
 {
	arrival = HM_to_M($2, $3)
#	printf(" %s %s:%s %s\n", $1, $2, $3, arrival>480?"*":" ") | "sort -t '\'' '\'' -k 1n >> today_rp3"
	printf(" %s %s:%s %s %s %d\n", $1, $2, $3, arrival>480?"*":" ", arrival, NR) | "sort -t '\'' '\'' -k 1n >> today_rp3"
	total += arrival
 }

 END {
	close("today_rp3")
	close("sort -t '\'' '\'' -k 1n >> today_rp3")
	printf(" Average arrivel time: %d:%d\n", total/NR/60, (total/NR)%60 ) >> "today_rp3"
 }

 function HM_to_M(hour, min){
	return hour*60 + min
 }
' $*

