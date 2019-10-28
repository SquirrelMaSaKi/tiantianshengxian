<%--
  Created by IntelliJ IDEA.
  User: 海马哥
  Date: 2019/10/23
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <c:forEach var="type" items="${typeList}">
        <div class="list_model">
            <div class="list_title clearfix">
                <h3 class="fl" id="model0${type.id}">${type.typename}</h3>

                <div class="subtitle fl">
                    <c:forEach items="${type.goods}" var="goods" end="2">
                        <span>|</span>
                        <a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}">${goods.goodsname}</a>
                    </c:forEach>
                </div>

                <a href="${pageContext.request.contextPath}/goods/goodsList?typeid=${type.id}" class="goods_more fr" id="fruit_more">查看更多 ></a>
            </div>

            <div class="goods_con clearfix">
                <div class="goods_banner fl"><img src="${pageContext.request.contextPath}/goodsimg/${type.headimg}"></div>

                <ul class="goods_list fl">
                    <c:forEach items="${type.goods}" var="goods">
                        <li>
                            <h4><a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}">${goods.goodsname}</a></h4>
                            <a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}"><img src="${pageContext.request.contextPath}/goodsimg/${goods.img}"></a>
                            <div class="prize">¥ ${goods.price}</div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </c:forEach>
