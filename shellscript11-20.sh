#!/bin/bash

function shell11 {

declare -a arr1
declare -a arr2

while IFS=' ' read -r -a arr;do

  arr1[${#arr1[@]}]=${arr[0]}         # ${#arr1[@]} 等价于 len(arr1)
  arr2[${#arr2[@]}]=${arr[1]}
done < ./newcoder_11.txt

  echo "${arr1[*]}"
  echo "${arr2[*]}"

}

function shell12 {

  LINENUM=1
  declare -a array

  while read LINE;do
    len=$(echo "${LINE}" | wc -L)

    for ((i=0;i<${len};i++));do
       if [[ ${LINE:${i}:1} =~ [1-5] ]];then
            map[${LINENUM}]=$((map[${LINENUM}]+1))
       fi
    done

    LINENUM=$((${LINENUM}+1))


  done < newcoder_12.txt

  sum=0

  for l in ${!map[@]};do
     echo "line${l} number: ${map[${l}]}"
     sum=$((${sum}+${map[${l}]}))
  done
  
  echo "sum is ${sum}"
  

}

echo -e "\033[31;42m统计转置内容\033[0m"
shell11
echo -e "\033[31;42m每一行出现的1~5数字的个数\033[0m"
shell12
