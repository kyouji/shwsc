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
      <a class="btn-close" href="#" onclick="pupclose()">X</a>
      <div class="cut_price_pho">
        <div class="cut-price">
          <div class="money">￥<span>-18.00</span></div>
          <div class="cut">砍！</div>
        </div>
        <img src="images/cut_price_pho_1.png" alt=""> 
      </div>
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
      <a class="back" href="#"></a>
      <p>江湖逍遥宴砍价活动</p>
    </header>
    <!-- 头部 END -->

    <!-- 砍价活动 -->
    <article class="group-cut-activity">
      <div class="top-title">
        <div class="div1">
          <div class="div1-1">当前价格</div>
          <div class="div1-2">￥<span>76.00</span></div>
        </div>
        <div class="div2">参与人数：<b><span>2333</span>人</b></div>
        <div class="div3">
          <div class="div3-1">还能砍掉</div>
          <div class="div3-2">￥<span>76.00</span></div>
        </div>
      </div>
      <!-- 套餐 -->
      <div class="cut-packs">
        <!-- 图片尺寸 864*414 -->
        <a href="#"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
        <div class="introduction">
          <p class="title"><a href="#">江湖逍遥宴<span>（适合2-4人）</span></a></p>
          <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜,营养丰富。厨师免费，为满足喜欢体验“大快朵颐”感觉的食客</p>
        </div>
        <div class="cut-pack-price">
          <div class="price">底价：￥<span>10.00</span></div>
          <s class="c999">原价：￥<span>111.00</span></s>
        </div>
      </div>

      <!-- 按钮组 -->
      <a class="btn-help-cut-price" href="#" onclick="pupopen()"><i>&nbsp;</i>让开，我来砍</a>
    </article>
    <!-- 砍价活动 END -->

    <!-- 给力砍友 -->
    <article class="cutfriend">
      <section class="cut-friends">
        <div class="div1">
          <p class="p1">给力砍友（<span>2</span>）</p>
          <p class="p2">已砍<span>198</span>元</p>
        </div>
        <ul class="cut">
          <li>
            <!-- 图片原始尺寸 150*150-->
            <img width="44" height="44" class="head-photo" src="/client/images/head_portrait.jpg" alt="头像">
            <div class="friend">
              <div class="div1-1">
                <p class="p1">邓qq</p>
                <p class="p2">08:30</p>
              </div>
              <div class="div2-1">砍下<span>10</span>元</div>
            </div>
          </li>
          <li>
            <!-- 图片原始尺寸 150*150-->
            <img width="44" height="44" class="head-photo" src="/client/images/head_portrait.jpg" alt="头像">
            <div class="friend">
              <div class="div1-1">
                <p class="p1">邓qq</p>
                <p class="p2">08:30</p>
              </div>
              <div class="div2-1">砍下<span>10</span>元</div>
            </div>
          </li>
          <div class="tips">
            <p class="p1">显示全部帮帮好友</p>
            <p class="p2"><a href="#">&lt;</a></p>
          </div>
        </ul>
      </section>
    </article>
    <!-- 给力砍友 END -->

</body>
</html>