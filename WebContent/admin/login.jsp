<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登陆</title>
	<link rel="stylesheet" type="text/css" href="../dist/css/bootstrap.min.css">
	<script src="../dist/js/jquery-3.3.1.js"></script> 
	<script  src="../dist/js/bootstrap.min.js"></script>
<style type="text/css">
 		.main{
 			margin-top: 15%;
 			border: solid 1px #ccc;
 			border-radius: 5px;
 			height: 450px;
 			box-shadow: 1px 1px 1px 1px #ccc;
 			}

 		.main form{
 			display: inline-block;
 			width: 50%;
 		}
 		.main form label{
 			font-size: 25px;
 			line-height: 50px;
 		}
</style>
</head>
<body>
	 <div class="container">
	   <div class="main text-center">
	  	<h1 class="page-header">欢迎后台管理员登陆</h1>
		<form action="checkLogin.jsp"  method="post" class="text-center">
			<label class="col-sm-2 control-label glyphicon glyphicon-user"></label>
            <input style="height: 50px;width: 75%;" type="text" class="form-control" placeholder="请输入账号" name="username">
            </br>
			<label class="col-sm-2 control-label glyphicon glyphicon-lock"></label>
			<input style="height: 50px;width: 75%;" type="password" class="form-control" name="password" placeholder="请输入密码">
			</br>
		    <input style="height: 50px;width: 75%;" class="btn btn-info col-md-5 col-sm-offset-2" type="submit" value="登陆">
		</form>
	    </div>
    </div>
</body>
</html>