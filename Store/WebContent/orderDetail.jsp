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
<body background="backPic.png"  style="background-color:#FFE4E1;padding-top: 70px;">
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
					<a href="logOut.jsp" target="_top">[注销]</a>
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
		<br />
		<fieldset style="width:600px;">
	  <legend style="font-size:16px;">物流信息</legend>
		
				<c:forEach var="item" items="${requestScope.logisticDetail1}">
					<ul style=>
						<li style="font-size:16px;">已到达:${item.desitination}</li>
					</ul>
				</c:forEach>		
			 <HR width="95%"/>		
				<%-- <form action="Order?action=abcd" method="post">
				 <div class="pure-control-group">
           			 <label>最新到达地点</label>
            		<input name="desitination" type="text"/>
       			 </div>
       			 <div class="pure-controls">
						<input type="submit" value="添加物流信息" class="pure-button pure-button-primary" />
						<input type="hidden" name="orderId" value="${orderId}" />
				</div>
				</form>	 --%>										
			</fieldset>
			<br>
			<table class="pure-table pure-table-horizontal">
				<thead>
					<tr><th>图片</th><th>产品名称</th><th>分类</th><th>价格</th><th>描述</th><th>性别</th><th>大小</th><th>颜色</th></tr>
				</thead>
				<tbody bgcolor="white">
				<c:forEach var="item" items="${requestScope.orderPro1}">
					<tr>
						<td><img src="pics/pic${item.productId }.png" style="height:100px;width:100px;"></td>
						<td>${item.productName}</td>
						<td>${item.category}</td>
						<td>${item.price}</td>
						<td>${item.memo}</td>
						<td>${item.sex}</td>
						<td>${item.size}</td>
						<td>${item.color}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>	
		</tr>
	</tbody></table>	
</body>
</html>