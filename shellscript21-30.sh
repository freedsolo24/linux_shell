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

function shell22() {
declare -A map

# 以冒号为分隔符, 放到map里. 多个相同的key, value以空格分隔
while IFS=':' read -r -a line || [[ -n ${line[*]} ]];do
# 将值存入字典 "111": "13443 13643"
    map[${line[0]}]="${map[${line[0]}]} ${line[1]} "
done < ./newcoder_22.txt

# 将字典 key 排序后输出
for key in $(echo "${!map[@]}" | sort -n);do
    echo "[${key}]"
    for value in ${map[${key}]};do
        echo "${value}"
    done
done






}

echo -e "\033[31;42mshell21 格式化输出\033[0m"
shell21
echo -e "\033[31;42mshell22 处理文本\033[0m"
shell22