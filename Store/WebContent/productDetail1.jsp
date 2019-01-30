<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="JavaBean.Product" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link rel="stylesheet" href="css/mainPage.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/demo.css">  
<!-- 必要样式 -->
<link type="text/css" rel="stylesheet" href="css/etalage.css">
<link type="text/css" rel="stylesheet" href="css/example2.css">	
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/jquery.etalage.min.js"></script>
<script type="text/javascript">
$(document).ready(function($){

	$('#etalage').etalage({
		thumb_image_width: 300,
		thumb_image_height: 400,
		source_image_width: 900,
		source_image_height: 1200,
		show_hint: true,
		click_callback: function(image_anchor, instance_id){
			alert('回调函数:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
		}
	});

	$('#example2').etalage({
		thumb_image_width: 400,
		thumb_image_height: 400,
		source_image_width: 900,
		source_image_height: 900,
		zoom_area_height: 500,
		magnifier_invert: false,
		hide_cursor: true,
		icon_offset: 15,
		speed: 400
	});

	$('#example3').etalage({
		thumb_image_width: 250,
		thumb_image_height: 250,
		source_image_width: 900,
		source_image_height: 900,
		zoom_area_width: 500,
		zoom_area_height: 500,
		zoom_area_distance: 5,
		small_thumbs: 4,
		smallthumb_inactive_opacity: 0.3,
		smallthumbs_position: 'left',
		show_icon: false,
		autoplay: false,
		keyboard: false,
		zoom_easing: false
	});

});
</script>


</head>
<%int i=0,m=0;
String[] x= (String[])request.getAttribute("Colors");
Product pro = (Product)request.getAttribute("Product1");
m=x.length; 
%>
<body style="background-color:white">
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
	<div id="examples" style="float:left;">		
		<ul id="example2" style="float:left;">
			<li>
				<img class="etalage_thumb_image" src="pics/pic${Product1.productId}.png" />
				<img class="etalage_source_image" src="pics/pic${Product1.productId}.png" />
			</li>
		</ul>	
	</div>
	
	<div class="right" style="font-size:20px;border:solid 0px;height:450px;width:550px;float:right;margin-top:5px;">
    	<div style="margin:100px;">

			
    		<span style="heght:40px;width:300px;"></span>
    		
    		<div style="margin:10px;width:300px;color:black;font-size:20px">售价：<a style="color:red;font-size:40px">￥${Product1.price}</a></div>
    		<div style="margin:10px;width:300px;color:black;font-size:20px">颜色:
    		<table cellpadding="5"><tr>
    		<%while(x[i]!=null){
    		out.print("<td><form action='Product?action=changeP' method='post'><input type='hidden' name='productName' value='"+pro.getProductName()+"'/><input type='hidden' name='color' value='"+x[i]+"'/><input style='height:50px;width:70px;background:#aaaaaa;' type='submit' value='"+x[i]+"'/></form></td>");i=i+1;}%>
    		</tr></table>
    		</div>
    		<form action="Cart?action=add" method="post">
    		<div style="margin:10px;width:300px;color:black;font-size:20px">型号:
    		<input type="radio" name="size" value="s" style="width:50px;">S</input>
    		<input type="radio" name="size" value="m" style="width:50px;">M</input>
    		<input type="radio" name="size" value="l" style="width:50px;">L</input>
    		</div>
    		<div style="margin:10px;width:300px;color:black;font-size:20px">数量:
    		<input type="text" name="amount" style="width:60px;"/>
    		</div>
    		
    <div>
    		<input type="hidden" name="color" value="${ColorNow}" />
    		<input type="hidden" name="price" value="${Product1.price}" />
    		<input type="hidden" name="productName" value="${Product1.productName}" />
    		<input type="submit" value="加入购物车" class="pure-button pure-button-primary" />
    		</div>
         </form>
    	</div>
    </div> 

    	<HR width="95%"/>
    	<div class="down" style="font-size:14px;border:solid 0px;width:900px;float:left;margin-top:5px;">
    	<h4>产品描述：</h4>
    	<div style="margin:10px;width:300px;">${Product1.memo}<br>注意:请勿用力揉搓;轻柔反底洗涤。</div>
    	<HR width="95%" />
    	<h4>产品尺码表:</h4>
    	<table style="margin:10px;border:1px;">
    	<tr><th width="90px">尺码</th><th width="90px">型号</th><th 
width="90px">后衣长</th><th width="90px">1/2胸围</th><th 
width="90px">1/2下摆围</th><th width="90px">肩宽</th><th width="90px">袖长</th><th width="90px">1/2袖肥</th><th width="90px">1/2袖口</th></tr>

<tr><th>S</th><th>160/88A</th><th>66</th><th>50</th><th>49</th><th>44</th><th>21</th><th>19</th><th>16.5</th></tr>  
<tr><th>M</th><th>165/92A</th><th>68</th><th>52</th><th>51</th><th>45</th><th>21.5</th><th>19.5</th><th>17</th></tr>
<tr><th>L</th><th>170/96A</th><th>70</th><th>54</th><th>53</th><th>46</th><th>22</th><th>20</th><th>17.5</th></tr>
    	</table>	
    	</div>
    	<HR width="95%"/>
    	<h4>产品评价</h4>
    	<div class="comment">
			<table cellpadding="10">
				<c:forEach var="item" items="${requestScope.Comments}">
					<tr>
						<td style="width:150px;">用户:${item.userName}</td>
						<td style="width:150px;">商品评分:${item.grade}</td>
						<td style="width:600px;">${item.content}</td>
					</tr>
				</c:forEach>
			</table>
			<HR width="95%"/>
    	</div>
    </div>
</body>
</html>