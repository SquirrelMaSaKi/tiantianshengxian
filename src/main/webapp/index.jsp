<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/slide.js"></script>
</head>
<body>
	<div id="headerDiv"></div>

	<div id="searchDiv"></div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="center_con clearfix">
		<div id="typeList"></div>

		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="${pageContext.request.contextPath}/resource/images/slide.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/resource/images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/resource/images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="${pageContext.request.contextPath}/resource/images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="#"><img src="${pageContext.request.contextPath}/resource/images/adv01.jpg"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resource/images/adv02.jpg"></a>
		</div>
	</div>

	<div id="listModel"></div>

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/slideshow.js"></script>--%>
	<script type="text/javascript">
		// BCSlideshow('focuspic');
		// var oFruit = document.getElementById('fruit_more');
		// var oShownum = document.getElementById('show_count');
		//
		// var hasorder = localStorage.getItem('order_finish');
		//
		// if(hasorder)
		// {
		// 	oShownum.innerHTML = '2';
		// }
		//
		// oFruit.onclick = function(){
		// 	window.location.href = 'list.jsp';
		// }

		$("#typeList").load("${pageContext.request.contextPath}/goodsType/typeList?id=1");
		$("#listModel").load("${pageContext.request.contextPath}/goodsType/typeList?id=2");
		$("#headerDiv").load("${pageContext.request.contextPath}/user/header");
        $("#searchDiv").load("${pageContext.request.contextPath}/user/searchHeader");
	</script>
</body>
</html>