<%@page import="dao.Car"%>
<%@page import="daoImpl.carImpl"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.websocket.Session"%>
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
 	 String username=(String)session.getAttribute("users");
if(username==null){
	out.println("<script>alert('请先登陆再添加购物车');window.location='login.jsp'</script>");
}
	SimpleDateFormat mydate=new SimpleDateFormat("yyyy-MM-dd-HH-ss");
	String nowtime=mydate.format(new Date());
	int id=Integer.valueOf(request.getParameter("id"));
	Car car=new Car(username,id,nowtime);
	carImpl carimpl=new carImpl();
	int row=carimpl.addCar(car);
	if(row!=0){
		out.println("<script>alert('添加成功');window.location='index.jsp'</script>");
	}else{
		out.println("<script>alert('添加失败');window.location='index.jsp'</script>");
	}
%>
</body>
</html>