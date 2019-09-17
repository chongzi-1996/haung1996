<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <body>
   <%
   		String username=(String)session.getAttribute("admin");
      String password1=request.getParameter("password1").trim();
      String password2=request.getParameter("password2").trim();
      if (password1.equals(password2)){
       if(password1.length()>=8&&password1.length()<=16){
  		dbUtil db=new dbUtil();
  		db.doUpdate("update admin set password='"+password1+"' where username='"+username+"'");
        out.println("<script>alert('修改成功');window.location.href='updatePassword.jsp'</script>");
       }else{
       	out.println("<script>alert('密码长度为8-16位');window.location.href='updatePassword.jsp'</script>");	
       }
      }else{
        out.println("<script>alert('两次密码一致');window.location.href='updatePassword.jsp'</script>");
      }
    %>
  </body>
</html>
