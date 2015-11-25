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
          <#if collect_cook_list?? && collect_cook_list?size gt 0>
          <#list collect_cook_list as cc>
                <article>
                    <a href="/csjs/${cc.cookId?c}">
                      <!-- 图片原始尺寸 150*150 -->
                     <img src="${cc.goodsCoverImageUri!''}" width=471px; height=169px; alt="${cc.goodsTitle!''}">
                      <div class="right-box">
                        <div class="chef-name">${cc.goodsTitle!''}</div>
                        <p>${cc.collectTime?string('yyyy-MM-dd HH:mm')}</p>
                        <div class="group-serv-num">
                          <div class="level">${cc.level!''}</div>
                          <div class="sev-nums">服务次数：<span>${cc.number!'0'}</span></div>
                        </div>
                      </div>
                    </a>
                </article>
          </#list>
          </#if>
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