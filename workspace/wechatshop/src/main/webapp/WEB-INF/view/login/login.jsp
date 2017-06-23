<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/common/com.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录 - 中大眼科</title>
    <link rel="stylesheet" type="text/css" href="/js/login/style/register-login.css">
</head>

<body>
<div id="box"><canvas class="particles-js-canvas-el" width="1583" height="318" style="width: 100%; height: 100%;"></canvas></div>
<div class="cent-box">
    <div class="cent-box-header">
        <h1 class="main-title hide">微商城</h1>
        <h2 class="sub-title">我为人人 - 人人为我</h2>
    </div>

    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="/login/login" class="active">登录</a>
                <a href="/login/register">注册</a>
                <div class="slide-bar"></div>
            </div>
        </div>

        <div class="login form">
            <div class="group">
                <div class="group-ipt email">
                    <input type="text" name="email" id="email" class="ipt" placeholder="邮箱地址" required="">
                </div>
                <div class="group-ipt password">
                    <input type="password" name="password" id="password" class="ipt" placeholder="输入您的登录密码" required="">
                </div>
                <div class="group-ipt verify">
                    <input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required="">
                    <img src="https://console.heweather.com/verify?w=110&h=35&l=4&t=_1498236608585" class="imgcode">
                </div>
            </div>
        </div>

        <div class="button">
            <button type="submit" class="login-btn register-btn" id="button">登录</button>
        </div>

        <div class="remember clearfix">
            <label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked="">记住我</label>
            <label class="forgot-password">
                <a href="#">忘记密码？</a>
            </label>
        </div>
    </div>
</div>

<div class="footer">
    <p>微商城 - V1.0</p>
    <p>Designed By ZSX &amp;
        <a href="#" >联系我</a> 2017
    </p>
</div>

<script src="/js/login/js/particles.js" type="text/javascript"></script>
<script src="/js/login/js/background.js" type="text/javascript"></script>
<script src="/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/js/layer/layer.js" type="text/javascript"></script>
<script src="/js/login/js/index.js" type="text/javascript"></script>
<script>
    $('.imgcode').hover(function() {
        layer.tips("看不清？点击更换", '.verify', {
            time: 6000,
            tips: [2, "#3c3c3c"]
        })
    }, function() {
        layer.closeAll('tips');
    }).click(function() {
        //				$(this).attr('src', 'http://zrong.me/home/index/imgcode?id=' + Math.random());
        $(this).attr('src', 'https://console.heweather.com/verify?w=110&h=35&l=4&t=_' + new Date().getTime());
        //				https://console.heweather.com/verify?w=110&h=35&l=4&t=_1498236608585
    });
    $("#remember-me").click(function() {
        var n = document.getElementById("remember-me").checked;
        if(n) {
            $(".zt").show();
        } else {
            $(".zt").hide();
        }
    });

    $("#button").click(function(){
        layer.alert("登录成功", function(){
            window.location.href = "/weshop/home";
            layer.closeAll()
        })
    });


</script>

</body>

</html>
