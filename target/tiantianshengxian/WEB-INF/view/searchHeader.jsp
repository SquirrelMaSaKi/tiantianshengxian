<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/23
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo fl"><img src="${pageContext.request.contextPath}/goodsimg/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品" id="searchGoods">
        <input type="button" class="input_btn fr" name="" value="搜索" id="btn1">
    </div>
    <div class="guest_cart fr">
        <a href="${pageContext.request.contextPath}/cart/showCart" class="cart_name fl">我的购物车</a>
        <shiro:user><div class="goods_count fl" id="show_count">${size}</div></shiro:user>
    </div>
</div>
<script type="text/javascript">
    $("#btn1").click(function () {
        var search = $("#searchGoods").val();
        location.href="${pageContext.request.contextPath}/goods/goodsList?condition="+search+"";
    });
</script>
