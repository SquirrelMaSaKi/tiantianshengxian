<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
	<%--<link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet"/>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div id="searchDiv"></div>
	<div id="fenleiheaderDiv"></div>


	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">${typename}</a>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<c:forEach items="${pageBean.list}" var="goods" end="1">
						<li>
							<a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}"><img src="${pageContext.request.contextPath}/resource/images/goods/${goods.img}"></a>
							<h4><a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}">${goods.goodsname}</a></h4>
							<div class="prize">${goods.price}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="${pageContext.request.contextPath}/goods/goodsList?typeid=${typeid}" id="moren">默认</a>
				<a href="${pageContext.request.contextPath}/goods/goodsList?typeid=${typeid}&condition=price" id="jiage">价格</a>
				<a href="${pageContext.request.contextPath}/goods/goodsList?typeid=${typeid}&condition=hot" id="renqi">人气</a>
			</div>

			<ul class="goods_type_list clearfix">
				<c:forEach items="${pageBean.list}" var="goods">
					<li>
						<a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}"><img src="${pageContext.request.contextPath}/resource/images/goods/${goods.img}"></a>
						<h4><a href="${pageContext.request.contextPath}/goods/goodDetail?goodId=${goods.id}">${goods.goodsname}</a></h4>
						<div class="prize">${goods.price}</div>
					</li>
				</c:forEach>
			</ul>

			<div class="pagenation">
				<a href="${pageContext.request.contextPath}/goods/goodsList?pageNum=${pageBean.prePage}&typeid=${typeid}&condition=${condition}">《上一页</a>
				<c:forEach var="i" begin="${pageBean.navigateFirstPage}" end="${pageBean.navigateLastPage}" step="1">
					<c:if test="${i!=pageBean.pageNum}">
						<a href="${pageContext.request.contextPath}/goods/goodsList?pageNum=${i}&typeid=${typeid}&condition=${condition}" class="active">${i}</a>
					</c:if>
					<c:if test="${i==pageBean.pageNum}">
						<a href="#" class="active">${i}</a>
					</c:if>
				</c:forEach>
				<a href="${pageContext.request.contextPath}/goods/goodsList?pageNum=${pageBean.nextPage}&typeid=${typeid}&condition=${condition}">下一页》</a>
			</div>
		</div>
	</div>

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
	<script type="text/javascript">
        $("#fenleiheaderDiv").load("${pageContext.request.contextPath}/goodsType/fenleiheaderDiv");
        $("#headerDiv").load("${pageContext.request.contextPath}/user/header");
        $("#searchDiv").load("${pageContext.request.contextPath}/user/searchHeader");

        $(function () {
            if(${condition eq 'price'}){
                $("#jiage").addClass("active");
            } else if(${condition eq 'hot'}){
                $("#renqi").addClass("active");
            }else{
                $("#moren").addClass("active");
            }
        })
	</script>
</body>
</html>