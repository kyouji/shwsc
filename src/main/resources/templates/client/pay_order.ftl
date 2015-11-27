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
<script language="javascript" src="http://res.mail.qq.com/mmr/static/lib/js/jquery.js" type="text/javascript"></script>
<script language="javascript" src="http://res.mail.qq.com/mmr/static/lib/js/lazyloadv3.js" type="text/javascript"></script>
<script type="text/javascript">
function onBridgeReady(){
    var data = {
            "appId": "${appId}", //公众号名称，由商户传入
            "timeStamp": "${timeStamp}", //时间戳
            "nonceStr": "${nonceStr}", //随机串
            "package": "${package}",//扩展包
            "signType": "MD5", //微信签名算法：MD5
            "paySign": "${paySign}" //微信签名
        };
   WeixinJSBridge.invoke(
       'getBrandWCPayRequest', data,
       function(res){
           if(res.err_msg == "get_brand_wcpay_request:ok" ) {
            alert("支付成功");
            window.location.href="/user/order?orderid=${orderId}";
             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
           }
           else if (res.err_msg == "get_brand_wcpay_request:cancel")
           {
               alert("取消支付！");
               window.location.href="/user/order?orderid=${orderId}";
           }
           else{
               alert("支付失败！");
               window.location.href="/user/order?orderid=${orderId}";
           }
       }
   );
}
if (typeof WeixinJSBridge == "undefined"){
   if( document.addEventListener )
   {
       document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
   }
   else if (document.attachEvent)
   {
       document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
       document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
   }
}
else
{
   onBridgeReady();
}

</script>
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
      <div class="section div1-1">订单编号：<span>${order.orderNumber!''}</span></div>
      <div class="section div2-1"><span>${order.goodTitle!''}</span>X<span>${order.quantity!'1'}</span></div>
      <div class="section div3-1">
        <!--<p>已为你使用优惠券<span>200</span>元</p>
        <div id="div1" class="open1">
          <div id="div2" class="open2"></div>
        </div>-->
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
        <!--<input type="checkbox">-->
      </div>
      <!--<div class="section div5-1">
        <!-- 图片尺寸 32*32 
        <img width="32" height="32" src="/client/images/icon_zhifubao.png" alt="微信支付">
        <p>支付宝支付</p>
        <input type="checkbox">
      </div>-->
      <div class="div7-1">
        <div class="order-price">
          <p>支付金额：￥<span>${order.totalPrice?string('0.00')}</span></p>
          <!-- <s class="c999">支付金额：￥<span>200.00${order.totalPrice}</span></s>-->
        </div>
        <a class="btn-order-now" href="javascript:onBridgeReady();">立即支付</a> 
      </div>
    </article>
    <!-- 支付 END -->

</body>
</html>