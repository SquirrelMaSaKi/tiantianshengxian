<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/22
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="fr">
            <div class="login_btn fl">
                <em><shiro:user>欢迎您：<shiro:principal/><a style="text-decoration: none; margin-left: 5px" href="${pageContext.request.contextPath}/user/logout">退出</a></shiro:user></em>
            </div>
            <shiro:guest>
                <div class="login_btn fl">
                    <a href="${pageContext.request.contextPath}/user/login">登录</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/register">注册</a>
                </div>
            </shiro:guest>
            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.jsp">用户中心</a>
                <span>|</span>
                <a href="cart.jsp">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.jsp">我的订单</a>
            </div>
        </div>
    </div>
</div>

