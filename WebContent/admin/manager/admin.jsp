<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>后台管理</title>
	<link rel="stylesheet" type="text/css" href="../../dist/css/bootstrap.min.css">
	<script  src="../../dist/js/jquery-3.3.1.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script> 
	<style type="text/css">
	*{	
		margin: 0px;
		padding: 0px;
		font-family: "宋体";}
		a{
			color: #ffffff;
		}
		.top{
			width: 100%;
			height: 40px;
		 	background-color:#4CB1CA;
		}
		.top ul{
		  margin-right: 250px;
		  line-height: 40px;
		  font-size: 15px;
		  color: #ffffff;
		}
		
 		#menu1 li:hover{
			background-color:#00BFFF;
			color: #fff!important;
			margin-left: 20px;
 		}
 		#menu2 li:hover{
			background-color:#00BFFF;
			color: #fff!important;
			margin-left: 20px;
 		}
 		#menu3 li:hover{
			background-color:#00BFFF;
			color: #fff!important;
			margin-left: 20px;
 		}
 		.chuangkou{
 			width: 90%;
 			height: 840px;
 			display: inline-block;
 			float: right;
 			position: absolute;
 			top: 40px;
 			left: 10%;
 		}
 		li{
 			cursor: pointer;
 		}
 		iframe{
 			border: solid 1px #4CB1CA;
 		}
	</style>
</head>
		<%		
			String username=(String)session.getAttribute("admin");
		  if(username==null){
		    response.sendRedirect("../admin/showMsg.html");
		  }
		%>
<body>
<div class="top">
		<ul class="list-inline pull-right">
			<li>管理员</li>
			<li>：</li>
			<li><%=username %></li>
		</ul>
	</div>
	<div style="width: 100%;height: 840px;">
		<div class="mymenu" style="width: 10%;height: 100%;border: solid 1px #4CB1CA;">	
		<h2 class="bg-primary text-center" id="guanli" style="background-color: #4CB1CA;font-size: 20px;hover:none;">管理站点</h2>
			<ul class="list-group" id="menu1">
				<li class="list-group-item list-group-item-info text-center"  style="font-size: 15px;">修改密码</li>
			</ul>
		<h2 class="bg-primary text-center" id="good" style="background-color: #4CB1CA;font-size: 20px;">商品管理</h2>
			<ul class="list-group" id="menu2">
				<li class="list-group-item list-group-item-info text-center"  style="font-size: 15px;">添加商品</li>
				<li class="list-group-item list-group-item-info text-center"  style="font-size: 15px;">修改商品</li>
			</ul>
		<h2 class="bg-primary text-center" id="good" style="background-color: #4CB1CA;font-size: 20px;">用户管理</h2>
				<ul class="list-group" id="menu3">
				<li class="list-group-item list-group-item-info text-center"  style="font-size: 15px;">会员管理</li>
					<li class="list-group-item list-group-item-info text-center"  style="font-size: 15px;">订单管理</li>
				</ul>
		</div>
		<div class="chuangkou" >
			<iframe src="hello.jsp" width="100%" height="100%"></iframe>
		</div>
	</div>
	<div style="height: 30px;background-color: #4CB1CA; color:#fff;font-size: 25px;" class="text-center">乐购后台管理系统</div>
</body>
<script type="text/javascript">	
		$('#menu1 li').eq(0).click(function(){
			$('iframe').attr('src', 'updatePassword.jsp');
		});
		
		$('#menu2 li').eq(0).click(function(){
			$('iframe').attr('src', 'addGood.jsp');
		});
		$('#menu2 li').eq(1).click(function(){
			$('iframe').attr('src', 'allGoods.jsp');
		});
		$('#menu3 li').eq(0).click(function(){
			$('iframe').attr('src', 'userlist.jsp');
		});
		$('#menu3 li').eq(1).click(function(){
			$('iframe').attr('src', 'dingdan.jsp');
		});
</script>	
</body>
</html>