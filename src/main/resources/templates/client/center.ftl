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

  <!-- 个人中心 -->
  <article class="mine-center">
    <!-- 个人信息 -->
    <div class="head-info">
      <div class="head-pho">
        <div class="div1">
          <!-- 图片原始尺寸 150*150-->
          <a href="/message"><img src="/client/images/head_portrait.jpg" alt="头像"></a>
          <div><a href="/message">
            <p class="p1 fz1-5 c-fff"><#if user??>${user.realName!''}</#if></p>
            <p class="p2 c-ccc">${user.mobile!''}</p>
          </a></div>
        </div>
        <div class="div2"><a href="/qmbj">
          <span>"</span>
          <span class="c-ccc"><#if user??>${user.qmbj!''}</#if></span>
        </a></div>
      </div>
      <!-- 消息提示 -->
      <div class="news-tip">
        <a href="/xxzx"><#if toRead??&&toRead?size gt 0><span></span></#if></a>
      </div>
    </div>

    <div class="clear"></div>

    <section class="sec1">
        <a href="/cydz">
          <div>
            常用地址
            <span class="c-ccc">&gt;</span>
          </div>
        </a>
   </section>

    <section class="sec2">
      <a href="/user/order">
      <div class="div1 bdbt">
        我的订单
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
      <a href="/wdsc">
      <div class="div2 bdbt">
        我的收藏
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
      <a href="/cart">
      <div class="div3">
        购物车
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
    </section>

    <section class="sec3">
      <a href="/coupon/list">
      <div class="div1 bdbt">
        优惠劵
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
      <a href="/hd">
      <div class="div2 bdbt">
        活动
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
      <a href="/kwhjj">
      <div class="div3">
        口味和忌口
        <span class="c-ccc">&gt;</span>
      </div>
      </a>
    </section>

  </article>

  <!-- 个人中心 END -->

  <div class="clear h50"></div>

  <!-- 底部 -->
  <footer>
   <a href="/" class="a1">首页</a>
      <a href="/food" class="a2">美食</a>
      <a href="/center" class="a3  current-3">我</a>
  </footer>
  <!-- 底部 END -->

</body>
</html>