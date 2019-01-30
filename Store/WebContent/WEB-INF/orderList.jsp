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
</head>
<body>
<table class="main">
		<tbody>
			<tr>
			<th class="logo">
				<a href="main.jhtml">
					<img src="header_logo.png" alt="SHOP++">
				</a>
			</th>
			<th >
				<div id="nav" class="nav">
					<table>
						<tr>
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
						</tr>
					</table>
				</div>
				<div class="link">
					<a href="http://www.shopxx.net" target="_blank">官方网站</a>|
					<a href="http://bbs.shopxx.net" target="_blank">交流论坛</a>|
					<a href="http://www.shopxx.net/about.html" target="_blank">关于我们</a>
				</div>
				<div class="link">
					<strong>admin</strong>
					您好!
					<a href="/logOut.jsp" target="_top">[注销]</a>
				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				
			</td>
			<td>
			<br><br>
		<div class="pure-controls">
		</div>
		
		<br />
			<table class="pure-table pure-table-horizontal">
				<thead>
					<tr><th>编号</th><th>订单金额</th><th>购买用户</th><th>收件人</th><th>收件地址</th><th>联系电话</th><th colspan="2">操作</th></tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${requestScope.Orders}">
					<tr>
						<td>${item.orderId}</td>
						<td>${item.price}</td>
						<td>${item.userName}</td>
						<td>${item.consignee}</td>
						<td>${item.address}</td>
						<td>${item.tele}</td>
						<td>
							<form action="Order?action=edit" method="post">
								<input type="submit" value="Edit" class="pure-button pure-button-primary" />
								<input type="hidden" name="orderId" value="${item.orderId }" />
							</form>
						</td>
						<td>
							<form action="Order?action=del" method="post">
								<input type="submit" value="Delete" class="pure-button pure-button-primary" />
								<input type="hidden" name="orderId" value="${item.orderId }" />
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