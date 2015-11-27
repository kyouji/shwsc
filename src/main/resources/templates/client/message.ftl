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
      <a class="back" href="/center"></a>
      <p>基本信息</p>
      <a class="save" href="/message_portrait">编辑</a>
    </header>
    <!-- 头部 END -->

    <!-- 头像和签名 -->
    <article class="head-signature">
      <!-- 图片原始尺寸 150*150-->
     <a href="/head_portrait"> <img src="/client/images/head_portrait.jpg" alt="头像"></a>
      <div class="div2">
        <span>"</span>
        <span class="c000">${user.qmbj!''}</span>
      </div>
    </article>
    <!-- 头像和签名 END -->

    <!-- 基本信息浏览 -->
    <article class="base-info-look">
      <section>
        <div class="div1">
          <label>昵称</label>
          <span>${user.nickname!''}</span>
          <!-- <input type="text" value="邓qq"> -->
        </div>
        <div class="div2">
          <label>手机</label>
          <span>${user.mobile!''}</span>
          <!-- <input type="text" value="13355023236"> -->
        </div>
        <div class="div3">
          <label>地址</label>
          <span>${user.detailAddress!''}</span>
          <!-- <input type="datetime-local"> -->
        </div>
        <div class="div4">
          <label>性别</label>
          <span>${user.sex!''}</span>
          <!-- <input type="text" value="重庆市沙坪坝区天星桥晒光平1号 21-8"> -->
        </div>
        <div class="div5">
          <label>职业</label>
          <span>${user.career!''}</span>
          <!-- <input type="text" value="重庆市沙坪坝区天星桥晒光平1号 21-8"> -->
        </div>
      </section>
    </article>
    <!-- 基本信息浏览 END -->

</body>
</html>