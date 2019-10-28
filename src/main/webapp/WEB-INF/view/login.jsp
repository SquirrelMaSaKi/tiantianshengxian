<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="login_top clearfix">
		<a href="${pageContext.request.contextPath}/index.jsp" class="login_logo"><img src="${pageContext.request.contextPath}/goodsimg/logo02.png"></a>
	</div>

	<div class="login_form_bg">
		<div class="login_form_wrap clearfix">
			<div class="login_banner fl"></div>
			<div class="slogan fl">日夜兼程 · 急速送达</div>
			<div class="login_form fr">
				<div class="login_title clearfix">
					<h1>用户登录</h1>
					<a href="${pageContext.request.contextPath}/user/register">立即注册</a>
				</div>
				<div class="form_input">
					<form id="form_login" action="${pageContext.request.contextPath}/user/login" method="post">
						<input type="text" name="username" class="name_input" placeholder="请输入用户名">
						<div class="user_error">输入错误</div>
						<input type="password" name="password" class="pass_input" placeholder="请输入密码">
						<div class="pwd_error">输入错误</div>
						<div style="position: absolute;left: 0;top: 120px;">
							<label style="font-size: 15px">验证码</label><input style="margin-left:5px;background: #fdfdfd;height: 20px;width: 100px;vertical-align: middle;" type="text" name="code" id="inputCode"> <img style="vertical-align: middle;" src="${pageContext.request.contextPath}/cap" onclick="refresh1(this)"><img style="vertical-align: middle;height: 15px;width: 15px;margin-left:5px;" src="#" hidden="true" id="panduan"/>
						</div>
						<div class="more_input clearfix">
							<input type="checkbox" name="rememberme">
							<label>记住用户名</label>
							<a href="#">忘记密码</a>
						</div>
						<input type="submit" name="" value="登录" class="input_submit" id="btn1" disabled="true">
					</form>
				</div>
				<div id="div1" style="color: red; margin-left: 10px; margin-top: -10px;font-size: 15px"></div>
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

<script type="text/javascript">
	function refresh1(a) {
		a.src = "${pageContext.request.contextPath}/cap?"+new Date().getTime();
    }

    $("#inputCode").blur(function () {
        var code = $("#inputCode").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/checkCode",
			type:"get",
			data:{"code":code},
			success:function (data) {
				if(data=='ok') {
				    $("#panduan").attr("src","${pageContext.request.contextPath}/goodsimg/duigou.jpg");
					$("#panduan").attr("hidden",false);
					$("#btn1").attr("disabled",false);
				}else if(data=='no') {
                    $("#panduan").attr("src","${pageContext.request.contextPath}/goodsimg/cuocha.jpg");
                    $("#panduan").attr("hidden",false);
                }
            }
        });
    });

	$("#form_login").submit(function () {
        $.post("${pageContext.request.contextPath}/user/login",$('#form_login').serialize(),function (data) {
            if (data=='ok'){
                alert("登录成功")
				location.href = "${pageContext.request.contextPath}/index.jsp";
            }
            $("#div1").append(data.msg);
        });
        return false;
    });


</script>
	
</body>
</html>