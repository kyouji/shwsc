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
<title>叫个厨子</title>
<script type="text/javascript">
  var price = ${good.salePrice};
  var number=1;
function submitForm()
{
    document.getElementById('form').submit();
}
function addNumber()
{
    number++;
    document.getElementById('twa-1').innerHTML++;
    document.getElementById('twa-2').innerHTML++;
    document.getElementById('total').innerHTML=price*number;
    document.getElementById('totalPrice').innerHTML=price*number;
    document.getElementById('buynumber').value = number;
}
function desNumber()
{
    if(number == 1)
    return;
    
    number--;
    document.getElementById('twa-1').innerHTML--;
    document.getElementById('twa-2').innerHTML--;
    document.getElementById('total').innerHTML=price*number;
    document.getElementById('totalPrice').innerHTML=price*number;
    document.getElementById('buynumber').value = number;
}
</script>
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <header>
      <a class="back" href="/food/showdishes?goodId=${good.id}"></a>
      <p>提交订单</p>
    </header>
    <!-- 头部 END -->

    <!-- 套餐信息 -->
    <article class="submit-order">
      <#--<div class="go-package-details"><a href="/food/buydetail?id=${good.id}">-->
      <div class="go-package-details"><a href="javascript:void();">
        <span class="span1">套餐详情</span>
        <!--<span class="span2">&gt;</span>-->
      </a></div>
      <section class="sct1">
        <div class="div1">
          <!-- 图片原始尺寸 864*414-->
          <img width="90" height="60" src="<#if good.coverImageUri??&&good.coverImageUri != "">${good.coverImageUri}<#else>/client/images/package_details_photo_1.jpg</#if>" alt="${good.title!''}">
          <div class="detail">
            <div class="title">
              <span class="span1">${good.title!''}</span>
              <#assign Strlenght = good.paramValueCollect?length>
              <span class="span2">${good.paramValueCollect[0..Strlenght-2]}人</span>
            </div>
            <div class="number">
              <p class="p1">￥<span><#if good.salePrice??>${good.salePrice?string("0.00")}<#else>0</#if></span></p>
              <p class="p2">
                <span>数量：</span>
                <a class="tw_a1" onclick="desNumber();">-</a>
                <em id="twa-1">1</em>
                <a class="tw_a2" onclick="addNumber();">+</a>
              </p>
            </div>
          </div>
        </div>
        <div class="div2">
          <p class="p1">共<span id="twa-2">1</span>个套餐</p>
          <p class="p2">合计&nbsp;&nbsp;&nbsp;&nbsp;￥<span id="total">298</span></p>
        </div>
      </section>
    </article>
    <!-- 套餐信息 END -->

    <!-- 用餐信息 -->
    <form id="form" action="/order/buysubmit" method="POST">
    <input type="hidden" name="goodId" value="${good.id}">
    <input type="hidden" name="range" value="${good.paramValueCollect[0..Strlenght-2]}">
    <input type="hidden" name="quantity" id="buynumber" value="1">
    <article class="dining-info-edit">
    <section>
      <div class="div1">
        <p class="fz1-3">用餐信息</p>
      </div>
      <ul class="taste-group">
        <li><input type="radio" value="0" checked="true" name="taste">微辣</li>
        <li><input type="radio" value="1" name="taste">中辣</li>
        <li><input type="radio" value="2" name="taste">特辣</li>
      </ul>
      <p class="chef-recommended">推荐厨师：李浩</p>
      <div class="service-way">
        <p class="p1"><input type="radio" value="0" checked="true" name="tool">&nbsp;&nbsp;平台配送餐具</p>
        <p class="p2 c999"><input type="radio" value="1" name="tool">&nbsp;&nbsp;厨师自带厨具</p>
      </div>
      <div class="div1">
          <label>姓名</label>
          <input type="text" name="shippingName" placeholder="请填写收货人" value="邓qq">
        </div>
        <div class="div2">
          <label>电话</label>
          <input type="text" name="shippingPhone" placeholder="请填写电话" value="13355023236">
        </div>
        <div class="div3">
          <label>用餐时间</label>
          <input type="datetime-local" name="appointmentTime">
        </div>
        <div class="div4">
          <label>用餐地点</label>
          <input type="text" name="shippingAddress" placeholder="请填写地址" value="重庆市沙坪坝区天星桥晒光平1号 21-8">
        </div>
      </section>
      <p>备注</p>
      <textarea placeholder="有什么需要就给厨师留言吧~"></textarea>
    </article>
    </form>
    <!-- 用餐信息 END-->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <div class="total-1">总金额：<span class="cf93">￥<span id="totalPrice">128.00</span></span></div>
      <a class="clearing" href="javascript:submitForm();">提交订单</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>