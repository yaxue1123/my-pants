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
		<fieldset>
	  <legend style="font-size:16px;">物流信息</legend>
		
				<c:forEach var="item" items="${requestScope.logisticDetail}">
					<ul style=>
						<li style="font-size:16px;">已到达:${item.desitination}</li>
					</ul>
				</c:forEach>		
													
			</fieldset>
			<fieldset>
	  <legend style="font-size:16px;">商品信息</legend>
		
				<table class="pure-table pure-table-horizontal">
				<thead>
					<tr><th>图片</th><th>产品名称</th><th>分类</th><th>价格</th><th>描述</th><th>性别</th><th>大小</th><th>颜色</th><th>操作</th></tr>
				</thead>
				<tbody bgcolor="white">
				<c:forEach var="item" items="${requestScope.orderPro}">
					<tr>
						<td><img src="pics/pic${item.productId }.png" style="height:100px;width:100px;"></td>
						<td>${item.productName}</td>
						<td>${item.category}</td>
						<td>${item.price}</td>
						<td>${item.memo}</td>
						<td>${item.sex}</td>
						<td>${item.size}</td>
						<td>${item.color}</td>
						<td>
							<form action="comment.jsp" method="post">
								<input type="submit" value="进行评价" class="pure-button pure-button-primary" />
								<input type="hidden" name="productId" value="${item.productId }" />
								<input type="hidden" name="productName" value="${item.productName}"/>
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>	
													
			</fieldset>
	</div>
</body>
</html>