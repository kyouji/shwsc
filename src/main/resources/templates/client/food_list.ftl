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
      <a id="title" class="title" href="#"><#if type??>${type.title!'无类别'}</#if><i>&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
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
          <a <#if choosed_number??><#if choosed_number == -1>class="current"</#if><#else>class="current"</#if> href="/food/number/-1/<#if type??>${type.id!'0'}</#if>">全部</a>
          
          <#if people_number??>
          <#list people_number as item>
          <a href="/food/number/${item_index}/<#if type??>${type.id!'0'}</#if>" <#if choosed_number??&& choosed_number == (item_index + 1)> class="current"</#if>>${item}人</a>
          </#list>
          </#if>
        </div>
      </section>
      <#if goods_page??>
      <#list goods_page as item>
      <section class="package"><a style="display:block;" href="/food/showdishes?goodId=${item.id}">
        <img src="${item.coverImageUri!''}" alt="江湖逍遥宴"></a>
        <div class="introduction">
            <#assign Strlenght = item.paramValueCollect?length>
          <p class="title"><a href="#">${item.title!''}<span>（${item.paramValueCollect[0..Strlenght-2]}人）</span></a></p>
          <p class="itdt">${item.subTitle!''}</p>
          <p class="follow">${item.totalclicks!'0'}</p>
        </div>
        <div class="price">
          <p class="p1"><span>9.8</span>分</p>
          <p class="p2">￥<span><#if item.salePrice??>${item.salePrice?string("0.00")}<#else>0</#if></span></p>
        </div>
      
      </section>
      </#list>
      </#if>
    </article>
    <!-- 套餐主题 END -->

    <div class="clear h50"></div>

    <!-- 底部 -->
    <footer>
      <a href="/" class="a1 ">首页</a>
      <a href="/food" class="a2 current-1">美食</a>
      <a href="/center" class="a3">我</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>