#!/bin/bash
# conv utf-8(linux) encoding file to gbk (windows)

filenames=$(ls *.m)
cpath=`pwd`
echo "current working path=${cpath}"

for file in ${filenames}
do
    echo ${file}
    iconv -f UTF-8 -t GBK ${file} -o "${file}.out" >>/dev/null
    if [ $? -eq 0 ];then
        mv "${file}.out" ${file}
    else
        echo "conv failed in file ${file}" 
        exit -1
    fi
done

echo "conv all files to encoding gbk success."
