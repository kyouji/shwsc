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
<script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    function search(){
        $("#form1").submit();
    }
</script>
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <form action="/search" id="form1">
    <header>
      <div class="search search-page">
          <input type="text" placeholder="搜索菜品" name="keywords" value="${keywords!''}">
          <a href="javascript:search();"><i></i></a>
      </div>
      <a class="search-cancel" href="javascript:search();">搜索</a>
    </header>
    </form>
    <!-- 头部 END -->

    <!-- 套餐主题 -->
    <article class="theme-packages">
      <section>
        <div class="filter-group">
        </div>
      </section>
      <#if goods_list??>
      <#list goods_list as item>
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