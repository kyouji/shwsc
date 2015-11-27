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
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<title>叫个厨子</title>
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <header>
      <a class="back" href="javascript:history.go(-1);"></a>
      <p>评论</p>
    </header>
    <!-- 头部 END -->

    <!-- 评论 -->
    <article class="comment">
    <form action="/user/comment" method="post">
       <input type="hidden" value="${order.id?c}" name="id">
      <textarea placeholder="说一下你和厨师的那些事吧..." name="content"></textarea>
      <!-- 添加图片 -->
      <#--
      <div class="add-pho">
        <img width="40" height="auto" src="images/food_more_1.jpg" alt="添加图片">
        <a class="btn-add-photo" href="#">+</a>
      </div>
      -->
      <div class="clear"></div>

      <div class="submit-comment"><input type="submit" value="发表"></div>
    </form>
    </article>
    <!-- 评论 END -->

</body>
</html>