/**
 * jQuery常用的一些操作
 */

// 从当前myId找最近为table的parent
$('#myId').closest('table');

// 是否选中 jQuery 1.6
$('#checkMeOut').prop('checked'); // true

$('#checkBox').prop('checked', true); // 设置为true

// 将内容插入到一个容器里，放到容器的元素最后面
$('#dynamicPlugArea').append("<div class='ui button'>ddd</div>")
// 将内容插入到一个容器里，放到容器所有元素的最前面
$('#dynamicPlugArea').prepend(get_content_container(timeStamp, elements.get_plugin_cn_name(plugName) || ''));

var dataArr = ["a", "b", "c"]
dataArr.unshift("d");   // 插入js数组最前面
dataArr.push("d");      // 插入js数组最后面

// unshift/push - add an element to the beginning/end of an array
// shift/pop - remove and return the first/last element of and array

$('#formid').serializeArray()

dataArr.map(function(item, index)   // js array的map，返回array
// jQuery的遍历每个array的item
$('.pluginFormDiv').each(function(index, eachItem) {
                arrResult.push($(eachItem).attr('id'));
});

$.post(url, data, callback)
location.reload() // 刷新页面            
