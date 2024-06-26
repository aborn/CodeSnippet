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

// js 按order大小从小到大排序
dataArr.sort(function (o1, o2) {
    return o1.order - o2.order;
});

// jQuery的遍历每个array的item
$('.pluginFormDiv').each(function(index, eachItem) {
    arrResult.push($(eachItem).attr('id'));
});

// jQuery.post( url [, data ] [, success ] [, dataType ] )
$.post(url, data, callback);
$.get(url, data, callback);
// 下面是一个例子
$.post("/jsbridge/deleteJSBridge.html", {id:id},
       function(data, textStatus, jqXHR){
           if (data.status === 'success') {
               console.log("操作成功!");
               location.reload();
           } else {
               console.log(data.info);
           }
       }, "json");

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
    //async: false  // 同步的ajax
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

// select option 的操作
// 选中的值对就的desc
$( "#businessGroup option:selected" ).text();
// 选中的option
$( "#businessGroup option:selected");
if ($('#waxPatch option[value="a"]').length > 0) {
    console.log("有这个option");
}
// semantic-ui,当value为空时，手动设置显示的值
$('#waxPatch').parent().find('.text').html('请选择');

// find操作
var appName = $(form).find('input#appName').val();   // id为appName的
var groupName = $(form).find('select#businessGroup option:selected').text();
$('#appListTable').find('tr[data-id="13"]');    // find attribute equals value
$('#select-beast').parent().find('.selectize-control').css('background', 'red');

// 是否有某个class
$(this).hasClass('disabled');

// div的显示与隐藏
$('.news').css('display','none');
$('.news').hide();
$('.news').show();
$('.news').css('display','block');

// 删除一个div里的子节点
$("#foo").empty();

// js 对每个array的reduce操作 (js > 1.8版本才支持)
var sourceArr = ['a', 'b', 'c', 'd'];
var valueItems = ['a', 'b', 'c'];
sourceArr.join(',');  // array join
var needChecked = valueItems.reduce(
    function(previous, current, index, array) {
        return (previous & sourceArr.indexOf(current) >= 0);
    }, true);

//查找所有名为eachAppSource的checkbox
var checkboxs = $('input[name=eachAppSource]');

// javascript字符串的contains操作
var string = "foo",
    substring = "oo";
console.log(string.indexOf(substring) !== -1);

// 设置css样式
$('#unLockSceneDiv').css({ display: "none" });  // 隐藏
$('#unLockSceneDiv').css({display:""});         // 显示

// 通过js设置其值
$('#dropdown').dropdown("set selected", "1");
// 随机字符串p
Math.random().toString(36).substring(7);


// remove all options & add it
$('#models').empty();
$.getJSON('@Url.Action("YourUrl")',function(data){
    var dropdown=$('#models');
    dropdown.empty();
    $.each(data, function (index, item) {
        dropdown.append(
            $('<option>', {
                value: item.valueField,
                text: item.DisplayField
            }, '</option>'));
    });
});

// 绑定和解除绑定
$('.check-select-type-action').unbind();
$('.check-select-type-action').on("click", function () {});


// 原生态
var list = document.getElementsByClassName("node");
for (let item of list) {
    console.log(item.textContent);
}

// obj是否有某个属性
obj.hasOwnProperty("attr");
