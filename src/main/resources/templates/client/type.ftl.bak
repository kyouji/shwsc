<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/haitao.css"/>
<script type="text/javascript">

	function update_atricle(id){
	alert(this);
		$.ajax({
			type:"post",
			url:"/atricle/list",
			data:{"id":id},
			dataType:"html",
			success:function(data){
				
				$("#atricle_list").html(data);
			},
		});
	}

</script>
</head>

<body>
<#include "/client/common_login.ftl"/>
<!-- -----------------------头部---------------------------- -->
<#include "/client/common_header.ftl" />
<!-- -----------------------头部结束---------------------------- --> 

<!-- -----------------------导航---------------------------- -->
<div class="ban_back">
  <div class="nav">
    <ul  id="myul1">
        <#if navi_bar_item_list??>
            <#list navi_bar_item_list as item>
                <li><a href="${item.linkUri!''}" <#if item_index==haitao_index>class="myli"</#if>>${item.title!''}</a></li>
            </#list>
        </#if>
    </ul>
    <div class="join">
        <#if email??>
            <div class="join" onmouseover="join()" onmouseout="join_out()">
                <a href="#" ><span id="final_name">${email!''}</span><img src="/client/images/xiala.png" /></a>
                <div class="join_raw" id="join_raw" style="display: none;">
                    <a href="/person_core" >个人中心</a>
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
            <#if big_scroll_ads_list??>
            	<#list big_scroll_ads_list as item>
            		<li><a href="${item.linkUrl!''}?id=${item.id?c}"><img src="${item.title!''}" /></a></li>
            	</#list>
            </#if>
          </ul>
        </div>
      </div>
    </div>
    <script type="text/javascript">jQuery(".TB-focus").slide({ mainCell:".bd ul",effect:"fold",autoPlay:true,delayTime:200 });</script> 
    <!-- banner结束 -->
    <div class="goods">
      <ul class="ul1">
        <#if articleCategory_Leve1_nav??>
        	<#list articleCategory_Leve1_nav as item>
        		<li><a href="javascript:update_atricle(${item.id?c});" <#if item_index == articleCategory_Leve1_nav_index >class="ul1_a"</#if>>${item.title!''}</a></li>
        	</#list>
        </#if>
      </ul>
      
      <div id="atricle_list">
      	<#include "/client/article_update.ftl">
      </div>
     </div>
      
    
    <!-- -----------------------中间  之左边结束---------------------------- --> 
    
    <!-- -----------------------中间  之右边---------------------------- --> 
    </div>
  <div class="c_right">
    <div class="hot_right" >
      <div class="hot_top">热品推荐</div>
      <div class="hot_center"><a href="#"><img src="images/hot1.png" /></a>
        <div class="pic_word">肯尼亚总统穿过潘基文与习近平握手一幕</div>
      </div>
      <div class="hot_foot">
        <div class="spot"><img src="images/spot.png" /></div>
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
    <div class="hot_classify" >
      <div class="classify1"><a href="#" class="a1">热门分类</a><a href="#" class="a2">热门发现</a><a href="#" class="a3">更多</a></div>
      <ul>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
        <li><a href="#"><img src="images/hot2.png" /></a></li>
      </ul>
    </div>
    <div class="pic1" ><img src="images/pic4.png" /></div>
    <div class="hot_cheap" >
      <div class="cheap_title"><a href="#" class="t_a1">热门优惠卷</a><a href="#" class="t_a2">更多</a></div>
      <div class="cheap_goods"><a href="#" class="ling">领取</a><a href="#" class="a_img"><img src="images/cheap_goods.png" /></a><span><a href="#">优惠时尚商城60元优惠卷已经能优惠时尚商城60元优惠卷已经能优惠时尚商城60元优惠卷已经能</a></span></div>
      <div class="cheap_news">
        <ul>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
          <li><a href="#">优惠时尚商城60元优惠</a></li>
        </ul>
      </div>
    </div>
    <div class="pic2" ><img src="images/pic5.png" /></div>
  </div>
</div>

<!-- -----------------------中间  之右边结束---------------------------- --> 
<!-- -----------------------底部---------------------------- -->
<#include "/client/common_footer.ftl"/>
<!-- -----------------------底部结束---------------------------- -->
</body>
</html>
