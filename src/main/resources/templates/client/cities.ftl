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
      <img src="/client/images/icon_tips_city.png" alt="">
      <p>亲爱的用户<br>您所在的地方还未开通叫个厨子</p>
      <a class="city-sure" href="#" onclick="pupclose()">确定</a>
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
      <a class="back" href="/"></a>
      <p>选择城区</p>
    </header>
    <!-- 头部 END -->

    <article class="select-city">
      <section class="cur-city">
        <p>当前定位</p>
        <div>铜梁</div>
      </section>
      <section class="opened-city">
        <p>已开通城区</p>
        <div class="current">渝中区<i></i></div>
        <div>江北区<i></i></div>
        <div>沙坪坝区<i></i></div>
        <div>南岸区<i></i></div>
        <div>渝北区<i></i></div>
      </section>
    </article>

    <!-- 底部 
    <footer>
      <a href="#" class="a1 current-1">首页</a>
      <a href="#" class="a2">美食</a>
      <a href="#" class="a3">我</a>
    </footer>
     底部 END -->

</body>
</html>