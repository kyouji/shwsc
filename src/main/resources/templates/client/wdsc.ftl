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
      <p>我的收藏</p>
    </header>
    <!-- 头部 END -->

    <!-- 我的收藏 -->
    <article class="mine-collect">
      <div class="box-collect">
        <ul class="col-ul">
          <li class="active"><a href="javascript:;">套餐</a></li>
          <li><a href="javascript:;">厨师</a></li>
        </ul>
        <ol class="col-ol">
          <!-- 套餐收藏 -->
          <li>
          <#if collect_goods_list?? && collect_goods_list?size gt 0>
          <#list collect_goods_list as cg>
                <section>
                    <a href="/food/showdishes?goodId=${cg.goodsId?c}">
                        <img src="${cg.goodsCoverImageUri!''}" width=471px; height=169px; alt="${cg.goodsTitle!''}">
                        <div class="div1">${cg.goodsTitle!''}</div>
                        <div class="div2">
                            <div class="div2-1">￥<span>${cg.goodsSalePrice?string('0.00')}</span></div>
                            <div class="div2-2">${cg.collectTime?string('yyyy-MM-dd HH:mm')}</div>
                        </div>
                    </a>
                </section>
          </#list>
          </#if>
          </li><!-- 套餐收藏 END -->

          <!-- 厨师收藏 -->
          <li class="group-chef-col">
            <article><a href="厨师介绍.html">
              <!-- 图片原始尺寸 150*150 -->
              <img class="head-portrait" src="images/head_portrait.jpg" alt="头像">
              <div class="right-box">
                <div class="chef-name">静香</div>
                <div class="chef-level level-1"></div>
                <div class="group-serv-num">
                  <div class="level">国家二级厨师</div>
                  <div class="sev-nums">服务次数：<span>333</span></div>
                </div>
              </div>
            </a></article>
            <article><a href="厨师介绍.html">
              <!-- 图片原始尺寸 150*150 -->
              <img class="head-portrait" src="images/head_portrait.jpg" alt="头像">
              <div class="right-box">
                <div class="chef-name">静香</div>
                <div class="chef-level level-3"></div>
                <div class="group-serv-num">
                  <div class="level">国家二级厨师</div>
                  <div class="sev-nums">服务次数：<span>333</span></div>
                </div>
              </div>
            </a></article>
            <article><a href="厨师介绍.html">
              <!-- 图片原始尺寸 150*150 -->
              <img class="head-portrait" src="images/head_portrait.jpg" alt="头像">
              <div class="right-box">
                <div class="chef-name">静香</div>
                <div class="chef-level level-5"></div>
                <div class="group-serv-num">
                  <div class="level">国家二级厨师</div>
                  <div class="sev-nums">服务次数：<span>333</span></div>
                </div>
              </div>
            </a></article>
          </li><!-- 厨师收藏 END -->

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
    <!-- 我的收藏 END -->


</body>
</html>