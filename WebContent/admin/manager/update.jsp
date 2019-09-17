<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
		String id=request.getParameter("id");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../../dist/css/bootstrap.min.css">
	<script  src="../../dist/js/jquery-3.3.1.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script> 
  </head>
  <body>
  <%
  	dbUtil db=new dbUtil();
  	String sql="select * from goods where Gid="+id;
  	ResultSet result=db.doQuery(sql);
   %>
  <div class="container">
	<h2 class="page-header">修改商品信息</h2>
	<form  class="myform" action="<%=path %>/goodUpdate" method="post" enctype="multipart/form-data">
	<%
		  	while(result.next()){
	 %>		<input type="hidden" name="gid" value="<%=result.getString("Gid")%>">
			<label>商品名称：</label> </br>
			<input type="text" class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品名称" name="gname" value="<%=result.getString("Gname")%>">
			<span class="text-danger">不能为空</span>
			</br>
			</br>
			<label>商品价格：</label> </br>
			<input type="text"  class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品价格" name="gprice" value="<%=result.getString("Gprice")%>">
			<span class="text-danger">*数字，不能为空</span>
			</br>
			</br>
			<label>商品数量：</label></br>
			<input type="number"   class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品数量" name="gamount" value="<%=result.getString("Gamount")%>">
			<span class="text-danger">*数字，不能为空</span>
			</br>
			</br>
			<label>商品介绍：</label></br>
			<input type="text"   class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品介绍" name="gcontent" value="<%=result.getString("Gcontent")%>">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<label>商品图片：</label> </br>
			<img src="../../<%=result.getString("Gimg")%> " width="50%" height="30%">
			<input type="file" class="form-control auth" style="display: inline-block;width: 50%;height: 50px;" placeholder="上传图片"  name="gimg">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<label>商品类别：</label> </br>
			<input type="text"  class="form-control auth" style="display: inline-block;width: 50%;" placeholder="输入商品类别" name="gkind" value="<%=result.getString("Gkind")%>">
			<span class="text-danger">*不能为空</span>
			</br>
			</br>
			<%
				}
			 %>
			<input  type="submit" value="修改商品"  class="btn btn-info col-md-7">
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

