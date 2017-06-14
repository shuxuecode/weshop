<%--
  Created by IntelliJ IDEA.
  User: QDHL
  Date: 2017/6/14
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/common/com.jsp" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link href="/js/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
    <style type="text/css">
        .panel-group {
            max-height: 770px;
            overflow: auto;
        }

        .leftMenu {
            margin: 10px;
            margin-top: 5px;
        }

        .leftMenu .panel-heading {
            font-size: 14px;
            padding-left: 20px;
            height: 36px;
            line-height: 36px;
            color: white;
            position: relative;
            cursor: pointer;
        }

        /*转成手形图标*/
        .leftMenu .panel-heading span {
            position: absolute;
            right: 10px;
            top: 12px;
        }

        .leftMenu .menu-item-left {
            padding: 2px;
            background: transparent;
            border: 1px solid transparent;
            border-radius: 6px;
        }

        .leftMenu .menu-item-left:hover {
            background: #C4E3F3;
            border: 1px solid #1E90FF;
        }

        .main-menu--item {
            line-height: 58px;
            display: inline-block;
            padding: 0 20px;
            color: #333;
            box-sizing: content-box;
        }

        .col-left{
            height: 100%;
            width: 15%;
            padding-left: 30px;
        }

        .col-right{
            border-left: 1px solid #ddd;
        }
    </style>
</head>
<body>

<div class="navbar panel ">
    <div class="container ">
        <div class="navbar-header ">
            <a class="navbar-brand " href="/ ">
                <img src="" style="height: 40px; " alt="SocialHuddle ">
            </a>
        </div>
        <div style="float:right ">
            <a class="main-menu--item " href="/ ">Home</a>
            <a class="main-menu--item " href="/pricing ">Pricing</a>
        </div>
    </div>
</div>

<div class="row ">
    <div class="col-md-2 col-left">
        <ul class="nav nav-pills nav-stacked" id="myNav">
            <li class="active"><a url="# ">Home</a></li>
            <li><a url="${basePath }/weshop/index">首页图片轮播</a></li>
            <li><a url="${basePath }/weshop/goodsListPage">商品列表</a></li>
            <li><a url="# ">VB.Net</a></li>
            <li><a url="# ">Java</a></li>
            <li><a url="# ">PHP</a></li>
        </ul>
    </div>
    <div class="col-md-10 col-right">
        <iframe src="${basePath }/index.jsp" frameborder="0" style="width: 100%; height: 2000px" >
        </iframe>
    </div>
</div>


<footer style="height: 50px; background-color: #0f0f0f; color: #FFFFFF; text-align: center;">
    一些文字
</footer>

<script src="/js/jquery-1.9.1.min.js "></script>
<script src="/js/bootstrap-3.3.0/css/bootstrap.min.css"></script>
<script>
    $(function () {
        $("#myNav a").click(function () {
            var url = $(this).attr("url");

            console.log(url)

            $("iframe").attr("src", url);

            $(this).parent().siblings().removeClass("active");
            $(this).parent().addClass("active");

        });
    });
</script>
</body>
</html>
