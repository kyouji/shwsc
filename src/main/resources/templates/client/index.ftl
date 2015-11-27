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
<title>叫个厨子-${setting.seoTitle!''}</title>
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
</head>
<body>
  <!--弹窗-->
  <div id="bg"></div>
  <div id="popbox">
    <p class="c666 dial-phone">拨打客服电话</p>
    <p>${setting.telephone!'023-63632723'}</p>
    <div class="button-group">
      <a class="default" href="#" onclick="pupclose()">取消</a>
      <a href="tel://${setting.telephone!'023-63632723'}" onclick="pupclose()">呼叫</a>
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
      <!-- 地区选择 -->
      <#--
      <a class="btn-select city" id="btn_select" href="/citys">
      <span class="cur-select">江北区</span>
      </a>
      <!-- 模拟select下拉框js --
      <script>
        var $$ = function (id) {
          return document.getElementById(id);
        }
        window.onload = function () {
          var btnSelect = $$("btn_select");
          var curSelect = btnSelect.getElementsByTagName("span")[0];
          var oSelect = btnSelect.getElementsByTagName("select")[0];
          var aOption = btnSelect.getElementsByTagName("option");
          oSelect.onchange = function () {
            var text=oSelect.options[oSelect.selectedIndex].text;
            curSelect.innerHTML = text;
          }
        } 
      </script>
      -->
      <!-- 搜索框 -->
      <div class="search">
          <a href="/ssy"><i></i>
          <input name="keywords" type="text" placeholder="搜索菜品" id="key"">
          </a>
      </div>
      <!-- 电话 -->
      <a class="phone" href="#" onclick="pupopen()"></a>
    </header>
    <!-- 头部 END -->

    <!-- banner -->
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
        <#if top_ad_list??>
          <#list top_ad_list as item>
          <#if item_index == 0>
          <li class="cur"></li>
          <#else>
          <li class=""></li>
          </#if>
          </#list>
          </#if>
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

    <article class="index-art">
    <#if content_list??>
    <#list content_list as item>
    <section class="sct-${item_index + 1}">
    <!-- 图片尺寸 600*315 -->
    <a style="display:block;" href="${item.linkUri!''}"  <#if item.typeIsNewWindow?string("true","flase") == "true">target="_blank"</#if>><img src="${item.fileUri!''}"/>
    <!-- 图片尺寸 166*166 -->
    <img class="tips-photo" src="/client/images/index_photo_1.png" alt="">
    <p>${item.title}</p>
    </a>
    </section>
    </#list>
    </#if>
    </article>

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <a href="/" class="a1 current-1">首页</a>
      <a href="/food" class="a2">美食</a>
      <a href="/center" class="a3">我</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>