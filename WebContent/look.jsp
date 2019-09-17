<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品详情</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
	<script src="dist/js/jquery-3.3.1.js"></script> 
	<script  src="dist/js/bootstrap.min.js"></script>
	<style type="text/css">
	.goods{
		display: inline-block;
	}
	.goods h3{
		width: 80%;
		text-indent: 2em;
	}
	#onegood{
		margin: 25px;
	}
	#onegood img{
		width: 30%;
		height: 65%;
	}
	#onegood img:hover{
		width: 30%;
		height: 65%;
		opacity: 0.8;}
</style>
</head>
<%
 String id=request.getParameter("id");
%>
<body class="container">
 <%@ include file = "nav.jsp" %>
 	<%
			dbUtil db=new dbUtil();
			String sql="select * from goods where Gid="+id;
			ResultSet result= db.doQuery(sql);
			while(result.next()){
		 %>
<h2 class="page-header">商品详细信息</h2>
	<div class="thumbnail col-md-9" id="onegood">
		  				<img src="<%=result.getString("Gimg")%>">
		  			<div class="caption">
		  				<h3 style="font-size: 15px;">商品名称：<%=result.getString("Gname")%></h3>
		  				<h4 >商品介绍：<%=result.getString("Gcontent")%></h4>
		  				<h4>商品库存：<%=result.getString("Gamount")%></h4>
		  				<h4>商品类别：<%=result.getString("Gkind")%></h4>
		  				<h4 style="text-align:right;color:red;">商品价格：￥<%=result.getString("Gprice")%></h4>
		  				<div class="pull-right">
			  				<a href=""><button class="btn btn-info">购买</button></a>
			  				<a href="addcar.jsp?id=<%=result.getString("Gid")%>"><button class="btn btn-info">购物车</button></a>
			  			</div>
		  			</div>
	</div>
	<%
			}
	%>
</body>
</html>