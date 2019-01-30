<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mainPage.css" type="text/css" rel="stylesheet"></link>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<div class="container header">
		<div class="span1">
			<div class="logo">
				<a href="/"> <img src="pics/logo.gif"></a>
			</div>
		</div>
		<div class="span2">
			<div class="search">	
			</div>
		</div>
		<div class="span3">
			<div class="topNav">
				<ul>
					<li>
						<%
							String s = (String) session.getAttribute("loginName");
							String b = "admin";
							if (s == null) {
								out.print("<a href='login.html' >" + "登录|   ");
								out.print("<a href='Register.html'>" + "注册|");

							} else {
								out.print("welcome  " + s);
								out.print("<a href='logOut.jsp'>" + "|退出|");
							}
						%>
					</li>
					<li>
						<%
							if (b.equals(s)) {
								out.print("<a href='productList.jsp'>" + "管理后台|");
							} else {
								out.print("<a href='aLogin.html'>" + "管理后台|");
							}
						%>
					</li>
					<li style="border-right: 1px solid"><form action="Cart?action=view" method="post">
								<input type="submit" value="购物车"
									style="BACKGROUND-COLOR: white; color: black; border: solid 0px; height: 15px; width: 50px;" />
							</form></li>
					<li style="border-right: 1px solid">
							<form class="pure-form pure-form-aligned" method="post" action="Order?action=view">
								<input type="hidden" name="userName" value="<%=s %>"/>
								<input type="submit" value="我的订单" style="BACKGROUND-COLOR: white; color: black; border: solid 0px; height: 15px; width: 60px;" />
							</form></li>
				</ul>
			</div>
			<div class="phone">
				
			</div>
		</div>
		<div class="span4">
			<ul class="mainNav">
				<li><a href="mainPage.jsp">首页</a> |</li>
				<li>
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="m" /> <input
							type="submit" value="男款" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR:#CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 100px;" />
					</form> |
				</li>
				<li>
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="f" /> <input
							type="submit" value="女款" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR:#CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li>
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="xx" /> <input
							type="submit" value="休闲裤" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR: #CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li>
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="nz" /> <input
							type="submit" value="牛仔裤" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR: #CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li>
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="all" /> <input
							type="submit" value="全部商品" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR: #CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
			</ul>
		</div>
	</div>
	<div class="container index">	
	<% 
	String productId=request.getParameter("productId");
	String productName=request.getParameter("productName");%>
	<form method="post" action="Logistic?action=addCom">
    <fieldset>
    <legend style="font-size:16px;">评价</legend>
        <div style="font-size: 14px;width:800px;margin:30px;">
        <%out.print("<img style='font-size: 14px;width:300px;' src='pics/pic"+productId+".png' style='height:300px;width:300px;'>"); %>           
        </div>
        <div class="pure-control-group" style="font-size: 14px;width:800px;margin:30px;">
            <label for="txtCategory">产品名称</label>
            <input id="txtCategory" name="" type="text" value="<%=productName%>" />
        </div>
        <div class="pure-control-group" style="font-size: 14px;width:800px;margin:30px;">
            <label for="txtPrice">评价分数</label>
            <input name="grade" type="radio" value="1">1分</input>
            <input name="grade" type="radio" value="2">2分</input>
            <input name="grade" type="radio" value="3">3分</input>
            <input name="grade" type="radio" value="4">4分</input>
            <input name="grade" type="radio" value="5">5分</input>
        </div>
		<div class="pure-control-group" style="font-size: 14px;width:800px;margin:30px;">
            <label for="txtMemo">评价内容</label>
            <textarea style="font-size: 14px;width:600px;height:200px;"name="content"></textarea>
        </div>
        <div class="pure-controls" style="margin-left:600px;" >
        	 <input name="userName" type="hidden" value="<%=s%>"/>
        	 <input name="productId" type="hidden" value="<%=productId%>"/>
             <button type="submit" class="pure-button pure-button-primary">提交评价</button>
        </div>
    </fieldset>
</form>
	</div>
</body>
</html>