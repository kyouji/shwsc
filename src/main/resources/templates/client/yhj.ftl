<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!--css-->
<link rel="stylesheet" type="text/css" href="/client/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<title>优惠劵</title>
<script>
function request(couponId)
{
	 $.ajax({
        type:"post",
        url:"/coupon/request",
        data:{"couponId":couponId},
        success:function(data){
			if (data.code == 0)
			{
				alert("领取成功！");
				location.reload();
			}
			else
			{
				alert(data.msg);
			}
           
        }
    });
}
</script>
</head>
<body class="bgc-ccc">
    <!-- 头部 -->
    <header>
      <a class="back" href="/center"></a>
      <p>优惠劵</p>
    </header>
    <!-- 头部 END -->

    <!-- 优惠劵 -->
    <article class="coupon">
      <!--<div class="time"><#if today??>时间：${today?string("yyyy-MM-dd")}</#if></div>-->
      <ul class="group-coupon">
      	<#if coupon_list??>
      		<#list coupon_list as item>
		        <li>
		          <div class="price">
		            <span class="fz3 c-d50202">${item.price?c!'0'}</span>
		            <sup class="fz1-5">￥</sup>
		          </div>
		          <div class="coupon-info">
		            <div class="fz1-5 fw700">${item.typeTitle!''}</div>
		            <#if item.canUsePrice??&&item.canUsePrice gt 0>
		            <div>满<span>${item.canUsePrice?c!'0'}</span>元使用<#if item.leftNumber??>（<span>${item.leftNumber?c!''}</span>）</#if></div>
		            <#else>
		            <div>通用优惠券</div>
		            </#if>
		          </div>
		          <div class="clear"></div>
		          <div class="coupon-bg">
		            <img src="/client/images/coupon_bg.png" alt="" onclick="javascript:request(${item.id?c!''});" style="cursor:pointer;">
		          </div>
		        </li>
		    </#list>
		</#if>        
      </ul>
    </article>
    <!-- 优惠劵 END -->

</body>
</html>