#!/bin/bash

function shell21() {
declare -i len

while read -r line || [[ -n ${line} ]];do
    len=${#line}
    if [[ ${len} -le 3 && ${len} -gt 0 ]];then
        echo "${line}"
    fi
    for((j=len-3;j>0;j-=3));do
        str="${line:j}"
        line="${line:0:j},${str}"
    done
    echo "${line}"
        
done < ./newcoder_21.txt

}

echo -e "\033[31;42mshell21 格式化输出\033[0m"
shell21