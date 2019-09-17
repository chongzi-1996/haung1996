<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加商品</title>
<link rel="stylesheet" type="text/css" href="../../dist/css/bootstrap.min.css">
<script  src="../../dist/js/jquery-3.3.1.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script> 
</head>
<body>
		 <div class="container">
	<h2 class="page-header">添加商品信息</h2>
	<form  class="myform" action="<%=path %>/addgoods" method="post" enctype="multipart/form-data">
			<label>商品名称：</label> </br>
			<input type="text" class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品名称" name="gname">
			<span class="text-danger">不能为空</span>
			</br>
			</br>
			<label>商品价格：</label> </br>
			<input type="text"  class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品价格" name="gprice">
			<span class="text-danger">*数字，不能为空</span>
			</br>
			</br>
			<label>商品数量：</label></br>
			<input type="number"   class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品数量" name="gamount">
			<span class="text-danger">*数字，不能为空</span>
			</br>
			</br>
			<label>商品介绍：</label></br>
			<input type="text"   class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品介绍" name="gcontent">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<label>商品图片：</label> </br>
			<input type="file" class="form-control auth" style="display: inline-block;width: 50%;height: 50px;" placeholder="上传图片"  name="gimg">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<label>商品类别：</label> </br>
			<input type="text"  class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品类别" name="gkind">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<input  type="submit" value="添加商品"  class="btn btn-info col-md-7">
	</form>
	</div>
</body>
<script type="text/javascript">

  	$(".auth").data({"s":0});
	$("input[name=gname]").next().hide()
	$("input[name=gname]").blur(function() {
		val=this.value;
		if(val.length>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
		}
	})
	$("input[name=gprice]").next().hide()
	$("input[name=gprice]").blur(function() {
		val=parseFloat(this.value);
		if(val>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
		}
	})
	$("input[name=gamount]").next().hide()
	$("input[name=gamount]").blur(function() {
		val=this.value;
		if(val>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
		}
	})
	$("input[name=gimg]").next().hide()
	$("input[name=gimg]").blur(function() {
		val=this.value;
		if(val.length>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
		}
	})
    $("input[name=gcontent]").next().hide()
    $("input[name=gcontent]").blur(function() {
		val=this.value;
		if(val.length>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
		}
	})
	$("input[name=gkind]").next().hide()
	$("input[name=gkind]").blur(function() {
		val=this.value;
		if(val.length>0){
			$(this).next().hide();
			$(this).data({"s":1});
		}else{
			$(this).next().show();
			$(this).data({"s":0});
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