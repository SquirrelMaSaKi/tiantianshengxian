<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/23
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav">
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=1" class="fruit">新鲜水果</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=2" class="seafood">海鲜水产</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=3" class="meet">猪牛羊肉</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=4" class="egg">禽类蛋品</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=5" class="vegetables">新鲜蔬菜</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/goodsList?typeid=6" class="ice">速冻食品</a></li>
            </ul>
        </div>
        <ul class="navlist fl">
            <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>
