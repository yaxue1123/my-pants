<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<SCRIPT type="text/javascript" src="js/jquery-2.1.4.js"></SCRIPT>
<SCRIPT type="text/javascript" src="js/bootstrap.js"></SCRIPT>
</head>
<body  style="background-color:#FFE4E1;padding-top: 70px;">
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

	<form class="pure-form pure-form-aligned" method="post" action="Order?action=save">
		<fieldset>
			<legend>订单编辑</legend>
			 <div class="pure-control-group">
				<label for="txtProductName">订单金额</label> <input id="txtProductName"
					name="price" type="text" placeholder="产品名称"
					value="${OOrder.price}" />
			</div>
			<div class="pure-control-group">
				<label for="txtCategory">用户名</label> <input id="txtCategory"
					name="userName" type="text" placeholder="产品类型"
					value="${OOrder.userName}" />
			</div>
			<div class="pure-control-group">
				<label for="txtPrice">收件人</label> <input id="txtPrice" name="consignee"
					type="text" placeholder="产品价格" value="${OOrder.consignee }" />
			</div>
			<div class="pure-control-group">
				<label for="txtMemo">联系电话</label>
				<textarea id="txtMemo" name="tele" placeholder="产品描述">${OOrder.tele}</textarea>
			</div>
			<div class="pure-control-group">
				<label for="txtMemo">地址</label>
				<textarea id="txtMemo" name="address" placeholder="产品描述">${OOrder.address}</textarea>
			</div>
			<div class="pure-controls">
				<button type="submit" class="pure-button pure-button-primary">保存</button>
				<input type="hidden" name="orderId" value="${OOrder.orderId }" />
				<input type="hidden" name="action" value="save" />
			</div>
		</fieldset>
	</form>
</body>
</html>