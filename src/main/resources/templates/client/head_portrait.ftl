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
<body class="bgc-eee">
    <!-- 头部 -->
    <header>
      <a class="back" href="/message"></a>
      <p>头像编辑</p>
      
    </header>
    <!-- 头部 END -->

    <!-- 头像编辑 -->
    <article class="head-edit">
    <form action="/save/head" method="post" id="form1">
      <section class="sec1">
        <label>头像</label>
        <a href="#"><img src="/client/images/head_portrait.jpg" alt="头像编辑"></a>
      </section>
      <section class="sec2">
        <label>用户名</label>
        <input type="text" placeholder="" name="realName">
      </section>
       <input  class="btn-submit" type="submit" value="提交">
       </form>
    </article>
    <!-- 头像编辑 END -->

</body>
</html>