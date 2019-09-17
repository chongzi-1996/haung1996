<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
	<link rel="stylesheet" type="text/css" href="../../dist/css/bootstrap.min.css">
	<script  src="../../dist/js/jquery-3.3.1.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script> 
</head>
<body class="container">
<br>
<br>
	<h3 align="center">修改管理密码</h3>
	<form action="checkupdate.jsp"  method="post" class="text-center">
			<label class="col-sm-2 control-label">新密码</label>
            <input style="height: 50px;width: 75%;" type="text" class="form-control" placeholder="请输入密码" name="password1">
            </br>
			<label class="col-sm-2 control-label">确认密码</label>
			<input style="height: 50px;width: 75%;" type="password" class="form-control" name="password2" placeholder="请确认密码">
			</br>
		    <input style="height: 50px;width: 75%;" class="btn btn-info col-md-5 col-sm-offset-2" type="submit" value="修改密码">
	</form>
</body>
</html>