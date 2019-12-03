#!/bin/bash
awk -F '","' '$0=$10' $@|
grep -oP "https://twitter.com/([^/]*)/status"|
sed -r 's|https://twitter.com/(.*)/status|\1|g'|
sort|uniq -c|sort -rnk1|tr " " ","|sed -r "s/,{2,}//g;s/$/,/g"|
sed '1s/^/count,id,\n/'>shellgei-ranking_$(date +%Y%m%d).csv
