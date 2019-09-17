<%@page import="java.sql.ResultSet"%>
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
	<%	
		request.setCharacterEncoding("utf-8");
	 	String username=request.getParameter("username");
	 	String password=request.getParameter("password");
	 	dbUtil db=new dbUtil();
	 	ResultSet result=db.doQuery("select password from users where username='"+username+"'");
	 	while (result.next()){
	 	 	String pw=result.getString(1);
	 	 	if(password.equals(pw)){
	 	 		session.setAttribute("users", username);
	 	 		session.setMaxInactiveInterval(24*60*60);
	 	 		response.sendRedirect("index.jsp");
	 	 	}else{
	 	 		response.sendRedirect("showMsg.html");
	 	 	}
	 	}
	 	out.println("<script>window.location.href='showMsg.html'</script>");
	 %>
</body>
</html>