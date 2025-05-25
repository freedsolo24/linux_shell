#!/bin/bash

function readLine {
declare -i LINE=0
while read p;do
  LINE=$(($LINE+1))
done < newcoder.txt
echo "本文件的行数=$LINE"
}

function last5Line {
  declare -i ROW=0
  while read p;do
    ROW=$((${ROW}+1))
  done < 'c:\Users\WXR\projects\linux_shell\newcoder.txt'
  while read LINE ;do
    if [ ${ROW} -le 5 -a ${ROW} -ge 1 ];then
      echo ${LINE}
    fi
    ROW=$((${ROW}-1))
  done < newcoder.txt
}

function div7 {
 for i in $seq(0 500);do
   if [[ $((${i}%7)) -eq 0  ]];then
       echo -e -n "${i}\t"
     fi
   done
   echo
 }

function pln5 {
  declare i=1

  while read line;do 
    if [ ${i} == 5 ];then 
      echo "第5行: ${line}"
    fi
    i=$((${i}+1))
  done < newcoder.txt

}

function plnnulllinenum {
declare -i LINENUM
LINENUM=1
while read line;do 
  if [ -z "${line}" ];then 
    echo "空行的行号是: ${LINENUM}"
    let LINENUM=${LINENUM}+1
  else 
    LINENUM=$((${LINENUM}+1))
  fi

done < newcoder.txt

}

function delnullline {
  
  while read LINE;do
    if [[ "${LINE}" =~ ^$ ]];then    # 左侧必须有双引号，因为是字符串
      continue
    else 
      echo "${LINE}"
    fi
  done < newcoder.txt

}

function plnlt8 {
  while read LINE;do
    for I in $(echo ${LINE} | tr ' ' '\n');do
      if [[ $(echo ${I} | wc -L) -lt 8 ]];then 
        echo ${I}
      fi
    done
    
  done < newcoder.txt
}


echo -e "\033[31m打印文本文件的行数\033[0m"
readLine
echo -e "\033[31m打印最后5行\033[0m"
last5Line
echo -e "\033[31m打印0~500是7的倍数\033[0m"
# div7
echo -e "\033[31m打印第5行\033[0m"
pln5
echo -e "\033[31m打印空行的行号\033[0m"
plnnulllinenum
echo -e "\033[31m删除空行\033[0m"
delnullline
echo -e "\033[31m打印小于8个字母的单词\033[0m"
plnlt8
