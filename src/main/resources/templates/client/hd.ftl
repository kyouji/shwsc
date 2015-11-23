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
      <a class="back" href="/index"></a>
      <p>活动</p>
    </header>
    <!-- 头部 END -->

    <!-- 活动 -->
    <article class="mine-collect">
      <div class="box-collect">
        <ul class="col-ul">
          <li class="active"><a href="#">砍价</a></li>
          <li><a href="#">众筹</a></li>
        </ul>
        <ol class="col-ol">
          <!-- 砍价 -->
          <li class="activity">
            <!-- banner -->
            <div class="banner-box-1">
              <div class="addWrap">
                <div class="swipe" id="mySwipe">
                  <div class="swipe-wrap">
                    <div><a href="#"><img class="img-responsive" src="/client/images/1.jpg"/></a></div>
                    <div><a href="#"><img class="img-responsive" src="/client/images/2.jpg"/></a></div>
                    <div><a href="#"><img class="img-responsive" src="/client/images/3.jpg"/></a></div>
                  </div>
                </div>
                <ul id="position">
                  <li class="cur"></li>
                  <li class=""></li>
                  <li class=""></li>
                </ul>
              </div>
              <script src="/client/js/swipe.js"></script> 
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
            </div>
            <!-- bannner END -->
            <div class="package">
              <!-- 图片尺寸 864*414 -->
              <a href="/kjhdtc"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
              <div class="introduction">
                <p class="title"><a href="/kjhdtc">活动一（入口）</span></a></p>
                <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜，营养丰富。</p>
              </div>
              <div class="price">
                <p class="p1">适合<em>2</em>-<em>4</em>人</p>
                <p class="p2">￥<span>298.00</span></p>
              </div>
            </div>
            <div class="package">
              <!-- 图片尺寸 864*414 -->
              <a href="#"><img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴"></a>
              <div class="introduction">
                <p class="title"><a href="#">活动2（入口）<span>（适合2-4人）</span></a></p>
                <p class="itdt">江湖逍遥宴，滋味刚好。老少皆宜，营养丰富。</p>
              </div>
              <div class="price">
                <p class="p1">适合<em>2</em>-<em>4</em>人</p>
                <p class="p2">￥<span>298.00</span></p>
              </div>
            </div>
          </li>
          <!-- 众筹 -->
          <li></li>
        </ol>
      </div>
      <script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
      <script type="text/javascript">
      $(document).ready(function(){
        $('.col-ul').on('click','a',function(){
          var $self = $(this);//当前a标签
          var $active = $self.closest('li');//当前点击li
          var index = $active.prevAll('li').length;//当前索引

          $active.addClass('active').siblings('li').removeClass('active');
          $('.col-ol').find('>li')[index==-1?'show':'hide']().eq(index).show();
        });
      });
      </script>
    </article>
    <!-- 活动 END -->


</body>
</html>