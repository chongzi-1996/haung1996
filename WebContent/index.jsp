<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
	<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css">
	<script src="dist/js/jquery-3.3.1.js"></script> 
	<script  src="dist/js/bootstrap.min.js"></script>
	<style type="text/css">
	.goods{
		display: inline-block;
	}
	.goods h3{
		width: 80%;
		text-indent: 2em;
	}
	#onegood{
		margin: 25px;
		height: 450px;
	}
	#onegood img{
		width: 100%;
		height: 65%;
	}
	#onegood img:hover{
		width: 100%;
		height: 65%;
		opacity: 0.8;}
</style>
</head>
<body>
<%
		String getPage=request.getParameter("page");
	 %>
	 <%@ include file = "nav.jsp" %>
		<div class="goods container" style="width: 80%;">
	    <div class="col-md-offset-1">
	    		<%
			dbUtil db=new dbUtil();
			ResultSet result= db.doQuery("select * from goods");
		 %>
	  		<h3 class="page-header">精品商品</h3>
	  		<div class="row" >
	  		<%
			 int temp=0;
			if(getPage!=null){
			 temp=Integer.valueOf(getPage); 
			  }
			    if(temp<0){
			 	response.sendRedirect("index.jsp");
			 }
			  int i=0;
			  while(result.next()){
			  if(temp==0){
			  if(i==6){
			  break;
			  }
			  %>
		  		<div class="thumbnail col-md-3" id="onegood">
		  			<a href="look.jsp?id=<%=result.getString("Gid")%>">
		  				<img src="<%=result.getString("Gimg")%>">
		  			</a>
		  			<div class="caption">
		  				<h3 style="font-size: 15px;overflow: hidden;display:inline-block;height: 18px;"><%=result.getString("Gname")%></h3>
		  				<h4 style="text-align:right;color:red;">￥<%=result.getString("Gprice")%></h4>
		  				<div class="pull-right">
			  				<a href=""><button class="btn btn-info">购买</button></a>
			  				<a href="addcar.jsp?id=<%=result.getString("Gid")%>"><button class="btn btn-info">购物车</button></a>
			  			</div>
		  			</div>
		  		</div>
		<%
			i=i+1;
			}else{
				if(i>=temp*6){
			 %>
		  		<div class="thumbnail col-md-3" id="onegood">
		  			<a href="look.jsp?id=<%=result.getString("Gid")%>">
		  				<img src="<%=result.getString("Gimg")%>">
		  			</a>
		  			<div class="caption">
		  				<h3 style="font-size: 15px;overflow: hidden"><%=result.getString("Gname")%></h3>
		  				<h4 style="text-align:right;color:red;">￥<%=result.getString("Gprice")%></h4>
		  				<div class="pull-right">
			  				<a href=""><button class="btn btn-info">购买</button></a>
			  				<a href="addcar.jsp?id=<%=result.getString("Gid")%>"><button class="btn btn-info">购物车</button></a>
			  			</div>
		  			</div>
		  		</div>
		  			<%}
			i=i+1;
			}
			}
			 %>
		  		</div>
		  		
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
				 response.sendRedirect("index.jsp?page="+(temp-1));
			 }
			
		 %>
			<ul class="pagination">
				<li><a href="index.jsp?page=<%=temp-1 %>" class="glyphicon glyphicon-chevron-left"></a></li>
				<%
					for(int j=0;j<number;j++){
					if(j>temp&&j<=temp+5&&temp>5){
					}else{
				 %>
				 <li><a href="index.jsp?page=<%=j%>"><%=j+1 %></a></li>
				<%
				}
					}
				 %>
				<li><a href="index.jsp?page=<%=temp+1 %>" class="glyphicon glyphicon-chevron-right"></a></li>
			</ul>
		</div>	
		  		
	  		</div>
		</div>
		<%
	    Integer hitsCount = 
	      (Integer)application.getAttribute("hitCounter");
	    if( hitsCount ==null || hitsCount == 0 ){
	       hitsCount = 1;
	    }else{
	       hitsCount += 1;
	    }
	    application.setAttribute("hitCounter", hitsCount);
	%>
		<div style="width: 100%;height: 50px;" class="text-center bg-info">
			您是第<%=hitsCount %>位访问本站的人
		</div>
</body>
</html>