#!/bin/bash

trans_res=/tmp/res
tidy=/tmp/tidy

word=`xsel -b |sed -n "1,1p"`
$HOME/trans_tools/trans.sh en:zh-CN "$word" 2>/dev/null  |cat -n > ${trans_res}
locate_line=`grep -e "English" ${trans_res} | awk -F " " '{print $1}'`
line=$(($locate_line-4))
sed -n "${line},${line}p" ${trans_res}  |awk -F " " '{print $2}' >${tidy}

really_token=`tail -c +5 ${tidy} | head -c -6`
notify-send --icon=info `echo $really_token`
