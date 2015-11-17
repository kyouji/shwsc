<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!--css-->
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>叫个厨子</title>
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <header>
      <a class="back" href="#"></a>
      <p>新品美食</p>
    </header>
    <!-- 头部 END -->

    <!-- banner -->
    <div class="addWrap">
      <div class="swipe" id="mySwipe">
        <div class="swipe-wrap">
          <div><a href="#">
            <img class="img-responsive" src="images/1.jpg"/>
            <span class="note">每日新品最先吃</span>
          </a></div>
          <div><a href="#">
            <img class="img-responsive" src="images/2.jpg"/>
            <span class="note">每日新品最先吃</span>
          </a></div>
          <div><a href="#">
            <img class="img-responsive" src="images/3.jpg"/>
            <span class="note">每日新品最先吃</span>
          </a></div>
        </div>
      </div>
      <ul id="position">
        <li class="cur"></li>
        <li class=""></li>
        <li class=""></li>
      </ul>
    </div>
    <script src="js/swipe.js"></script> 
    <script type="text/javascript">
      var bullets = document.getElementById('position').getElementsByTagName('li');
      var banner = Swipe(document.getElementById('mySwipe'), {
        auto: 2000,
        continuous: true,
        disableScroll:false,
        callback: function(pos) {
            var i = bullets.length;
            while (i--) {
              bullets[i].className = ' ';
            }
            bullets[pos].className = 'cur';
        }
      });
    </script>
    <!-- bannner END -->

    <!-- 套餐主题 -->
    <article class="theme-packages">
      <p class="package-introduction">每日新品试吃，好不好吃你说了算。价格绝对公平只为给你最新鲜的体验。</p>
      <section>
        <div class="filter-group">
          <a class="current" href="#">全部</a>
          <a href="#">2~4人</a>
          <a href="#">4~8人</a>
          <a href="#">8~12人</a>
        </div>
      </section>
      <section class="package">
        <!-- 图片尺寸 864*414 -->
        <a href="#"><img src="images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
        <div class="introduction">
          <p class="title"><a href="#">江湖逍遥宴<span>（适合2-4人）</span></a></p>
          <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜，营养丰富。</p>
          <p class="follow">150</p>
        </div>
        <div class="price">
          <p class="p1"><span>9.8</span>分</p>
          <p class="p2">￥<span>298.00</span></p>
        </div>
      </section>
      <section class="package">
        <!-- 图片尺寸 864*414 -->
        <a href="#"><img src="images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
        <div class="introduction">
          <p class="title"><a href="#">江湖逍遥宴<span>（适合4-8人）</span></a></p>
          <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜，营养丰富。</p>
          <p class="follow">150</p>
        </div>
        <div class="price">
          <p class="p1"><span>9.8</span>分</p>
          <p class="p2">￥<span>298.00</span></p>
        </div>
      </section>
      <section class="package">
        <!-- 图片尺寸 864*414 -->
        <a href="#"><img src="images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
        <div class="introduction">
          <p class="title"><a href="#">江湖逍遥宴<span>（适合8-12人）</span></a></p>
          <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜，营养丰富。</p>
          <p class="follow">150</p>
        </div>
        <div class="price">
          <p class="p1"><span>9.8</span>分</p>
          <p class="p2">￥<span>298.00</span></p>
        </div>
      </section>
    </article>
    <!-- 套餐主题 END -->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <a href="index.html" class="a1 current-1">首页</a>
      <a href="美食.html" class="a2">美食</a>
      <a href="个人中心" class="a3">我</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>