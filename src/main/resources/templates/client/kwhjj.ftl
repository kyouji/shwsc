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
    <p>口味和忌口</p>
  </header>
  <!-- 头部 END -->

  <!-- 口味和忌口 -->
  <article class="taste-diet">
    <div class="top-art">
      <div class="tips">厨师们要注意咯~~</div>
      <div class="edit"><a href="/kwhjjbj">编辑<span>-</span></a></div>
    </div>
    <ul>
    	
    	<#if kwhjj??>
    	<#list kwhjj as item>
    	<#if item.receiverTeleAreaCode??>
      <li class="delete">${item.receiverTeleAreaCode!''}<span>X</span></li>
      </#if>
      </#list>
      </#if>
      
    </ul>
    <script type="text/javascript" src="/client/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $(".taste-diet ul li span").click(function(){
          $(this).parent().hide();
        });
      });
    </script>
  </article>
  <!-- 口味和忌口 END-->


</body>
</html>