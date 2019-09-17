<%@page import="java.sql.ResultSet"%>
<%@page import="dao.dbUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String username=(String)session.getAttribute("users");
     
    %>
<div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">家电乐购网</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">家电乐购网</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="index.jsp">首页</a>
						</li>
						<li>
							 <a href="register.jsp">注册</a>
						</li>
						<li>
							 <a href="login.jsp">登陆</a>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类查询<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="kindsearch.jsp?kind=1">冰箱</a>
								</li>
								<li>
									 <a href="kindsearch.jsp?kind=2">电视</a>
								</li>
								<li>
									 <a href="kindsearch.jsp?kind=3">厨具</a>
								</li>
							</ul>
						</li>
					</ul>
					<form action="search.jsp" method="post" class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" class="form-control" name="search">
						</div> <button type="submit" class="btn btn-default">搜索</button>
					</form>
					<span style="height: 60px;line-height: 60px;font-size:20px;">
						<%
							if(username==null){
							}else{
								out.println("尊敬得会员"+username);
								String name=(String)session.getAttribute("users");
								dbUtil db=new dbUtil();
								ResultSet res= db.doQuery("select count(*) from car where Uname='"+name+"'");
								String init="0";
								while(res.next()){
									init=res.getString(1);
								}
								out.println("<a href='mycar.jsp'><button class='btn btn-info' style='width: 10%;margin-left:5px;font-size: 12px;'>我的购物车<p class='badge'>"+init+"</p></button></a>"+"<a href='logout.jsp'><button class='btn btn-info' style='width: 10%;margin-left:5px;font-size: 12px;'>注销</button></a>");
							}
						%>
					</span>
				</div>
			</nav>
		</div>
	</div>
</div>