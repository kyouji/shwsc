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
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<title>厨师资料</title>
<script type="text/javascript">
function addCollect(artId)
{
    $.ajax({
        type : "post",
        url : "/user/cook/collect",
        data : {"artId":artId},
        success : function(data){
            alert(data.msg);
        }
    });
}

</script>
</head>
<body>
    <!-- 头部 -->
    <header>
      <a class="back" href="javascript:history.go(-1);"></a>
      <p>厨师介绍</p>
    </header>
    <!-- 头部 END -->

    <!-- 厨师介绍 -->

    <!-- 图片原始尺寸 1200*1545-->
    <img src="<#if article??>${article.imgUrl!''}</#if>" alt="厨师照片">
    <article class="chef-intro">
      <!-- 厨师信息介绍 -->
      <div class="chef-info">
        <!-- 图片原始尺寸 150*150-->
        <img class="chef-pho-head" src="<#if article??>${article.headImg!''}</#if>" alt="头像">
        <div class="good-at">
          <div class="chef-name fz1-3 c000"><#if article??>${article.title!''}</#if><#--<i class="level-5">&nbsp;</i>--></div>
          <div class="good-at-dishs"><#if article??>${article.seoTitle!''}</#if></div>
          <div class="good-at-dishs"><#if article??>${article.seoKeywords!''}</#if></div>
          <div class="good-at-dishs"><#if article??>${article.seoDescription!''}</#if></div>
        </div>
      </div>
      <!-- 服务次数、关注 -->
      <div class="serv-numti">
        <a class="btn-attent" href="jacascript:;" onclick="addCollect(${article.id?c})">关注</a>
        <div class="serv-times">
          <div class="div1"><#if article??>${article.viewCount!''}</#if></div>
          <div class="div2">服务次数</div>
        </div>
      </div>
      <!-- 厨师简介 -->
      <div class="chef-summary">
        <div class="title fz1-3 c-000">厨师简介</div>
        <div class="content"><#if article??>${article.brief!''}</#if></div>
      </div>

      <div style="margin:4% auto;width:20%;height:1px;background:#ff9933;"></div>

      <!-- 厨师相关证书 -->
      <div class="chef-cert">
      	
        <div class="div1"><#if article??>${article.content!''}</#if></div>
        <#--<div class="div2">更加放心的保障</div>
        <div class="div3">&gt;</div>-->
      </div>

    </article>
    <!-- 厨师介绍 END -->
















    <!-- banner -->
    <div class="banner-box">
    <div class="addWrap">
      <div class="swipe" id="mySwipe">
        <div class="swipe-wrap">
          <div><a href="#"><img class="img-responsive" src="images/1.jpg"/></a></div>
          <div><a href="#"><img class="img-responsive" src="images/2.jpg"/></a></div>
          <div><a href="#"><img class="img-responsive" src="images/3.jpg"/></a></div>
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

</body>
</html>