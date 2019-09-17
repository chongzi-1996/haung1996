<%@page import="dao.dbUtil"%>
<%@page import="javax.print.DocFlavor.STRING"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user=(String)session.getAttribute("users");
		String id=request.getParameter("id");
		dbUtil db=new dbUtil();
		String sql="delete from car where Gid='"+id+"' and Uname='"+user+"'";
		System.out.println(sql);
		int row=db.doUpdate(sql);
			if(row!=0){
				out.println("<script>alert('删除成功');window.location='mycar.jsp'</script>");
			}else{
				out.println("<script>alert('删除失败');window.location='mycar.jsp'</script>");
			}
	%>
</body>
</html>