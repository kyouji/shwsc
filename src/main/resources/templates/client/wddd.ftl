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

  <!--弹窗-->
  <div id="bg"></div>
  <div id="popbox">
    <p class="share-friend">分享到朋友圈帮你砍价</p>
    <a class="btn-sure" href="#" onclick="pupclose()">确定</a>  
  </div>
  <script type="text/javascript">
      function pupopen(){
          document.getElementById("bg").style.display="block";
          document.getElementById("popbox").style.display="block" ;
      }
      function pupclose(){
          document.getElementById("bg").style.display="none";
          document.getElementById("popbox").style.display="none" ;
      }
  </script>
  <!--弹窗 END-->

    <!-- 头部 -->
    <header>
      <a class="back" href="/center"></a>
      <p>我的订单</p>
      <a class="share" href="#" onclick="pupopen()"></a>
    </header>
    <!-- 头部 END -->

    <!-- 套餐信息 -->
    <article class="mine-order">
      <div class="tab-view">
        <ul class="title-1">
          <li class="active"><a href="#">全部</a></li>
          <li><a href="#">待付款</a></li>
          <li><a href="#">已付款</a></li>
        </ul>
        <ul class="tab-content">
          <!-- 全部 -->
          
          <#if order_page??>
          <#list order_page.content as item>
          <li>
          <section class="sct1">
              <div class="div1">
                <!-- 图片原始尺寸 864*414-->
                <img width="90" height="60" src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴">
                <div class="detail">
                  <div class="title">
                    <span class="span1">江湖逍遥宴3</span>
                    <span class="span2">4-8人</span>
                    <span class="span3">微辣型</span>
                  </div>
                  <div class="number">
                    <p class="p1">￥<span>128.00</span></p>
                    <p class="p2">
                      <span>数量：1</span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="div2">
                <p class="p1">共<span>1</span>个套餐</p>
                <p class="p2">合计&nbsp;&nbsp;&nbsp;&nbsp;￥<span>298</span></p>
              </div>
            </section>
            <div class="order-btn-group">
              <a class="" href="#">砍价</a>
              <a class="" href="#">取消</a>
              <a class="current" href="#">付款</a>
            </div>
            </li>
          </#list>
          </#if>
    </article>
    <!-- 套餐信息 END -->

    <div class="clear h50"></div>

    <!-- 底部 --
    <footer>
      <div class="total-1">总金额：<span class="cf93">￥<span>128.00</span></span></div>
      <a class="clearing" href="#">立即支付</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>