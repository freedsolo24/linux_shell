#!/bin/bash

function shell11 {

declare -a arr1
declare -a arr2

while IFS=' ' read -r -a arr || [[ -n ${arr[*]} ]];do

  arr1[${#arr1[@]}]=${arr[0]}         # ${#arr1[@]} 等价于 len(arr1)
  arr2[${#arr2[@]}]=${arr[1]}
done < ./newcoder_11.txt

  echo "${arr1[*]}"
  echo "${arr2[*]}"

}

function shell12 {

  LINENUM=1
  declare -a array

  while read LINE || [[ -n ${line} ]];do
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

function shell13 {

declare -i has_this
declare -a words

# IFS=' '       意思是让空格成为每行单词的分隔符
# read -a line  把line变量变成数组, 变为数组后不会保留整行内容, line此时是数组不是字符串

while IFS=' ' read -r -a line || [[ -n ${line[*]} ]]; do
  has_this=0
  #words=(${line})

# 
  for word in ${line[@]}; do
    if [[ "${word}" == "this" ]]; then
      has_this=1
      break
    fi
  done

  if [[ ${has_this} -eq 0 ]]; then
  # 现在${line}是数组不是字符串, 如果打印${line}, 实际输出的是$line[0], 也就是数组的第一个单词
  # 所以要打印${line[*]}
    echo "${line[*]}"
  fi
done < ./newcoder_13.txt

}

function shell14 {
# row定义有几行
row=0
# num定义有几个数字
num=0
# sum定义除第一行后的和
sum=0

  while read line || [[ -n ${line} ]];do
  # row=1, 说明现在是第一行, 赋值给num
    if [[ row -eq 0 ]];then 
      num=${line} 
    else
      sum=$((${sum}+${line}))
    fi
      ((row++))
  done < ./newcoder_14.txt

  echo "scale=3;${sum}/${num}" | bc
  echo "row: ${row}"


}

function shell15() {

declare -a words

    while IFS='' read line || [[ -n ${line} ]];do
      words=(${line})

      for word in ${words[@]};do
         
         if [[ ${word} =~ ^.*[Bb].*$ ]];then
           continue
         else
           echo "${word}"
         fi
      done

    done < ./newcoder_15.txt

}

function shell16() {
   
   while read p || [[ -n ${p} ]];do
     if [[ ${p} =~ ^(0|[1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.(0|[1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.(0|[1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.(0|[1-9][0-9]?|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]];then
        echo "yes"
     else 
        echo "no"
     fi


   done<./newcoder_16.txt


}

echo -e "\033[31;42m统计转置内容\033[0m"
shell11
echo -e "\033[31;42m每一行出现的1~5数字的个数\033[0m"
shell12
echo -e "\033[31;42m不输出含有this的语句输出\033[0m"
shell13
echo -e "\033[31;42m求平均值\033[0m"
shell14
echo -e "\033[31;42m去掉不需要的单词\033[0m"
shell15
echo -e "\033[31;42m判断输入是否为ip地址\033[0m"
shell16