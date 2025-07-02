#!/bin/bash

function shell01() {
declare -i LINE=0
while read -r p || [[ -n ${p} ]];do
  LINE=$((LINE+1))
done < newcoder.txt
echo "本文件的行数=$LINE"
}

function shell02() {
  declare -i ROW=0
  while read -r p|| [[ -n ${p} ]];do
    ROW=$((ROW+1))
  done < newcoder.txt
  while read -r LINE ;do
    if [[ ${ROW} -le 5 && ${ROW} -ge 1 ]];then
      echo "${LINE}"
    fi
    ROW=$((ROW-1))
  done < newcoder.txt
}

function shell03() {
 for i in $(seq 0 500);do
   if [[ $((i%7)) -eq 0  ]];then
       echo -e -n "${i}\t"
     fi
   done
   echo
 }

function shell04() {
  declare i=1

  while read -r line|| [[ -n ${line} ]];do 
    if [[ ${i} == 5 ]];then 
      echo "第5行: ${line}"
    fi
    i=$((i+1))
  done < newcoder.txt

}

function shell05() {
declare -i LINENUM
LINENUM=1
while read -r line|| [[ -n ${line} ]];do 
  if [ -z "${line}" ];then 
    echo "空行的行号是: ${LINENUM}"
    ((LINENUM=LINENUM+1))
  else 
    LINENUM=$((LINENUM+1))
  fi

done < newcoder.txt

}

function shell06() {
  
  while read -r LINE|| [[ -n ${LINE} ]];do
    if [[ "${LINE}" =~ ^$ ]];then    # 左侧必须有双引号，因为是字符串
      continue
    else 
      echo "${LINE}"
    fi
  done < newcoder.txt

}

function shell07() {
  while read -r LINE || [[ -n ${LINE} ]];do
    for i in $(echo LINE | tr ' ' '\n');do
      if [[ $(echo i | wc -L) -lt 8 ]];then 
        echo "${i}"
      fi
    done
    
  done < newcoder.txt
}

function shell08() {

  TOTAL=0

   ITEMS=$(awk '{print $6}' ./mem.txt)

   for i in ${ITEMS};do
     TOTAL=$((i+TOTAL))
   done

   echo "进程占用的总内存是: ${TOTAL}"

}

function shell09() {
  declare -A map

  # IFS=intrnal field separator,IFS=' '不会去除行首和行尾的空格,明确把整行赋值给LINE变量
  # 如果一行有多个连续空格, IFS=''可以完整保留
  # -r=raw  对反斜杠, 不做转义,直接读取, 例如\\Username, 直接输出\\Username
  # -a=array, 把每一行读到array变量, LINE变量是数组
  while read -r -a LINE|| [[ -n ${LINE[*]} ]];do
    for WORD in "${LINE[@]}";do
    # map[${WORD}]没有初始化,所以不能用 ${map[${WORD}]}
 
        map[${WORD}]=$(( map[${WORD}] + 1 ))

    done
  done < ./newcoder_9.txt

      # echo ${map[nowcoder]}

   # 遍历map中的每一个下标
    for KEY in "${!map[@]}";do

         echo -e "The word of \033[31m\"${KEY}\"\033[0m have \033[31m${map[${KEY}]}\033[0m "
          # echo "${KEY}"
    done
}

function shell10() {
  declare -A map

  while IFS=' ' read -r -a LINE|| [[ -n ${LINE[*]} ]];do

    map[${LINE[1]}]=$((map[${LINE[1]}] + 1))

  done < ./newcoder_10.txt
  
  for KEY in "${!map[@]}";do
    if [[ ${map[${KEY}]} -ge 2 ]];then
       echo -e "第二列有重复的是: ${KEY}, 重复: ${map[${KEY}]}次"
    fi
  done
}




echo -e "\033[31;42mshell01 打印文本文件的行数\033[0m"
shell01
echo -e "\033[31;42mshell02 打印最后5行\033[0m"
shell02
echo -e "\033[31;42mshell03 打印0~500是7的倍数\033[0m"
shell03
echo -e "\033[31;42mshell04 打印第5行\033[0m"
shell04
echo -e "\033[31;42mshell05 打印空行的行号\033[0m"
shell05
echo -e "\033[31;42mshell06 删除空行\033[0m"
shell06
echo -e "\033[31;42mshell07 打印小于8个字母的单词\033[0m"
shell07
echo -e "\033[31;42mshell08 打印文本中的进程占用内存比\033[0m"
shell08
echo -e "\033[31;42mshell09 统计每个单词出现的个数\033[0m"
shell09
echo -e "\033[31;42mshell10 统计第二列是否重复\033[0m"
shell10
