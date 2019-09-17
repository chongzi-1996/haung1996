<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
	<script src="dist/js/jquery-3.3.1.js"></script> 
	<script  src="dist/js/bootstrap.min.js"></script>
</head>
<body>
 <%@ include file = "nav.jsp" %>
	<h2 align="center">会员注册</h2>
	<form action="checkRegister.jsp" class="myform" style="width: 50%;margin: 10px 35%;text-align: left;" method="post">
			<label>账号：</label> 
			<input type="text" class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入账号或用户名" name="username">
			<span class="text-danger">*账号6-16位，不能为空</span>
			</br>
			</br>
			<label>密码：</label> 
			<input type="password"  class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入密码" name="password1">
			<span class="text-danger">*密码8-16位，不能为空</span>
			</br>
			</br>
			<label>确认：</label>
			<input type="password"   class="form-control auth" style="display: inline-block;width: 50%;" placeholder="确认密码" name="password2">
			<span class="text-danger">*两次密码输入不相同</span>
			</br>
			</br>
			<label>年龄：</label> 
			<input type="number" class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入年龄" min="1" max="100" name="age">
			<span class="text-danger">*不能为空(数字)</span>
			</br>
			</br>
			<label>生日：</label> 
			<input type="text"  class="form-control auth"  style="display: inline-block;width: 50%;" onclick="WdatePicker()" placeholder="输入生日" name="birthday">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<label>电话：</label> 
			<input type="number"  class="form-control auth" placeholder="输入电话" style="display: inline-block;width: 50%;" name="phone">
			<span class="text-danger">*不能为空(6-14位数字)</span>
			</br>
			</br>
			<input  type="submit" value="注册"  class="btn btn-info col-md-7">
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
	$('input[name=password1]').next().hide();
	$('input[name=password1]').blur(function () {
		var val=this.value;
		if(val.length>=8&&val.length<=16){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})
	$('input[name=password2]').next().hide();
	$('input[name=password2]').blur(function () {
		var val=this.value;
		var val1=$('input[name=password1]').val();
		if(val==val1){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})
	$('input[name=age]').next().hide();
	$('input[name=age]').blur(function () {
		var val=this.value;
		if(val.length>=1){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})
	$('input[name=birthday]').next().hide();
	$('input[name=birthday]').blur(function () {
		var val=this.value;
		if(val.length>=1){
			$(this).next().hide();
			$(this).data({'s':1});
		}else{
			$(this).next().show();
			$(this).data({'s':0});
		}
	})
	$('input[name=phone]').next().hide();
	$('input[name=phone]').blur(function () {
		var val=this.value;
		if(val.length>=6&&val.length<=14){
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
		if(all==6){
				
			}else{
				alert("请检查你填写的信息");
				return false;
			}
	})
	</script>
</html>