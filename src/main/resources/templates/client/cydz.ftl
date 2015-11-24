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
      <a class="back" href="/center"></a>
      <p>常用地址</p>
     
    </header>
    <!-- 头部 END -->

    <!-- 常用地址 -->
    <article class="common-address">
      <section class="sct1">
        <p class="p1"><span><#if user??>${user.realName!''}</#if></span><span>${user.mobile!''}</span></p>
        <p class="p2"><#if user??>${user.shdz!''}</#if></p>
      </section>
    </article>
    <!-- 常用地址 END -->

    <!-- 底部 -->
    <footer class="bdt-n">
      <a class="add-address" href="/tjxdz">添加新地址</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>