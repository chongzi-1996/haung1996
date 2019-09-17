<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品管理</title>
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
   <h2 class="page-header" style="text-indent: 2em;" >商品管理</h2>
   <%
   			dbUtil db=new dbUtil();
   			ResultSet res=db.doQuery("select * from dingdan");
    %>
		<table class="table table-bordered table-hover bg-success" style="table-layout: fixed; word-wrap: break-word;">
			<tr>
				<th>订单号</th>
				<th>商品名</th>
				<th>商品价格</th>
				<th>订单日期</th>
			</tr>
			<%
			while(res.next()){
			%>
			<tr>
				<td><%=res.getString("id") %></td>
				<td><%=res.getString("goods") %></td>
				<td><%=res.getString("total") %></td>
				<td><%=res.getString("time") %></td>
			</tr>
			<%
			}
			%>
		</table>
</body>
</html>