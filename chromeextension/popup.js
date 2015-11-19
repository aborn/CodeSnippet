function query(key) {
    var url;
    chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, function (tabs) {
        url = tabs[0].url;
    });

    if (key == 'abc') {
        return null;
    } else {
        return 'result:' + key + url;
    }
};

document.addEventListener('DOMContentLoaded', function() {
    $('#querykey').on('input', function(){
        var searchKey = this.value;
        var searchResult = query(searchKey);
        if (searchKey != null && searchKey != '') {
            $('#queryresult').parent().css({'display' : 'block'});
            if (searchResult != undefined && searchResult != '') {
                $('#queryresult').html(searchResult);
            } else {
                $('#queryresult').html('未找到相关结果!');
            }
        } else {
            $('#queryresult').parent().css({'display' : 'none'});
            $('#queryresult').html('');
        }
    })

    var checkPageButton = document.getElementById('Browse');
    checkPageButton.addEventListener('click', function() {

        chrome.tabs.getSelected(null, function(tab) {
            d = document;
            var f = d.createElement('form');
            f.action = 'http://gtmetrix.com/analyze.html?bm';
            f.method = 'post';
            var i = d.createElement('input');
            i.type = 'hidden';
            i.name = 'url';
            i.value = tab.url;
            f.appendChild(i);
            d.body.appendChild(f);
            f.submit();
        });
    }, false);
}, false);