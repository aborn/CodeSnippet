// semantic-ui 常用设置

// 下拉列表设置值,设置值为2
$('#eleType').dropdown("set selected", 2);

// dropdown的change事件
$('.valueType-dropdown').on('change', function () {
    var value = $(this).dropdown('get item').attr('value');
    $('#valueType').val(value);
    console.log($('#valueType').val());
});
