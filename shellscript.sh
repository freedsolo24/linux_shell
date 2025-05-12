#!"C:\Program Files\Git\bin\bash.exe"

declare -i LINE=0

while read p
do
  LINE=$(($LINE+1))
done < 'c:\Users\WXR\projects\linux_shell\newcoder.txt'
echo "本文件的行数=$LINE"