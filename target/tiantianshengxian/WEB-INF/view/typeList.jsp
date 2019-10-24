<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/23
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <ul class="subnav fl">
        <%--<li><a href="#model01" class="fruit">新鲜水果</a></li>--%>
        <%--<li><a href="#model02" class="seafood">海鲜水产</a></li>--%>
        <%--<li><a href="#model03" class="meet">猪牛羊肉</a></li>--%>
        <%--<li><a href="#model04" class="egg">禽类蛋品</a></li>--%>
        <%--<li><a href="#model05" class="vegetables">新鲜蔬菜</a></li>--%>
        <%--<li><a href="#model06" class="ice">速冻食品</a></li>--%>
        <c:forEach items="${typeList}" var="list1">
            <li><a href="#model0${list1.id}" class=${list1.icon}>${list1.typename}</a></li>
        </c:forEach>
    </ul>
