<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注销</title>
</head>
<body>
		<%
		request.getSession().removeAttribute("users");
		out.println("<script>alert('注销成功');window.location='index.jsp'</script>");
		%>
</body>
</html>