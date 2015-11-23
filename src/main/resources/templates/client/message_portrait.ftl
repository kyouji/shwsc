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
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<title>叫个厨子</title>
</head>
<body>
    <!-- 头部 -->
    <header>
      <a class="back" href="/message"></a>
      <p>基本信息</p>
      <a class="save" href="/user/save">保存</a>
    </header>
    <!-- 头部 END -->

    <!-- 头像和签名 -->
    <article class="head-signature">
      <!-- 图片原始尺寸 150*150-->
      <a href="用户头像编辑.html"><img src="/client/images/head_portrait.jpg" alt="头像"></a>
      <div class="div2"><a href="/qmbj">
        <span>"</span>
        <span class="c000">美食签名可以提高你的逼格哦~asdfasdf</span>
      </a></div>
    </article>
    <!-- 头像和签名 END -->

    <!-- 基本信息浏览 -->
    <from id="form1" action="/user/info" method="post">
    <article class="base-info-look">
      <section>
        <div class="div1">
          <label>昵称</label>
          <!-- <span>邓qq</span> -->
          <input type="text" name="nickname" value="邓qq">
        </div>
        <div class="div2">
          <label>手机号</label>
          <!-- <span>13355023236</span> -->
          <input type="text" name="mobile" value="13355023236">
        </div>
        <div class="div3">
          <label>地址</label>
          <!-- <span>重庆市沙坪坝区天星桥晒光平1号 21-8</span> -->
          <input type="text" name="detailAddress">
        </div>
        <div class="div4">
          <label>性别</label>
          <!-- <span>女</span> -->
          <select  name="sex">
            <option value="man">男</option>
            <option value="woman">女</option>
          </select>
        </div>
        <div class="div5">
          <label>职业</label>
          <!-- <span>医生</span> -->
          <select>
            <input type="text"  name="career">
          </select>
        </div>
      </section>
    </article>
    </from>
    <!-- 基本信息浏览 END -->

</body>
</html>