#!/bin/bash
###################################################
# NAME
#    send-weather.sh
#       send weather information to weibo
# 
# AUTHOR
#    Aborn Jiang (aborn.jiang@foxmail.com)
# 
# VERSION
#    v1.0  2014-03-23
##################################################

ABSPATH=$(cd $(dirname $0);pwd)
cd ${ABSPATH}
echo ${ABSPATH}

htmlName="101020100.shtml"
source ~/.proxy            # proxy setting 
TIMESTAMP="`date +"%Y/%m/%d %H:%M:%S"`" 
[ -f ${htmlName} ] && rm ${htmlName}

function msg-info()
{
    if [ $1 == "geterror" ];then
        echo "error in getting weather information."
        echo "please check your squid proxy and network."
        exit 1
    elif [ $1 == "proxyerror" ];then
        echo "the proxy setting error";
        exit 1
    elif [ $1 == "formaterror" ];then
        echo "format information error"
        exit 1
    fi
    echo "Time:${TIMESTAMP}";
}

function get-content()
{
    [ -f ${htmlName} ] && rm -f ${htmlName}
    wget  http://www.weather.com.cn/weather/101020100.shtml
    sleep 2
    if [ ! -f ${htmlName} ];then
        msg-info "geterror"
    fi
    file -bi 101020100.shtml |grep utf-8 >/dev/null
    if [ $? -eq 0 ];then 
        echo "file ${htmlName} encoding is utf-8"
    else
        echo "file ${htmlName} encoding is not utf-8, we will convert it"
        ${ABSPATH}/gbk2utf8.sh ${htmlName}
    fi

}

function judge-legal()
{
    cat ${htmlName} |egrep "上网用户登录" > /dev/null
    if [ $? -eq 0 ];then
        msg-info "proxyerror"
    fi
}

function content-format()
{
    cW=`cat ${htmlName} |egrep "上海天气预报" |egrep "^<title>" |awk -F "<" '{print $2}'|awk -F ":" '{print $2}'`
    cWa=`echo $cW |awk -F "&" '{print $1}'`
    cWb=`echo $cW |awk -F ";" '{print $2}'`
    echo $cW |egrep "&" > /dev/null
    if [ $? -eq 0 ];then
        currentWeather="$cWa $cWb";
    else
        currentWeather="$cW"
    fi
    echo $currentWeather
    no=$(echo ${currentWeather} |wc -w)

    WEIBOHOME="/home/pi/code/auto-send-weibo"
}

function send-weibo()
{
    if [ ${no} -ne 0 ];then
	    echo "上海当前天气预报:${currentWeather} ." > ${WEIBOHOME}/weibo/weibo.cont
	    echo "SendTime:${TIMESTAMP}" >> ${WEIBOHOME}/weibo/weibo.cont
        echo "[AutoSend by WeiboBot -version 1.0]" >> ${WEIBOHOME}/weibo/weibo.cont
#	echo "---automatically sent from my Raspberry Pi." >> ${WEIBOHOME}/weibo/weibo.cont
	${WEIBOHOME}/auto-send.sh -f
	    echo "SuccessSendTime:${TIMESTAMP}"
    else
        msg-info "formaterror"
    fi
    echo "------------------------------------"
}

function __main__()
{
    get-content
    judge-legal
    content-format
    send-weibo
}

__main__