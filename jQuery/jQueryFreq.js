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
