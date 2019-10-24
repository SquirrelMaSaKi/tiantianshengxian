<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-ui.min.js"></script>

</head>
<body>
	<div id="headerDiv"></div>
	<div id="searchDiv"></div>
	<div id="fenleiheaderDiv"></div>



	<div class="breadcrumb">
		<a href="#">全部分类</a>
		<span>></span>
		<a href="#">${goodDetail.typename}</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix">
		<div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/resource/images/${goodDetail.imgdetail}"></div>

		<div class="goods_detail_list fr">
			<h3>${goodDetail.goodsname}</h3>
			<p>${goodDetail.subtitle}</p>
			<div class="prize_bar">
				<span class="show_pirze">¥<em>${goodDetail.price}</em></span>
				<span class="show_unit">单  位：500g</span>
			</div>
			<div class="goods_num clearfix">
				<div class="num_name fl">数 量：</div>
				<div class="num_add fl">
					<input type="text" class="num_show fl" value="1" id="counts">
					<a href="javascript:;" class="add fr" id="plus">+</a>
					<a href="javascript:;" class="minus fr" id="sub">-</a>
				</div> 
			</div>
			<div class="total">总价：<em id="totalPrice">${goodDetail.price} 元</em></div>
			<div class="operate_btn">
				<a href="javascript:;" class="buy_btn">立即购买</a>
				<a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
			</div>
		</div>
	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>

				<div id="newGoods"></div>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>

			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>${goodDetail.introduce}</dd>
				</dl>
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
	<div class="add_jump"></div>

	<script type="text/javascript">
		$(function () {
			var counts = 1;
            var price = '${goodDetail.price}';
            var total;
            $("#counts").blur(function () {
                counts = $("#counts").val();
                if(counts < 1){
                    counts = 1;
                }
                total = (price*counts).toFixed(2);
                $("#totalPrice").text(total+" 元");
                $("#counts").val(counts);
            });
            $("#plus").click(function () {
				counts++;
                total = (price*counts).toFixed(2);
                $("#totalPrice").text(total+" 元");
                $("#counts").val(counts);
            });
            $("#sub").click(function () {
                counts--;
                if(counts < 1){
                    counts = 1;
                }
                total = (price*counts).toFixed(2);
                $("#totalPrice").text(total+" 元");
                $("#counts").val(counts);
            });
        });



        $("#headerDiv").load("${pageContext.request.contextPath}/user/header");
        $("#searchDiv").load("${pageContext.request.contextPath}/user/searchHeader");
        $("#newGoods").load("${pageContext.request.contextPath}/goodsType/type?typeid=${goodDetail.typeid}");
        $("#fenleiheaderDiv").load("${pageContext.request.contextPath}/goodsType/fenleiheaderDiv");

		var $add_x = $('#add_cart').offset().top;
		var $add_y = $('#add_cart').offset().left;

		var $to_x = $('#show_count').offset().top;
		var $to_y = $('#show_count').offset().left;

		$(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
		$('#add_cart').click(function(){
            var counts = $("#counts").val();
			$(".add_jump").stop().animate({
				'left': $to_y+7,
				'top': $to_x+7},
				"fast", function() {
					$(".add_jump").fadeOut('fast',function(){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/cart/addCart",
                            type:"post",
                            data:"counts="+counts+"&gid=${goodDetail.id}",
							success:function (size) {
                                $('#show_count').html(size);
                            }
                        });
					});
			});
		})
	</script>
	
</body>
</html>