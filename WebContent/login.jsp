<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会员登陆</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
	<script src="dist/js/jquery-3.3.1.js"></script> 
	<script  src="dist/js/bootstrap.min.js"></script>
</head>
<body>
 <%@ include file = "nav.jsp" %>
		<br>
		<br>
		<h2 align="center">欢迎登陆</h2>
		<form action="checkLogin.jsp" class="myform" style="width: 50%;margin: 10px 35%;text-align: left;" method="post">
			<label>账号：</label> 
			<input type="text" class="form-control auth" style="display: inline-block;width: 50%;height: 40px;" placeholder="输入账号或用户名" name="username">
			<span class="text-danger">*账号6-16位，不能为空</span>
			</br>
			</br>
			<label>密码：</label> 
			<input type="password"  class="form-control auth" style="display: inline-block;width: 50%;height: 40px;" placeholder="输入密码" name="password">
			<span class="text-danger">*密码8-16位，不能为空</span>
			</br>
			</br>
			<input  type="submit" value="登陆"  class="btn btn-info col-md-7"style="height: 40px;">
		</form>
</body>
<script type="text/javascript">

$('#auth').data({'s':0});
	$('input[name=username]').next().hide();
  	$('input[name=username]').blur(function () {
		var val=this.value;
		if(val.length>=6&&val.length<=16){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})
	$('input[name=password]').next().hide();
	$('input[name=password]').blur(function () {
		var val=this.value;
		if(val.length>=8&&val.length<=16){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})

	$('.myform').submit(function(){
		$('.auth').blur();
		var all=0;
		$('.myform .auth').each(function(){
			all+=$(this).data('s');
			
		});
		if(all==2){
				
			}else{
				alert("请检查你填写的信息");
				return false;
			}
	})
</script>
</html>