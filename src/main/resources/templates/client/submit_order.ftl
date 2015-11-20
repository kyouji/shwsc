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
      <a class="back" href="/food/showdishes?goodId=${good.id}"></a>
      <p>提交订单</p>
    </header>
    <!-- 头部 END -->

    <!-- 套餐信息 -->
    <article class="submit-order">
      <div class="go-package-details"><a href="/food/buydetail?id=${good.id}">
        <span class="span1">套餐详情</span>
        <span class="span2">&gt;</span>
      </a></div>
      <section class="sct1">
        <div class="div1">
          <!-- 图片原始尺寸 864*414-->
          <img width="90" height="60" src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴">
          <div class="detail">
            <div class="title">
              <span class="span1">${good.title!''}</span>
              <#assign Strlenght = good.paramValueCollect?length>
              <span class="span2">${good.paramValueCollect[0..Strlenght-2]}人</span>
              <span class="span3">微辣型</span>
            </div>
            <div class="number">
              <p class="p1">￥<span><#if good.salePrice??>${good.salePrice?string("0.00")}<#else>0</#if></span></p>
              <p class="p2">
                <span>数量：</span>
                <a class="tw_a1" onclick="document.getElementById('twa-1').innerHTML--">-</a>
                <em id="twa-1">1</em>
                <a class="tw_a2" onclick="document.getElementById('twa-1').innerHTML++">+</a>
              </p>
            </div>
          </div>
        </div>
        <div class="div2">
          <p class="p1">共<span>1</span>个套餐</p>
          <p class="p2">合计&nbsp;&nbsp;&nbsp;&nbsp;￥<span>298</span></p>
        </div>
      </section>
    </article>
    <!-- 套餐信息 END -->

    <!-- 用餐信息 -->
    <article class="dining-info">
      <div class="div1">
        <p class="fz1-3">用餐信息</p>
        <a class="edit" href="/food/user/information?id=${good.id}">编辑</a>
      </div>
      <div class="div2">
        <label>姓名</label>
        <span></span>
        <!-- <input type="text"> -->
      </div>
      <div class="div3">
        <label>电话号码</label>
        <span>13355023236</span>
        <!-- <input type="text" value="13355023236"> -->
      </div>
      <div class="div4">
        <label>用餐时间</label>
        <span></span>
        <!-- <input type="text"> -->
        <!-- <input type="datetime-local"> -->
      </div>
      <div class="div5">
        <label>用餐地点</label>
        <span>重庆市沙坪坝区天星桥晒光平1号 21-8</span>
        <!-- <input type="text" value="重庆市沙坪坝区天星桥晒光平1号 21-8"> -->
      </div>
      <div class="div6">
        <label>备注</label>
        <span>不要花椒、辣椒</span>
        <!-- <input type="text" value="不要花椒、辣椒"> -->
      </div>
    </article>
    <!-- 用餐信息 END-->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <div class="total-1">总金额：<span class="cf93">￥<span>128.00</span></span></div>
      <a class="clearing" href="/food/pay">立即支付</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>