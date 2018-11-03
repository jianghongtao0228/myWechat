$(document).ready(function(){
    //输入时移除error图片
    $('.username, .password').keyup(function () {
        $('.error').fadeOut('fast');
        hideErrorTip();
    });

    $("#login").on("click",function(){
        var username = $('.username').val();
        var password = $('.password').val();
        if(username == '') {
            $('.error').fadeOut('fast', function(){
                $('.error').css('top', '27px');
            });
            $('.error').fadeIn('fast', function(){
                $('.username').focus();
                showErrorTip("用户名不能为空");
            });
            return false;
        }
        if (password == '') {
            $('.error').fadeOut('fast', function () {
                $('.error').css('top', '96px');
            });
            $('.error').fadeIn('fast', function () {
                $('.password').focus();
                showErrorTip("密码不能为空");
            });
            return false;
        }
    });
});

/**
 * 展示提示
 * @param msg
 */
function showErrorTip(msg){
    $(".msg").html(msg).show();
}

/**
 * 隐藏提示
 */
function hideErrorTip(){
    $(".msg").html("").hide();
}