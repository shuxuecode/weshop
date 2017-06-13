<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userName = (session.getAttribute("userName") == null) ? "" : session.getAttribute("userName").toString();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中大眼科</title>
</head>
<body>
<h2>你好</h2>
<br/>

<a href="<%=basePath%>/weshop/index">首页图片轮播</a>
<br/><br/><br/>
<a href="<%=basePath%>/weshop/goodsListPage">商品列表</a>


</body>
</html>
