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
<body>
    <!-- 头部 -->
    <header>
      <a class="back" href="javascript:history.back(-1);"></a>
      <p>确认支付</p>
    </header>
    <!-- 头部 END -->

    <!-- 支付 -->
    <article class="pay-act">
      <div class="section div1-1">订单编号：<span>2015D731522940</span></div>
      <div class="section div2-1"><span>江湖逍遥宴</span>X<span>1</span></div>
      <div class="section div3-1">
        <p>已为你使用优惠券<span>200</span>元</p>
        <div id="div1" class="open1">
          <div id="div2" class="open2"></div>
        </div>
        <script type="text/javascript">
          window.onload=function(){
              var div2=document.getElementById("div2");
              var div1=document.getElementById("div1");
              div2.onclick=function(){
                div1.className=(div1.className=="close1")?"open1":"close1";
                div2.className=(div2.className=="close2")?"open2":"close2";
              }
          }
        </script>
      </div>
      <div class="section div4-1">支付方式<span>（请在30分钟以内完成支付）</span></div>
      <div class="section div5-1">
        <!-- 图片尺寸 32*32 -->
        <img width="32" height="32" src="/client/images/icon_weixinzhifu.png" alt="微信支付">
        <p>微信支付</p>
        <input type="checkbox">
      </div>
      <div class="section div5-1">
        <!-- 图片尺寸 32*32 -->
        <img width="32" height="32" src="/client/images/icon_zhifubao.png" alt="微信支付">
        <p>支付宝支付</p>
        <input type="checkbox">
      </div>
      <div class="div7-1">
        <div class="order-price">
          <p>砍后价：￥<span>100.00</span></p>
          <s class="c999">原价：￥<span>200.00</span></s>
        </div>
        <a class="btn-order-now" href="#">立即支付</a> 
      </div>
    </article>
    <!-- 支付 END -->

</body>
</html>