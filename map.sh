declare -A map=(["100"]="1" ["200"]="2")


#输出所有key
echo ${!map[@]}

#输出所有value
echo ${map[@]}  

#添加值
map["300"]=3

echo 输出key对应的值
echo ${map["100"]} 


#遍历map
for key in ${!map[@]}  
do  
   echo ${map[$key]}  
done  


