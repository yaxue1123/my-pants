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
			</th>
			<th >
				<div id="nav" class="nav">
					<table>
						
					</table>
				</div>
			
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
			<a class="pure-button" href="account1Add.jsp">添加账户</a>
		</div>
		
		<br />
			<table class="pure-table pure-table-horizontal">
				<thead>
					<tr><th>编号</th><th>用户</th><th>账户余额</th><th colspan="2">操作</th></tr>
				</thead>
				<tbody bgcolor="white">
				<c:forEach var="item" items="${requestScope.Account1s}">
					<tr>
						<td>${item.accountId}</td>
						<td>${item.userName}</td>
						<td>${item.money}</td>
						<td>
							<form action="Account1?action=edit" method="post">
								<input type="submit" value="Edit" class="pure-button pure-button-primary" />
								<input type="hidden" name="accountId" value="${item.accountId}" />
							</form>
						</td>
						<td>
							<form action="Account1?action=del" method="post">
								<input type="submit" value="Delete" class="pure-button pure-button-primary" />
								<input type="hidden" name="accountId" value="${item.accountId}" />
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</tr>
	</tbody></table>
</body>
</html>