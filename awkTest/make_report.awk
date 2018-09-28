BEGIN {
	FS="\n"
	RS=""
#	split("1. 2. 3. 4. 5. 6. 7. 8. 9.", C_Number, " ")
	split("一. 二. 三. 四. 五. 六.", C_Number, " ")
}
{
	printf("\n%s 报告人 ; %s \n", C_Number[NR], $1)
	for(i=2; i<=NF; i++)
		printf("	%d. %s\n", i-1, $i)

}
