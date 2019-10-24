<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-注册</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/register.js"></script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="${pageContext.request.contextPath}/resource/images/logo02.png"></a>
			<div class="reg_slogan">足不出户  ·  新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="${pageContext.request.contextPath}/user/login">登录</a>
			</div>
			<div class="reg_form clearfix">
				<form id="reg_form" method="post">
				<ul>
					<li>
						<label>用户名:</label>
						<input type="text" name="username" id="user_name">
						<span class="error_tip">提示信息</span>
					</li>					
					<li>
						<label>密码:</label>
						<input type="password" name="password" id="pwd">
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>确认密码:</label>
						<input type="password" name="repassword" id="cpwd">
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>邮箱:</label>
						<input type="text" name="email" id="email">
						<span class="error_tip">提示信息</span>
					</li>
					<li class="agreement">
						<input type="checkbox" name="allow" id="allow" checked="checked">
						<label>同意”天天生鲜用户使用协议“</label>
						<span class="error_tip2">提示信息</span>
					</li>
					<li class="reg_sub">
						<input type="submit" value="注 册" />
						<%--<button onclick="click1()" style="width:360px;height:40px;background-color:#47aa34;font-size:18px;color:#fff;font-family:'Microsoft Yahei';cursor:pointer;">注册</button>--%>
					</li>
				</ul>				
				</form>
			</div>

		</div>

	</div>

	<div class="footer no-mp">
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


</body>
</html>