<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>用户管理</title>
	<link rel="stylesheet" type="text/css" href="../../dist/css/bootstrap.min.css">
	<script  src="../../dist/js/jquery-3.3.1.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script> 
	<%
		String getPage=request.getParameter("page");
	 %>
  </head>
<body>
		 <h2 class="page-header" style="text-indent: 2em;" >用户信息</h2>
   <%
   			dbUtil db=new dbUtil();
   			ResultSet res=db.doQuery("select * from users");
    %>
		<table class="table table-bordered table-hover bg-success" style="table-layout: fixed; word-wrap: break-word;">
			<tr>
				<th>用户名</th>
				<th>密码</th>
				<th>年龄</th>
				<th>电话</th>
				<th>生日</th>
			</tr>
			<%
			 int temp=0;
			if(getPage!=null){
			 temp=Integer.valueOf(getPage); 
			  }
			    if(temp<0){
			 	response.sendRedirect("userlist.jsp");
			 }
			  int i=0;
			  while(res.next()){
			  if(temp==0){
			  if(i==6){
			  break;
			  }
			 %>
			<tr style="height: 50px;font-size:13px;" class="bg-info">
				<th><%=res.getString("username") %></th>
				<th><%=res.getString("password") %></th>
				<th><%=res.getString("age") %></th>
				<th><%=res.getString("phone") %></th>
				<th><%=res.getString("birthday") %></th>
			</tr>
			<%
			i=i+1;
			}else{
				if(i>=temp*6){
			 %>
			 	<tr style="height: 50px;font-size:13px;" class="bg-info">
				<th><%=res.getString("username") %></th>
				<th><%=res.getString("password") %></th>
				<th><%=res.getString("age") %></th>
				<th><%=res.getString("phone") %></th>
				<th><%=res.getString("birthday") %></th>
			<%
			}
			i=i+1;
			}
			}
			 %>
		</table>
		<div class="text-center">
		<%		dbUtil dbPage=new dbUtil();
				ResultSet pagesRes=dbPage.doQuery("select count(*) from users");
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
				 response.sendRedirect("userlist.jsp?page="+(temp-1));
			 }
			
		 %>
			<ul class="pagination">
				<li><a href="userlist.jsp?page=<%=temp-1 %>" class="glyphicon glyphicon-chevron-left"></a></li>
				<%
					for(int j=0;j<number;j++){
					if(j>temp&&j<=temp+5&&temp>5){
					}else{
				 %>
				 <li><a href="userlist.jsp?page=<%=j%>"><%=j+1 %></a></li>
				<%
				}
					}
				 %>
				<li><a href="userlist.jsp?page=<%=temp+1 %>" class="glyphicon glyphicon-chevron-right"></a></li>
			</ul>
		</div>	
  </body>
</body>
</html>