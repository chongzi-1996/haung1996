<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索</title>
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
		height: 450px;
	}
	#onegood img{
		width: 100%;
		height:65%;
	}
	#onegood img:hover{
		width: 100%;
		height: 65%;
		opacity: 0.8;}
</style>
</head>
<body>
<%		request.setCharacterEncoding("utf-8");
		String info=request.getParameter("search");
 	 %>
	 <%@ include file = "nav.jsp" %>
		<div class="goods container" style="width: 80%;">
	    <div class="col-md-offset-1">
	    		<%
				dbUtil db=new dbUtil();
	    		String sql="select * from goods where Gname like '%"+info+"%' or Gname='"+info+"'";
	    		System.out.println(sql);
				ResultSet result= db.doQuery(sql);
		 %>
	  		<h3 class="page-header">搜索到的商品</h3>
	  		<div class="row" >
	  		<%
			  while(result.next()){
			  %>
		  		<div class="thumbnail col-md-3" id="onegood">
		  			<a href="look.jsp?id=<%=result.getString("Gid")%>">
		  				<img src="<%=result.getString("Gimg")%>">
		  			</a>
		  			<div class="caption">
		  				<h3 style="font-size: 15px;overflow: hidden"><%=result.getString("Gname")%></h3>
		  				<h4 style="text-align:right;color:red;"><%=result.getString("Gprice")%></h4>
		  				<div class="pull-right">
			  				<a href=""><button class="btn btn-info">购买</button></a>
			  				<a href="addcar.jsp?id=<%=result.getString("Gid")%>"><button class="btn btn-info">购物车</button></a>
			  			</div>
		  			</div>
		  		</div>
		<%
			  }
			 %>
		  		</div>
		  		
	  		</div>
		</div>
</body>
</html>