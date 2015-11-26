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
<script type="text/javascript">
    function search(){
        $("#form1").submit();
    }
</script>
<title>叫个厨子</title>
</head>
<body>
    <!-- 头部 -->
    <form action="/search" id="form1">
    <header>
      <div class="search search-page">
          <input type="text" placeholder="搜索菜品" name="keywords">
          <a href="javascript:search();"><i></i></a>
      </div>
      <a class="search-cancel" href="javascript:search();">搜索</a>
    </header>
    </form>
    <!-- 头部 END -->

    <!-- 搜索列表 -->
    <article class="search-list">
      <div>热门搜索</div>
      <ul>
      <#if keywords_list??>
      <#list keywords_list as key>
            <li><a href="">${key.title!''}</a></li>
      </#list>
      </#if>
      </ul>
    </article>
    <!-- 搜索列表 END -->

</body>
</html>