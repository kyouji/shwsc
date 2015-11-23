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
      <a class="back" href="/food"></a>
      <p><#if good??>${good.categoryTitle}</#if></p>
    </header>
    <!-- 头部 END -->

    <!-- banner -->
    <div class="addWrap">
      <div class="swipe" id="mySwipe">
        <div class="swipe-wrap">
          <#if ht_scroll_ad_list??>
          <#list ht_scroll_ad_list as item>
          <div>
            <li><a href="${item.linkUri!''}" target="_blank"><img src="${item.fileUri!''}"/></a></li>
          </div>
          </#list>
          </#if>
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
    <!-- bannner END -->
    
    <!-- 套餐详情 -->
    <article class="package-details">
      <section class="package-description">
        <div class="div1">
          <div class="left">
            <p class="p1">${good.title!''}</p>
            <p class="p2"></p>
          </div>
          <div class="right">
            <p class="p1">￥<span>198.00</span></p>
             <#assign Strlenght = good.paramValueCollect?length>
            <p class="p2">适合${good.paramValueCollect[0..Strlenght-2]}人</p>
          </div>
        </div>
        <div class="div2">
          <p class="p1">定前须知</p>
          <p class="p2">周一至周五提前<strong>24小时</strong>预订<br>周六、周日提前<strong>48小时</strong>预订<br>我们将在您用餐<strong>3小时</strong>左右收走餐具</p>
        </div>
        <div class="div3">
          <p class="p1">定前须知</p>
          <ul>
            <li class="li1 ">精选食材</li>
            <li class="li2 c-ccc">厨师上门服务</li>
            <li class="li3 c-ccc">餐具上门回收</li>
          </ul>
        </div>
      </section>

      <!-- 菜品介绍 -->
      <section class="food-presentation">
            <ul>
              <li class="li1 current">菜品介绍</li>
              <li class="li2 c-ccc">商家介绍</li>
            </ul>
            <dl>
            <#if good??>
            <#list good.giftList as item>
            <dt>
                <div class="img-group">
                    <!-- 图片原始尺寸 600*315 -->
                    <img class="mn-cr" src="${item.goodsPrice}" alt="主菜">
                    <!-- 图片原始尺寸 95*56 -->
                    <img width="60" height="35" class="main-course" src="/client/images/icon_main_course.png" alt="">
                </div>
                <div class="dishes">
                    <p class="p1">${item.goodsId}</p>
                    <p class="p2">${item.goodsTitle}</p>
                    <p class="p3"><i></i><span>32</span></p>
                </div>
                <p class="explanation">依旧是虾控最爱的一道快手菜，这次用的虾个头比较大，满满的都是肉,好星湖哈哈。用自己种的香菜做点缀成就感好大</p>
            </dt>  
            <#break>
            </#list>
            </#if>
        <#assign totalGift = good.giftList?size>
        <#list good.giftList as item>
        <#if item_index gte 1 && item_index lte (totalGift - 3)>
        <dd>
            <!-- 图片原始尺寸 600*315 -->
            <img src="${item.goodsPrice}" alt="主菜">
            <div>
              <p class="p1">${item.goodsId}</p>
              <p class="p2">${item.goodsTitle}</p>
            </div>
        </dd>
        </#if>
        </#list>
        <div class="food-more">
            <#list good.giftList as item>
            <#if item_index == (totalGift - 2)>
            <div class="div1">
                <!-- 图片原始尺寸 600*315 -->
                <img src="${item.goodsPrice}" alt="主菜">
                <div>
                  <p class="p1">${item.goodsId}</p>
                  <p class="p2">${item.goodsTitle}</p>
                </div>
            </div>
            <#elseif item_index == (totalGift - 1)>
            <div class="div2">
                <!-- 图片原始尺寸 600*315 -->
                <img src="${item.goodsPrice}" alt="主菜">
                <div>
                  <p class="p1">${item.goodsId}</p>
                  <p class="p2">${item.goodsTitle}</p>
                </div>
            </div>
            </#if>
            </#list>
        </div>
        </dl>
      </section>
      <!-- 套餐清单 -->
      <section class="inventory">
        <div class="div1">
          <div class="fz1-4 c000">
            <p class="p1">菜品</p>
            <p class="p2 c-ccc"><span>${good.leftNumber!'0'}</span>份</p>
          </div>
          <div class="fz1-2">
            <p class="p1 fs-il">主菜</p>
            <p class="p2">${good.detail!''}</p>
          </div>
          <div class="fz1-2">
            <p class="p1 fs-il">配菜</p>
            <p class="p2">${good.afterMarketService!''}</p>
          </div>
        </div>
        <div class="div2">
          <div class="fz1-4 c000">
            <p class="p1">赠品</p>
            <p class="p2 c-ccc"><span>2${good.soldNumber!'0'}</span>份<br></p>
          </div>
          <div class="acd fz1-2 c999">${good.flashSaleImage!''}</div>
        </div>
      </section>
      <!-- 评论 -->
      <section class="review">
        <div class="title">评论（共<span>3</span>条）</div>
        <ul>
          <li>
            <div class="div1">
              <img class="head-portrait" src="/client/images/head_portrait.jpg" alt="头像">
              <div>
                <p class="p1"><span>毛豆齐</span><i class="rating-3"></i></p>
                <p class="p2">味道不错，厨师的手艺和素质很高！赞赞赞!</p>
              </div>
            </div>
            <div class="div2">2015-09-10</div>
          </li>
          <li>
            <div class="div1">
              <img class="head-portrait" src="/client/images/head_portrait.jpg" alt="头像">
              <div>
                <p class="p1"><span>毛豆齐</span><i class="rating-2"></i></p>
                <p class="p2">味道不错，厨师的手艺和素质很高！赞赞赞!</p>
              </div>
            </div>
            <div class="div2">2015-09-10</div>
          </li>
          <li>
            <div class="div1">
              <img class="head-portrait" src="/client/images/head_portrait.jpg" alt="头像">
              <div>
                <p class="p1"><span>毛豆齐</span><i class="rating-4"></i></p>
                <p class="p2">味道不错，厨师的手艺和素质很高！赞赞赞!</p>
              </div>
            </div>
            <div class="div2">2015-09-10</div>
          </li>
        </ul>
      </section>
    </article>
    <!-- 套餐详情 END -->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer class="bdt-n">
      <div class="shopp-car">(<span>3</span>)</div>
      <a class="button-buy" href="/cart/init?id=${good.id!''}">立即购买</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>