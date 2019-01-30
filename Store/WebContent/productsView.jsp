<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品列表</title>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link rel="stylesheet" href="css/mainPage.css" type="text/css" />
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
	<table class="pure-table pure-table-horizontal">
		<!-- <thead>
			<tr><th width="300px">图片</th><th width="100px">产品名称</th><th width="175px">分类</th><th width="100px">价格</th><th width="200px">描述</th><th width="75px">操作</th></tr>
		</thead> -->
		<tbody>	
		<ul>		
		<c:forEach var="item" items="${requestScope.Products}">
		
				<form action="Product?action=productDetail" method="post">
				<li class="viewPictures" style="font-size:12px;border:solid 0px;height:320px;width:220px;float:left;margin-top:5px;">
				<img src="pics/pic${item.productId }.png" style="height:264px;width:200px;">		
				<input class="inputTxt" readonly="readonly" name="productName" type="text" value="${item.productName}"  />
				<input type="hidden" name="productId" value="${item.productId}" />
				<input type="hidden" name="color" value="${item.color}" />
				<input class="inputTxt" readonly="readonly" name="category" type="text" value="${item.category}"/>
				<input class="inputTxt" readonly="readonly" name="price" type="text" value="${item.price}" />								
				<input type="submit" value="查看详情" class="pure-button pure-button-primary" />					
				</li>
				</form>
			
		</c:forEach>
		</ul>
		</tbody>
	</table>
	</div>
</body>
</html>