<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/mainPage.css" type="text/css" rel="stylesheet"></link>

<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<SCRIPT type="text/javascript" src="js/jquery-2.1.4.js"></SCRIPT>
<SCRIPT type="text/javascript" src="js/bootstrap.js"></SCRIPT>

<title>My Pants</title>
</head>
<body>
	

	<div class="container header" style="width: 950px;margin: 0px auto;">
		<div class="span1" style="width: 190px;float:left;margin-top:20px;margin-bottom:10px;">
			<div class="logo" style="height: 50px;padding-top: 0px;overflow: hidden;">
				<a href="mainPage.jsp"> <img src="pics/logo.gif"></a>
			</div>
		</div>

		<div class="span3" style="width: 470px;height:50px;float:left;margin-top:20px;margin-bottom:10px;">
			<div class="topNav" style="width:52px;float:right;margin-top:25px;">
				<ul style="width:700px;font-size:12px">
					<li style="list-style-type:none;line-height: 15px;float: left;padding-left:2px;padding-right:2px;">
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
					<li style="list-style-type:none;line-height: 15px;float: left;padding-left:2px;padding-right:2px;">
						<%
							if (b.equals(s)) {
								out.print("<a href='productList.jsp'>" + "管理后台|");
							} else {
								out.print("<a href='aLogin.html'>" + "管理后台|");
							}
						%>
					</li>
					<li style="border-right: 1px solid;list-style-type:none;line-height: 15px;float: left;padding-left:2px;padding-right:2px;"><form action="Cart?action=view" method="post">
								<input type="submit" value="购物车"
									style="BACKGROUND-COLOR: white; color: black; border: solid 0px; height: 15px; width: 50px;text-decoration:blink" />
							</form></li>
					<li style="border-right: 1px solid;list-style-type:none;line-height: 15px;float: left;padding-left:2px;padding-right:2px;">
							<form class="pure-form pure-form-aligned" method="post" action="Order?action=view">
								<input type="hidden" name="userName" value="<%=s %>"/>
								<input type="submit" value="我的订单" style="BACKGROUND-COLOR: white; color: black; border: solid 0px; height: 15px; width: 60px;"/>
							</form></li>
				</ul>
			</div>
	
		</div>
		<br>
		<div class="span4" style="width: 950px;margin-right: 0px;margin-left: 0px;padding:0px;">
			<ul class="mainNav" style="margin:50px 0px 5px;padding-height: 36px;overflow: hidden;width:950px;background-color:#CD5B45;">
				<li><a href="mainPage.jsp">首页</a> |</li>
				<li style="list-style-type:none;height: 36px;line-height: 36px;float: left;color: #747474;">
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="m" /> <input
							type="submit" value="男款" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR:#CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 100px;" />
					</form> |
				</li>
				<li style="list-style-type:none;height: 36px;line-height: 36px;float: left;color: #747474;">
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="f" /> <input
							type="submit" value="女款" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR:#CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li style="list-style-type:none;height: 36px;line-height: 36px;float: left;color: #747474;">
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="xx" /> <input
							type="submit" value="休闲裤" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR: #CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li style="list-style-type:none;height: 36px;line-height: 36px;float: left;color: #747474;">
					<form action="Product?action=view" method="post">
						<input type="hidden" name="kind" value="nz" /> <input
							type="submit" value="牛仔裤" class="pure-button"
							style="font-size: 14px; BACKGROUND-COLOR: #CD5B45; color: black; boder-color: black; border: solid 0px; height: 36px; width: 140px;" />
					</form> |
				</li>
				<li style="list-style-type:none;height: 36px;line-height: 36px;float: left;color: #747474;">
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
		
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:950px;height:315px;float:left;">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="pics/show.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    <div class="item">
		      <img src="pics/show2.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		       <div class="item">
		      <img src="pics/show3.jpg" alt="...">
		      <div class="carousel-caption">
		        ...
		      </div>
		    </div>
		    ...
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
		
		<div class="span7">
			<div class="hotBrand clearfix">
				<div class="title">
					&nbsp&nbsp<strong>流行单品</strong>PRODUCT
				</div>
				<div class="pics">
					<ul>
						<li><a href="Product?action=productDetail&productName=sorona Style&productId=1&color=black" ><img style="width:220px;padding:5px;"
								src="pics/pic1.png"></a></li>
						<li><a href="Product?action=productDetail&productName=sorona Style&productId=2&color=khaki"><img style="width:220px;padding:5px;"
								src="pics/pic2.png"></a></li>
						<li><a href="Product?action=productDetail&productName=sports-straight&productId=3color=pink" ><img style="width:220px;padding:5px;"
								src="pics/pic3.png"></a></li>
						<li><a href="Product?action=productDetail&productName=sports-straight&productId=4&color=blue" ><img style="width:220px;padding:5px;"
								src="pics/pic4.png"></a></li>
						<li><a href="Product?action=productDetail&productName=short jeans&productId=5&color=white" ><img style="width:220px;padding:5px;"
								src="pics/pic5.png"></a></li>
						<li><a href="Product?action=productDetail&productName=lycra&productId=6color=black" title=""><img style="width:220px;padding:5px;"
								src="pics/pic6.png"></a></li>
						<li><a href="Product?action=productDetail&productName=lycra&productId=7&color=blue" title=""><img style="width:220px;padding:5px;"
								src="pics/pic7.png"></a></li>
						<li><a href="Product?action=productDetail&productName=sorona&productId=8color=black" title=""><img style="width:220px;padding:5px;"
								src="pics/pic8.png"></a></li>
								
					</ul>
				</div>
			</div>
	
		</div>

	</div>

	<div class="container footer">
	<p style="text-align:center;">Copyright 2007 - 2016 mypants.com All Rights Reserved 京ICP证100557号 京公网安备11011502002400号 出版物经营许可证新出发京批字第直1234567号</p>
	</div>
</body>
</html>