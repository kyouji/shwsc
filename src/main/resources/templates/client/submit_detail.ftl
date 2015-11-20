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
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <header>
      <a class="back" href="javascript:history.back(-1);"></a>
      <p>订单详情</p>
    </header>
    <!-- 头部 END -->

    <!-- 订单详情 -->
    <article class="theme-packages order-details">
      <section class="package">
        <!-- 图片尺寸 864*414 -->
        <a href="#"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
        <div class="introduction"><#assign Strlenght = good.paramValueCollect?length>
          <p class="title"><a href="#">${good.title!''}<span>（适合${good.paramValueCollect[0..Strlenght-2]}人）</span></a></p>
          <p class="itdt">${good.subTitle!''}</p>
        </div>
        <div class="price">
          <p class="p1">( 适合${good.paramValueCollect[0..Strlenght-2]}人 )</p>
          <p class="p2">￥<span><#if good.salePrice??>${good.salePrice?string("0.00")}<#else>0</#if></span></p>
        </div>
      </section>

      <!-- 口味和数量 -->
      <section class="taste-num">
        <div class="taste-num-box">          
          <p class="taste fz1-3">口味</p>
          <ul class="taste-group">
            <li><a class="c333 current" href="#">微辣</a></li>
            <li><a class="c333" href="#">中辣</a></li>
            <li><a class="c333" href="#">特辣</a></li>
          </ul>
          <div class="num">
            <span>数量</span>
            <p class="num-group">
              <a class="tw_a1" onclick="document.getElementById('twa-1').innerHTML--">-</a>
              <em id="twa-1">1</em>
              <a class="tw_a2" onclick="document.getElementById('twa-1').innerHTML++">+</a>
            </p>
          </div>
        </div>

        <p class="chef-recommended">推荐厨师：李浩</p>

        <div class="service-way">
          <p class="p1"><input type="radio">&nbsp;&nbsp;平台配送餐具</p>
          <p class="p2 c999"><input type="radio">&nbsp;&nbsp;厨师自带厨具</p>
        </div>

      </section>
      <!-- 口味和数量 END-->

      <!-- 给力砍友 -->
      <section class="cut-friends">
        <div class="div1">
          <p class="p1">给力砍友（<span>2</span>）</p>
          <p class="p2">已砍<span>198</span>元</p>
        </div>
        <ul class="cut">
          <li>
            <!-- 图片原始尺寸 150*150-->
            <img width="44" height="44" class="head-photo" src="/client/images/head_portrait.jpg" alt="头像">
            <div class="friend">
              <div class="div1-1">
                <p class="p1">邓qq</p>
                <p class="p2">08:30</p>
              </div>
              <div class="div2-1">砍下<span>10</span>元</div>
            </div>
          </li>
          <li>
            <!-- 图片原始尺寸 150*150-->
            <img width="44" height="44" class="head-photo" src="/client/images/head_portrait.jpg" alt="头像">
            <div class="friend">
              <div class="div1-1">
                <p class="p1">邓qq</p>
                <p class="p2">08:30</p>
              </div>
              <div class="div2-1">砍下<span>10</span>元</div>
            </div>
          </li>
          <div class="tips">
            <p class="p1">显示全部帮帮好友</p>
            <p class="p2"><a href="#">&lt;</a></p>
          </div>
        </ul>
      </section>
      <!-- 给力砍友 END -->
    </article>
    <!-- 订单详情 END -->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <a class="determine" href="/food/buy?id=${good.id}">确定</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>