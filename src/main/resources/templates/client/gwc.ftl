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
      <p>购物车</p>
    </header>
    <!-- 头部 END -->

    <article class="shopp-car">
    <#if goods_list??>
    <#list goods_list as good>
    <section>
        <div class="div1">
          <!--<input type="checkbox">-->
          <!-- 图片原始尺寸 864*414-->
          <img src="/client/images/package_details_photo_1.jpg" alt="江湖逍遥宴">
          <div class="detail">
            <div class="title">
              <span class="span1">${good.title!''}</span>
              <#assign Strlenght = good.paramValueCollect?length>          
            </div>
            <div class="title">
              <span class="span2">${good.paramValueCollect[0..Strlenght-2]}人</span>
              <#--<span class="span3">微辣型</span>-->
            </div>
            <div class="number">
              <p class="p1">￥<span>${good.salePrice?string("0.00")}</span></p>
            </div>
          </div>
        </div>
        <div class="div2">
          <#--<p class="p1">共<span>1</span>个套餐</p>
          <p class="p2">合计&nbsp;&nbsp;&nbsp;&nbsp;￥<span>298</span></p>-->
        </div>
        <div class="div3">
          <a class="btn-order-now" href="/food/buy?id=${good.id}">提交订单</a>
          <a class="btn-deletelist" href="/cart/del?id=<#if ("cartId_" + good_index)?eval??>${("cartId_" + good_index)?eval?c}</#if>">删除</a>
        </div>
        <!-- <a class="btn-delete-orderlist" href="#">删除</a> -->
      </section>
      </#list>
    </#if>
      <!--
      <script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
      <script type="text/javascript" src="/client/js/jquery.mobile-1.3.2.min.js"></script>
      <script type="text/javascript">
        $(document).ready(function(){
          $(".shopp-car section").on("swipeleft",function(){
            $(this).addClass('selected').find(".btn-delete-orderlist").show();
          });
          $(".shopp-car section").on("swiperight",function(){
            $(this).removeClass('selected').find(".btn-delete-orderlist").hide();
          });
        });
      </script>  -->
    </article>

    <div class="clear h50"></div>

    <!-- 底部 --
    <footer>
      <div class="select-all"><input type="checkbox">&nbsp;全选</div>
      <div class="total">合计：￥<span>300</span></div>
      <a class="clearing" href="#">结算</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>