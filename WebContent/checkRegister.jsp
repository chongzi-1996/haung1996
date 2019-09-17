<%@page import="daoImpl.User"%>
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
     request.setCharacterEncoding("utf-8");
     String username=request.getParameter("username").trim();
     String password1=request.getParameter("password1").trim();
     String password2=request.getParameter("password2").trim();
     String age=request.getParameter("age").trim();
     String birthday=request.getParameter("birthday").trim();
     String phone=request.getParameter("phone").trim();
     System.out.print(username+password1+age+birthday+phone);
     if (password1.equals(password2)){
     			User user=new User();
   				boolean isCan=user.canAdd(username);
   				if (isCan==true){
   				int result= user.addUser(username, password1,age,birthday,phone);
   				if(result!=0){
   					out.println("<script>alert('注册成功');window.location.href='login.jsp'</script>");	
   				}else{
   					out.println("<script>alert('注册失败');window.location.href='login.jsp'</script>");
   				}
   				}else{
   				out.println("<script>alert('注册失败,用户已存在');window.location.href='register.jsp'</script>");	
   				}
     }else{
     	out.println("<script>alert('两次密码不一致')</script>");
     }
     %>
</body>
</html>