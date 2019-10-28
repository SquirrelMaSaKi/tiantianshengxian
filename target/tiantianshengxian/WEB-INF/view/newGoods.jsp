<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/23
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul>
    <c:forEach items="${type.goods}" var="goods" end="1">
        <li>
            <a href="#"><img src="${pageContext.request.contextPath}/goodsimg/${goods.img}"></a>
            <h4><a href="#">${goods.goodsname}</a></h4>
            <div class="prize">￥${goods.price}</div>
        </li>
    </c:forEach>
</ul>
