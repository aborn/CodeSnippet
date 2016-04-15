/**
 * jQuery常用的一些操作
 */
// 从当前myId找最近为table的parent
$('#myId').closest('table');

// 是否选中 jQuery 1.6及以上版本
$('#checkBox').prop('checked');       // true
$('#checkBox').prop('checked', true); // 设置为true

// jQuery 1.5及以下版本
$('#checkBox').attr('checked');
$('#checkBox').attr('checked', 'checked');

// 将内容插入到一个容器里，放到容器的元素最后面
$('#dynamicPlugArea').append("<div class='ui button'>ddd</div>");
// 将内容插入到一个容器里，放到容器所有元素的最前面
$('#dynamicPlugArea').prepend(get_content_container(timeStamp, elements.get_plugin_cn_name(plugName) || ''));

var dataArr = ["a", "b", "c"];
dataArr.unshift("d");   // 插入js数组最前面,dataArr.shift()删除数组最前面元素
dataArr.push("d");      // 插入js数组最后面,dataArr.pop()删除数组最后一个元素

// unshift/push - add an element to the beginning/end of an array
// shift/pop - remove and return the first/last element of and array

$('#formid').serializeArray();

String.fromCharCode("a".charCodeAt(0) + 1); // 下一个字符 => 得到"b"
var obj = [];

if (Array.isArray(obj)){  // 判断obj是否为数组
    console.log("obj is array.");
}

// js array的map，返回array
dataArr.map(function(item, index) {
    console.log('good');
});

// 返回的是一个新的array
dataArr.filter(function(item){
    return true;
});
// js array的forEach遍历数组
dataArr.forEach(function(eachItem){
    console.log('eachItem=' + eachItem);
});

// jQuery的遍历每个array的item
$('.pluginFormDiv').each(function(index, eachItem) {
    arrResult.push($(eachItem).attr('id'));
});

$.post(url, data, callback);
$.get(url, data, callback);

$.ajax({
    url : '/eleconfig/appconfig/' + tabName + "FormSubmit.gson",
    type: "POST",
    data: $('#' + tabName + "Form").serialize(),//$(this).serialize(),
    dataType: 'json',
    success: function (data) {
        console.log("status:" + data.status + " info:" + data.info);
        if (data.status == 'success') {
            displaySuccMsg("提交成功:" + data.info);
        } else {
            displayErrorMsg("提交失败:" + data.info);
        }
    },
    error: function (jXHR, textStatus, errorThrown) {
        alert(errorThrown);
    }
});

location.reload(); //  刷新页面
location.reload(true);

// 跳转链接
window.location.href = "/configtester/listGroups.html";

// form data
function convertFormDataArray2Obj(formDataArray) {
    var formObj = {};
    formDataArray.forEach(function(eachItem, index){
        if (formObj[eachItem.name] !== undefined) {
            formObj[eachItem.name] = formObj[eachItem.name] + ',' + eachItem.value;
        } else {
            formObj[eachItem.name] = eachItem.value || '';
        }
    });
    return formObj;
}

// 页面加载完成事件
$(document).ready(function(){
    console.log('document ready!.');
});

// 通过动画移动到锚点
// http://stackoverflow.com/questions/1586341/how-can-i-scroll-to-a-specific-location-on-the-page-using-jquery
var divPosition = $('#divId').offset();
$('html, body').animate({scrollTop: divPosition.top}, "slow");

// html方法
document.getElementById("here").scrollIntoView();

// freemarker原样输出
// ${r"${pageName}"}

// 选择的值
var checkValues = $('input[name=eachAppSource]:checked').map(function(){
    return $(this).val();
}).get();

// 将,全局替换成&
"a,b,c".replace(/,/g, "&");
