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
<body class="bgc-e3e6">
    <!-- 头部 -->
    <header>
      <a class="back" href="/"></a>
      <p>厨师列表</p>
    </header>
    <!-- 头部 END -->

    <!-- 厨师列表 -->
    <article class="chef-list">
    	<#if chef_page??>
    		<#list chef_page.content as item>
			      <section>
			      	<a href="/csjs/${item.id?c!''}?mid=${item.menuId?c!''}">
				        <!-- 图片原始尺寸 290*399-->
				        <img width="100%" height="auto" src="${item.imgUrl!}" alt="厨师">
				        <div class="chef-name c000">${item.title!''}<i class="level-1">&nbsp;</i></div>
				        <div class="speci-dishs">${item.brief!''}}</div>
			      	</a></section>
			      <section><a href="/csjs">
			  </#list>
		</#if>	      
    </article>
    <!-- 厨师列表 END -->

</body>
</html>