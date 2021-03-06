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
<link rel="stylesheet" href="css/backMain.css" type="text/css" />
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<SCRIPT type="text/javascript" src="js/jquery-2.1.4.js"></SCRIPT>
<SCRIPT type="text/javascript" src="js/bootstrap.js"></SCRIPT>
</head>
<body background="backPic.png" style="background-color:#FFE4E1;padding-top: 70px;">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    	<div class="link" style="float:left">
					<a href="mainPage.jsp" target="_blank" class="navbar-text">首页</a>
					<a href="http://bbs.shopxx.net" target="_blank" class="navbar-text">交流论坛</a>
					<a href="http://www.shopxx.net/about.html" target="_blank" class="navbar-text">关于我们</a>
				</div>
				<div class="link"  style="float:left">
					
					<a class="navbar-text"> admin您好!</a>
					<a href="logOut.jsp" target="_top" class="navbar-text">[注销]</a>
				</div>
  </div>
</nav>
<table class="main">
		<tbody>
			<tr>
			<th class="logo">
				<!-- <a href="main.jhtml">
					<img src="header_logo.png" alt="SHOP++">
				</a> -->
			</th>
			<th >
				<div id="nav" class="nav">
					<table>
						<!-- <tr>
							<td>
								<form action="Product?action=list" method="post">
									<input type="submit" value="商品详情" class="pure-button" />
								</form>
							</td>
							<td>
								<form action="User?action=list" method="post">
									<input type="submit" value="用户详情" class="pure-button" />
								</form>
							</td>
							<td>
								<form action="Order?action=list" method="post">
									<input type="submit" value="订单详情" class="pure-button" />
								</form>
							</td>
							<td>
								<form action="Account1?action=list" method="post">
									<input type="submit" value="账户详情" class="pure-button" />
								</form>
							</td>
						</tr> -->
					</table>
				</div>
		<!-- 		<div class="link">
					<a href="mainPage.jsp" target="_blank">首页</a>|
					<a href="http://bbs.shopxx.net" target="_blank">交流论坛</a>|
					<a href="http://www.shopxx.net/about.html" target="_blank">关于我们</a>
				</div>
				<div class="link">
					<strong>admin</strong>
					您好!
					<a href="logOut.jsp" target="_top">[注销]</a>>
				</div> -->
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				<form action="Product?action=list" method="post">
									<input type="submit" value="商品详情" class="pure-button" />
								</form><br>
								<form action="User?action=list" method="post">
									<input type="submit" value="用户详情" class="pure-button" />
								</form><br>
								<form action="Order?action=list" method="post">
									<input type="submit" value="订单详情" class="pure-button" />
								</form><br>
								<form action="Account1?action=list" method="post">
									<input type="submit" value="账户详情" class="pure-button" />
								</form>	
			</td>
			<td>
			<br><br>			
			<div class="pure-controls">
			<a class="pure-button" href="userAdd.jsp">添加用户</a>
			</div><br>
			<table class="pure-table pure-table-horizontal">
				<thead>
					<tr><th>编号</th><th>登录名称</th><th>密码</th><th>姓名</th><th>性别</th><th>出生日期</th><th colspan="2">操作</th></tr>
				</thead>
				<tbody bgcolor="white">
				<c:forEach var="item" items="${requestScope.Users}">
					<tr>
						<td>${item.id}</td>
						<td>${item.loginName}</td>
						<td>${item.password}</td>
						<td>${item.fullName}</td>
						<td>${item.gender}</td>
						<td>${item.birthDate}</td>
						<td>
							<form action="User?action=edit" method="post">
								<input type="submit" value="Edit" class="pure-button pure-button-primary" />
								<input type="hidden" name="UserId" value="${item.id }" />
							</form>
						</td>
						<td>
							<form action="User?action=del" method="post">
								<input type="submit" value="Delete" class="pure-button pure-button-primary" />
								<input type="hidden" name="UserId" value="${item.id }" />
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table><br>
		</tr>
	</tbody></table>




</body>
</html>