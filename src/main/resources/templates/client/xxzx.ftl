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
<body>
    <!-- 头部 -->
    <header>
      <a class="back" href="#"></a>
      <p>消息中心</p>
    </header>
    <!-- 头部 END -->

    <!-- 消息中心 -->
   <#if message_list??>
       <#list message_list as item>    
		    <article class="news-center">
		      <div class="div1">
		        <!-- 图片原始尺寸 77*77 -->
		        <img width="50" height="50" src="/client/images/icon_news_center.png" alt="">
		        <span class="tips-news-info"></span>
		      </div>
		      <div class="div2">
		        <div class="div2-1">
		          <span>${item.title!''}</span>
		          <span>${item.time?string("HH:mm")!''}</span>
		        </div>
		        <div class="div2-2">
		            <#if item.content?length lt 25>
		              ${item.content!''}
		            <#else>
		              ${item.content[0..24]}...
		            </#if>    
		        </div>
		      </div>
		    </article>
		</#list>
	</#if>	    
    <!-- 消息中心 END -->

</body>
</html>