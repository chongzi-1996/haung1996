<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
	<script src="dist/js/jquery-3.3.1.js"></script> 
	<script  src="dist/js/bootstrap.min.js"></script>
</head>
	<body class="container">
	<%@ include file="nav.jsp" %>
	<%
	String name=(String)session.getAttribute("users");
	if(name==null){
		out.println("<script>alert('请先登录');window.location='login.jsp'</script>");
	}
	dbUtil db=new dbUtil();
	String sql="select * from car inner join goods on car.Gid=goods.Gid where Uname='"+name+"'";
	System.out.println(sql);
	ResultSet res=db.doQuery(sql);
%>
	<h2 class="page-header">我的购物车</h2>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="list-group">
			<%
			    double total=0; 
				String allgood="";
				while(res.next()){
			%>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
					商品名称:<%=res.getString("goods.Gname") %>
					</h4>
					<h4 class="list-group-item-heading">
					商品价格￥:<%=res.getString("goods.Gprice") %>
					</h4>
					<p class="list-group-item-text">
					添加购物车日期:<%=res.getString("car.date") %>
					</p>
					
					<a href="deletecar.jsp?id=<%=res.getString("car.Gid")%>" ><button class="btn btn-danger">删除</button></a>
				</div>
				<%
				    allgood=allgood+res.getString("goods.Gname")+"\n";
					total=total+res.getDouble("Gprice");
				}
				%>
				<%
			 if(total!=0){
			%>
			<div style='float:right;'>
					<h2 >总价:&nbsp&nbsp<span  style='color:red;'><%=total %></span></h2>
					<form action="deal.jsp" method="post">
						<input type="hidden" name="goods" value="<%=allgood%>">
						<input type="hidden" name="total" value="<%=total%>">
						<input type="submit" value="付款"  class="btn btn-success" style="float:right;margin-top: 50px;width: 120px;" >
					</form>
			</div>

			<%
			 }
			%>
			
			</div>	
		</div>
		</div>
	</div>
</body>
</html>