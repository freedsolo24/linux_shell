#!"C:\Program Files\Git\bin\bash.exe"

function readLine {
declare -i LINE=0
while read p;do
  LINE=$(($LINE+1))
done < 'c:\Users\WXR\projects\linux_shell\newcoder.txt'
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
  done < 'c:\Users\WXR\projects\linux_shell\newcoder.txt'
}

# #function div7 {
# #  for i in $seq(0 500);do
# #    if [[ $((${i}%7)) -eq 0  ]];then
#       echo -e -n "${i}\t"
#     fi
#   done
#   echo
# }

function pln5 {
  declare i=1

  while read line;do 
    if [ ${i} == 5 ];then 
      echo "第5行: ${line}"
    fi
    i=$((${i}+1))
  done < 'c:\Users\WXR\projects\linux_shell\newcoder.txt'

}



readLine
last5Line
# div7
pln5