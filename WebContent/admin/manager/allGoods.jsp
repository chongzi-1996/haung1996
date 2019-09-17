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
	<%
		String getPage=request.getParameter("page");
	 %>
  </head>
  
  <body>
   <h2 class="page-header" style="text-indent: 2em;" >商品管理</h2>
   <%
   			dbUtil db=new dbUtil();
   			ResultSet res=db.doQuery("select * from goods");
    %>
		<table class="table table-bordered table-hover bg-success" style="table-layout: fixed; word-wrap: break-word;">
			<tr>
				<th>商品ID</th>
				<th>商品名</th>
				<th>商品价格</th>
				<th>商品描述</th>
				<th>商品类型</th>
				<th>上传日期</th>
				<th>库存</th>
				<th>浏览次数</th>
				<th>查看详细</th>
				<th>编辑商品</th>
				<th>删除商品</th>
			</tr>
			<%
			 int temp=0;
			if(getPage!=null){
			 temp=Integer.valueOf(getPage); 
			  }
			    if(temp<0){
			 	response.sendRedirect("allGoods.jsp");
			 }
			  int i=0;
			  while(res.next()){
			  if(temp==0){
			  if(i==6){
			  break;
			  }
			 %>
			<tr style="height: 50px;font-size:13px;" class="bg-info">
				<th class="text-center"><%=res.getString("Gid") %></th>
				<th><%=res.getString("Gname") %></th>
				<th><%=res.getString("Gprice") %></th>
				<th><%=res.getString("Gcontent") %></th>
				<th><%=res.getString("Gkind") %></th>
				<th><%=res.getString("Gdate") %></th>
				<th><%=res.getString("Gamount") %></th>
				<th><%=res.getString("Glook") %></th>
				<th><a href="../../look.jsp?id=<%=res.getString("Gid") %>">查看</a></th>
				<th><a href="update.jsp?id=<%=res.getString("Gid")%>">编辑</a></th>
				<th><a href="deleteGood.jsp?id=<%=res.getString("Gid")%>">删除</a></th>
			</tr>
			<%
			i=i+1;
			}else{
				if(i>=temp*6){
			 %>
			 	<tr style="height: 50px;font-size:13px;" class="bg-info">
				<th class="text-center"><%=res.getString("Gid") %></th>
				<th><%=res.getString("Gname") %></th>
				<th><%=res.getString("Gprice") %></th>
				<th><%=res.getString("Gcontent") %></th>
				<th><%=res.getString("Gkind") %></th>
				<th><%=res.getString("Gdate") %></th>
				<th><%=res.getString("Gamount") %></th>
				<th><%=res.getString("Glook") %></th>
				<th><a href="../../look.jsp?id=<%=res.getString("Gid") %>">查看</a></th>
				<th><a href="update.jsp?id=<%=res.getString("Gid")%>">编辑</a></th>
				<th><a href="deleteGood.jsp?id=<%=res.getString("Gid")%>">删除</a></th>
			<%
			}
			i=i+1;
			}
			}
			 %>
		</table>
		<div class="text-center">
		<%		dbUtil dbPage=new dbUtil();
				ResultSet pagesRes=dbPage.doQuery("select count(*) from goods");
				int pages=0;
				while(pagesRes.next()){
				try{
					pages=Integer.valueOf(pagesRes.getString(1));
					}catch(Exception e){
					e.getStackTrace();
					}
			}
				int number=pages/6;
				if(pages%6!=0){
					number=number+1;
				}
				if(temp>=number){
				 out.println("<script>alert('不存在该页面');</script>");
				 response.sendRedirect("allGoods.jsp?page="+(temp-1));
			 }
			
		 %>
			<ul class="pagination">
				<li><a href="allGoods.jsp?page=<%=temp-1 %>" class="glyphicon glyphicon-chevron-left"></a></li>
				<%
					for(int j=0;j<number;j++){
					if(j>temp&&j<=temp+5&&temp>5){
					}else{
				 %>
				 <li><a href="allGoods.jsp?page=<%=j%>"><%=j+1 %></a></li>
				<%
				}
					}
				 %>
				<li><a href="allGoods.jsp?page=<%=temp+1 %>" class="glyphicon glyphicon-chevron-right"></a></li>
			</ul>
		</div>	
  </body>
</html>
