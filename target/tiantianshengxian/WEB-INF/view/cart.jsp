<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui.min.js"></script>
</head>
<body>
	<div id="headerDiv"></div>
	<div id="searchDiv"></div>


	<div class="total_count">全部商品<em>${size}</em>件</div>
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	<c:forEach items="${carts}" var="c">
		<ul class="cart_list_td clearfix" id="ul${c.gid}">
			<li class="col01"><input type="checkbox" name="checkcart" checked="true" id="check${c.gid}" onclick="checkCart(${c.gid},${gids})"></li>
			<li class="col02"><img src="${pageContext.request.contextPath}/resource/images/goods/${c.goods.img}"></li>
			<li class="col03">${c.goods.goodsname}<br><em>${c.goods.price}元/500g</em></li>
			<li class="col04">500g</li>
			<li class="col05">${c.goods.price}元</li>
			<li class="col06">
				<div class="num_add">
					<a href="javascript:;" class="add fl"  onclick="jian(${c.gid},${c.goods.price})">-</a>
					<input type="text" class="num_show fl" value="${c.num}" id="num${c.gid}" onblur="blurNum(${c.gid},${c.goods.price})">
					<a href="javascript:;" class="minus fl" onclick="jia(${c.gid},${c.goods.price})">+</a>
				</div>
			</li>
			<li class="col07" id="total${c.gid}" value="${c.money}">${c.money}元</li>
			<li class="col08"><a  href="javascript:;" onclick="deleteCart(${c.gid})">删除</a></li>
		</ul>
	</c:forEach>


	<ul class="settlements">
		<li class="col01"><input type="checkbox" checked="true" id="checkall" onclick="checkAll(${gids})"></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em id="subMoney" >${subMoney}</em><br>共计<b id="subNum">${size}</b>件商品</li>
		<li class="col04"><a href="place_order.jsp">去结算</a></li>
	</ul>

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
        $("#headerDiv").load("${pageContext.request.contextPath}/user/header");
        $("#searchDiv").load("${pageContext.request.contextPath}/user/searchHeader");

        function deleteCart(gid){
            if(confirm("确认要删除吗？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/delete",
                    type:"post",
                    data:"gid="+gid,
					success:function () {
						$("#ul"+gid).toggle(600);
                    }
                });
            }
		}

		function jian(gid,price) {
			var counts = $("#num"+gid).val();
			var num = counts*1-1;
			if (num < 1) {
                if(confirm("确认要删除吗？")){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/delete",
                        type:"post",
                        data:"gid="+gid,
                        success:function () {
                            $("#ul"+gid).toggle(600);
                        }
                    });
                }
			} else {
                $("#num"+gid).val(num);
                var totalMoney = (num*1*price).toFixed(2);
                $("#total"+gid).text(totalMoney+"元");
                var subPriceText = $("#subMoney").text();
                var subPrice = parseFloat(subPriceText);
                var sub = subPrice*1-price*1;
                $("#subMoney").text(sub.toFixed(2));
			}
        }
		function jia(gid,price) {
			var counts = $("#num"+gid).val();
			var num = counts*1+1;
			$("#num"+gid).val(num);
            var totalMoney = (num*1*price).toFixed(2);
            $("#total"+gid).text(totalMoney+"元");
            var subPriceText = $("#subMoney").text();
            var subPrice = parseFloat(subPriceText);
            var sub = subPrice*1+price*1;
            $("#subMoney").text(sub.toFixed(2));
        }

        function blurNum(gid,price) {
			var counts = $("#num"+gid).val();
			var orginalTotalMoney = $("#total"+gid).val();
			if (counts*1 < 1) {
				if(confirm("确认要删除吗？")){
					$.ajax({
						url:"${pageContext.request.contextPath}/cart/delete",
						type:"post",
						data:"gid="+gid,
						success:function () {
							$("#ul"+gid).toggle(600);
						}
					});
				}
			}
			$("#num"+gid).val(counts);
            var totalMoney = (counts*1*price).toFixed(2);
            $("#total"+gid).text(totalMoney+"元");

            var differ = totalMoney-orginalTotalMoney;
            var subPriceText = $("#subMoney").text();
            var subPrice = parseFloat(subPriceText);
            var sub = subPrice*1+differ*1;
            $("#subMoney").text(sub.toFixed(2));
		}
		
		function checkAll(gids) {
			var checkall = document.getElementById("checkall");
			var checkcart = document.getElementsByName("checkcart");
			var subNum=0;
			var subMoney=0;
			if (checkall.checked == true) {
				for(var i=0;i<checkcart.length;i++) {
					checkcart[i].checked=true;
                    subNum =  subNum + 1;
				}
                for(var j in gids){
                    var index = gids[j];
                    var money = $("#total"+index).val();
                    subMoney = money*1 + subMoney;
                }
				$("#subMoney").text(subMoney.toFixed(2));
				$("#subNum").text(subNum);
			}else {
				for(var i=0;i<checkcart.length;i++) {
					checkcart[i].checked=false;
				}
                $("#subMoney").text("0.00");
                $("#subNum").text(0);
			}
        }

        function checkCart(gid,gids) {
            var checkall = document.getElementById("checkall");
            var cart;
            checkall.checked = false;
            var subnum=0;
            var subMoney=0;

            for (var i in gids) {
                cart = document.getElementById("check"+gids[i]);
                if(cart.checked == true){
                    subnum=subnum+1;
                    var money = $("#total"+gids[i]).val();
                    subMoney = subMoney + money;
				}
			}
            $("#subMoney").text(subMoney.toFixed(2));
            $("#subNum").text(subnum);
        }

        function freshSql() {
            var gids = <%=request.getAttribute("gids")%>;
            for(var i in gids){
                var gid=gids[i];
                var counts = $("#num"+gid).val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/addCartSql",
                    type:"post",
                    data:"gid="+gid+"&counts="+counts
                })
			}
        }

        $(function () {
			window.setInterval("freshSql()",120000);
            window.onunload=function (ev) {
                freshSql();
            }
            window.onunload=function (ev) {
                freshSql();
			}
        });
	</script>
</body>
</html>