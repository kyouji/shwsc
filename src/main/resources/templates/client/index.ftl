<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精品导购-${setting.seoTitle!''}</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<script type="text/javascript" src="/client/js/coupon.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/index.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/login.css"/>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//初始化表单验证
	    $("#login_form").Validform({
	    	tiptype: 3
	    });
	});
	
	
</script>

</head>

<body>
<#include "/client/common_login.ftl"/>
<#include "/client/common_header.ftl" />

<!-- -----------------------导航---------------------------- -->
<div class="ban_back" style="min-width:1200px;">
  <div class="nav">
    <ul  id="myul1">
        <#if navi_bar_item_list??>
            <#list navi_bar_item_list as item>
                <li><a href="${item.linkUri!''}" <#if item_index==0>class="myli"</#if>>${item.title!''}</a></li>
            </#list>
        </#if>
    </ul>
    <div class="join">
        <#if email??>
            <div class="join" onmouseover="join()" onmouseout="join_out()">
                <a href="#" ><span id="final_name">${email!''}</span><img src="/client/images/xiala.png" /></a>
                <div class="join_raw" id="join_raw" style="display: none;">
                    <a href="/user" >个人中心</a>
                    <a href="#" >我的评论</a>
                    <a href="#" >我的消息</a>
                    <a href="#" >我的收藏</a>
                    <a href="#">账户设置</a>
                    <a href="/logout" >退出登录</a>
                </div>
            </div>
        <#else>
            <a href="javascript:login_div_in();" >登录</a>
            <a href="/reg" class="sign_up">注册</a>
        </#if>
    </div>
  </div>
</div>
<!-- -----------------------导航结束---------------------------- --> 

<!-- -----------------------中间  之左边---------------------------- -->
<div class="content">
  <div class="c_left">
  <!-- banner -->
  <div class="banner">
      <div class="TB-focus" style="margin:0 auto">
        <div class="hd">
          <ul>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </div>
        <div class="bd">
          <ul>
            <#if big_scroll_ad_list??>
                <#list big_scroll_ad_list as item>
                    <#if item_index < 4>
                    <li><a href="${item.linkUri!''}" target="_blank"><img src="${item.fileUri!''}" /></a></li>
                    </#if>
                </#list>
            </#if>
          </ul>
        </div>
      </div>
	<script type="text/javascript">jQuery(".TB-focus").slide({ mainCell:".bd ul",effect:"fold",autoPlay:true,delayTime:200 });</script>
      <!-- banner结束 -->
      <div class="banner_right">
        <#if index_small_ad_list??>
            <#list index_small_ad_list as item>
                <#if item_index < 3>
                    <a href="${item.linkUri!''}"><img src="${item.fileUri!''}" /></a>
                </#if>
            </#list>
        </#if>
      </div>
      </div>
    
    <div id="article-div">
        <#include "/client/index_article_page.ftl" />
    </div>
  </div>
  <!-- -----------------------中间  之左边结束---------------------------- --> 
  <!-- -----------------------中间  之右边---------------------------- -->
  
  <div class="c_right">
    <div class="hot">
      <div class="hot_top">热品推荐</div>
      <#if index_hot_article_list??>
      	<#list index_hot_article_list as item>
      		<#if item_index == 0>
		      	<div class="hot_center"><a href="${item.linkUrl!''}"><img src="${item.imgUrl!''}" /></a>
		        	<div class="pic_word">${item.title!''}</div>
		    	</div>
	    	</#if>
	    </#list>
	  </#if>
    	<div class="hot_foot">
	        <div class="spot"><img src="/client/images/spot.png" /></div>
	        <div class="news">
	          <ul>
	         	<#if index_hot_article_list??>
			      	<#list index_hot_article_list as item>
			      		<#if item_index != 0>
	            	<li><a href="#">${item.title!''}</a></li>
		            	</#if>
			        </#list>
			      </#if>
	          </ul>
	        </div>
    	</div>
    </div>
    <div class="pic">
      <#if index_reght_ad_list??>
        <#list index_reght_ad_list as item>
      	  <a href="${item.linkUri!''}"><img src="${item.fileUri!''}" /></a>
        </#list>
      </#if>
    </div>
    <div class="favourable">
      <div class="f_title">国内优惠</div>
      <ul>
      	<#if index_pre_article_list??>
      	  <#list index_pre_article_list as item>
      	  	<#if item_index==0>
		        <li>
		          <div class="zuo"><a href="${item.linkUrl!''}"><img src="${item.fileUri!''}" /></a></div>
		          <div class="you">
		            <h1><a href="${item.linkUrl!''}">${item.title!''}</a></h1>
		            <h2>${item.brief!''}</h2>
		          </div>
		        </li>
	        </#if>
          </#list>
        </#if>
      </ul>
    </div>
  </div>
</div>
<!-- -----------------------中间  之右边结束---------------------------- --> 

<#include "/client/common_footer.ftl" />
</body>
</html>
