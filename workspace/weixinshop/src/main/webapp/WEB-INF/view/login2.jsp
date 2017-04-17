<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/js/bootstrap-3.3.0/css/bootstrap.min.css" />

<style type="text/css">
body {
	background: url(../img/login_bg_0.jpg) #f8f6e9;
}

.mycenter {
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	height: 350px;
	width: 500px;
	padding: 5%;
	padding-left: 5%;
	padding-right: 5%;
}

.mycenter mysign {
	width: 440px;
}

.mycenter input, checkbox, button {
	margin-top: 2%;
	margin-left: 10%;
	margin-right: 10%;
}

.mycheckbox {
	margin-top: 10px;
	margin-left: 40px;
	margin-bottom: 10px;
	height: 10px;
}
</style>

</head>
<body>
	<form action="login.php" method="post">
		<div class="mycenter">
			<div class="mysign">
				<div class="col-lg-11 text-center text-info">
					<h2>请登录</h2>
				</div>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="username"
						placeholder="请输入账户名" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="password"
						placeholder="请输入密码" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10 mycheckbox checkbox">
					<input type="checkbox" class="col-lg-1">记住密码</input>
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<button type="button" class="btn btn-success col-lg-12">登录</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>