
$(function () {
    function display(bool) {
        if (bool) {
            $("#menu").show();
        } else {
            $("#menu").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.querySelectorAll('a').forEach(element => {
        element.addEventListener('click', e => {
          e.preventDefault()
        
        window.invokeNative('openUrl', e.target.href)
      })
    })
    document.querySelectorAll('a').forEach(element => {
        element.addEventListener('click', e => {
          e.preventDefault()
        
        window.invokeNative('openUrl', e.target.href)
      })
    })

    document.onkeyup = function (data) {
        if (data.which == 27 || data.which == 80) {
            $.post('https://zPause/resume', JSON.stringify({}));
            return
        }
    }

    $("#resume").click(function () {
        $.post('https://zPause/resume', JSON.stringify({}));
        return
    })
    $("#map").click(function () {
        $.post('https://zPause/map', JSON.stringify({}));
        return
    })
    $("#settings").click(function () {
        $.post('https://zPause/settings', JSON.stringify({}));
        return
    })
    $("#quit").click(function () {
        $.post('https://zPause/quit', JSON.stringify({}));
        return
    })

})