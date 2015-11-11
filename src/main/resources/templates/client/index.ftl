<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/index.css"/>
</head>

<body>
<#include "/client/common_header.ftl" />

<!-- -----------------------导航---------------------------- -->
<div class="ban_back">
  <div class="nav">
    <ul  id="myul1">
        <#if navi_bar_item_list??>
            <#list navi_bar_item_list as item>
                <li><a href="${item.linkUri!''}" <#if item_index==0>class="myli"</#if>>${item.title!''}</a></li>
            </#list>
        </#if>
    </ul>
    <div class="join">
        <#if username??>
            <a href="/user" >${username!''}</a>
            <a href="/logout" class="sign_up">注销</a>
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
      <div class="hot_center"><a href="#"><img src="/client/images/hot1.png" /></a>
        <div class="pic_word">肯尼亚总统穿过潘基文与习近平握手一幕</div>
      </div>
      <div class="hot_foot">
        <div class="spot"><img src="/client/images/spot.png" /></div>
        <div class="news">
          <ul>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们为XcodeGhost“解毒”的安全团队们们为XcodeGhost“解毒”的安全团队们</a></li>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们</a></li>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们</a></li>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们</a></li>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们</a></li>
            <li><a href="#">为XcodeGhost“解毒”的安全团队们</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="pic"><a href="#"><img src="/client/images/pic1.png" /></a><a href="#"><img src="/client/images/pic2.png" /></a><a href="#"><img src="/client/images/pic3.png" /></a></div>
    <div class="favourable">
      <div class="f_title">国内优惠</div>
      <ul>
        <li>
          <div class="zuo"><a href="#"><img src="/client/images/f.png" /></a></div>
          <div class="you">
            <h1><a href="#">首届三农“致富榜样”推介</a></h1>
            <h2>一站式设计选材服务</h2>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>
<!-- -----------------------中间  之右边结束---------------------------- --> 

<#include "/client/common_footer.ftl" />
</body>
</html>
