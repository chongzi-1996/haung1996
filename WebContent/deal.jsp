
<%@page import="dao.dbUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		String goods=request.getParameter("goods");
		String total=request.getParameter("total");
		SimpleDateFormat mydate=new SimpleDateFormat("yyyyMMdddHHmmssS");
		String nowtime=mydate.format(new Date());
		dbUtil db=new dbUtil();
		String sql="insert into dingdan values('"+nowtime+"','"+goods+"','"+total+"',now())";
		System.out.println(sql);
		int row=db.doUpdate(sql);
		if(row!=0){
			String name=(String)session.getAttribute("users");
			db.doUpdate("delete from car where Uname='"+name+"'");
			out.println("<script>alert('订单已生成');window.location='index.jsp'</script>");
		}else{
			out.println("<script>alert('订单生成失败');window.location='mycar.jsp'</script>");
		}
	%>
</body>
</html>