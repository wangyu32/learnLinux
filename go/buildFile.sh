#!/bin/bash
declare -A map=()

name="11111"
nemeE="11111"
files=""
composeFile="composeFile"
mdfiles="mdfiles"

for line in `cat sortfile.txt`
do
   index=`echo $line | cut -d '.' -f1`

   if [ "$index" != $name ]; then
      map["$name"]=$files
      name="$index"
      files="$line"
   else
      files="$files,$line"
   fi   
      map["$index"]=$files
done

echo ${!map[@]} 
echo "---------"
#echo ${map[@]} 

#遍历map
for key in ${!map[@]}
do
	value=${map[$key]}
	if [ "$value" != "$nameE" ]; then   
	fileC="$composeFile/$key.md"
	echo $fileC
	#	echo ${map[$key]}  
		OLD_IFS="$IFS"
		IFS=","
		arr=($value)
		IFS="$OLD_IFS"
		for s in ${arr[@]}
		do
			echo $mdfiles/$s
			cat $mdfiles/$s >> $fileC	
		done	
	fi
done


   




