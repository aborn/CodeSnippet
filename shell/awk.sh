# awk 打印从第三列开始到最后一列的数据
awk '{$1=$2=""; print $0}' bugtrace.txt >> bugfilter.txt
