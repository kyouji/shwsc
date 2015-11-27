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
<script type="text/javascript" src="/client/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
   $("#addcart").click(function(){
        $.ajax({
            type:"post",
            url:"/cart/init",
            data:{id:"${good.id!''}"},
            success:function(data){
                alert(data.message);
                if(data.code != 0)
                {
                    document.getElementById('cartGoodNumber').innerHTML++;
                }
            }
        });
   });
});

function addCollect(gid)
{
    $.ajax({
        type : "post",
        url : "/user/collect/add",
        data :{"goodsId":gid},
        success:function(data){
            alert(data.message);
        }
    });
}

</script>

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
    <!--<div class="addWrap">
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
    </div>-->
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
     <div class="addWrap">
      <div class="swipe" id="mySwipe">
        <div class="swipe-wrap">
           
          <#if top_ad_list??>
          <#list top_ad_list as item>
          <div>
            <li><a href="${item.linkUri!''}" <#if item.typeIsNewWindow?string("true","flase") == "true">target="_blank"</#if>><img src="${item.fileUri!''}"/></a></li>
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

        ${good.brandTitle!''}

      </section>

      <!-- 菜品介绍 -->
      <section class="food-presentation">
            <ul>
              <li class="li1">菜品介绍</li>
              <li class="li2" onclick="addCollect(${good.id?c})">收藏</li>
            </ul>
            <dl>
            <dt>
                <div class="img-group">
                    <!-- 图片原始尺寸 600*315 -->
                    <img class="mn-cr" src="${good.coverImageUri!''}" alt="主菜">
                    <!-- 图片原始尺寸 95*56 -->
                    <img width="60" height="35" class="main-course" src="/client/images/icon_main_course.png" alt="">
                </div>
                <div class="dishes">
                    <p class="p1">${good.goodsId!''}</p>
                    <p class="p2">${good.goodsTitle!''}</p>
                </div>
                <p class="explanation"></p>
            </dt>
        <#--
        <#list good.giftList as item>
        <#if item_index gte 1 && item_index lte (totalGift - 3)>
        <dd>
            <!-- 图片原始尺寸 600*315 
            <img src="${item.goodsPrice}" alt="主菜">
            <div>
              <p class="p1">${item.goodsId}</p>
              <p class="p2">${item.goodsTitle}</p>
            </div>
        </dd>
        </#if>
        </#list>
        -->
        <div class="food-more">
        <#--
            <#list good.giftList as item>
            <#if item_index == (totalGift - 2)>
            <div class="div1">
                <!-- 图片原始尺寸 600*315 -
                <img src="${item.goodsPrice}" alt="主菜">
                <div>
                  <p class="p1">${item.goodsId}</p>
                  <p class="p2">${item.goodsTitle}</p>
                </div>
            </div>
            <#elseif item_index == (totalGift - 1)>
            <div class="div2">
                <!-- 图片原始尺寸 600*315 -
                <img src="${item.goodsPrice}" alt="主菜">
                <div>
                  <p class="p1">${item.goodsId}</p>
                  <p class="p2">${item.goodsTitle}</p>
                </div>
            </div>
            </#if>
            </#list>
            -->
        </div>
        </dl>
      </section>
      <!-- 套餐清单 -->
      <section class="inventory">
        <div class="div1">
            <div class="fz1-2">
            <p class="p1 "></p>
            <p class="p2">${good.brandTitle}</p>
          </div>
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
            <p class="p2 c-ccc">${good.afterMarketService!''}</p>
          </div>
        </div>
        <div class="div2">
          <div class="fz1-4 c000">
            <p class="p1">赠品</p>
            <p class="p2 c-ccc"><span>${good.soldNumber!'0'}</span>份<br></p>
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
      <div class="shopp-car" id="addcart">(<span id="cartGoodNumber"><#if cart_good_number??>${cart_good_number!'00'}</#if></span>)</div>
      <a class="button-buy" href="/order/buy?gid=${good.id!''}">立即购买</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>