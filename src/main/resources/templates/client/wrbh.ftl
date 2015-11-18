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
      <a class="back" href="#"></a>
      <a id="title" class="title" href="#">无肉不欢<i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
    </header>
    <div id="menu-nav-top" class="menu-nav-top">
      <ul id="menu-nav">
        <li class="li1"><a href="热门推荐.html">热门推荐</a></li>
        <li class="li2"><a href="江湖菜.html">江湖菜</a></li>
        <li class="li3"><a href="#">无肉不欢</a></li>
        <li class="li4 current"><a href="素食主义.html">素食主义</a></li>
        <li class="li5"><a href="各地小吃.html">各地小吃</a></li>
        <li class="li6"><a href="面食.html">面食</a></li>
        <li class="li7"><a href="闽南菜.html">闽南菜</a></li>
        <li class="li8"><a href="重庆美食.html">重庆美食</a></li>
      </ul>
    </div>
    <script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#title").click(function(){
          $("#menu-nav-top").slideToggle();
        });
      });
      var obj = document.getElementById('menu-nav');
      obj.addEventListener('touchmove', function(event) {
           // 如果这个元素的位置内只有一个手指的话
          if (event.targetTouches.length == 1) {
      　　　　 event.preventDefault();// 阻止浏览器默认事件，重要 
              var touch = event.targetTouches[0];
              // 把元素放在手指所在的位置
              obj.style.left = touch.pageX-50 + 'px';
              // obj.style.top = touch.pageY-50 + 'px';
              }
      }, false);
    </script>
    <!-- 头部 END -->

    <!-- 套餐主题 -->
    <article class="theme-packages">
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
        <a href="#"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
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
        <a href="#"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
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