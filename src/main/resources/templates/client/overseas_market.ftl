<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/index.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
</head>

<body>
<#include "/client/common_header.ftl" />

<#include "/client/common_nav.ftl"/>

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
    </div>
    <script type="text/javascript">jQuery(".TB-focus").slide({ mainCell:".bd ul",effect:"fold",autoPlay:true,delayTime:200 });</script> 
    <!-- banner结束 -->
    <div class="goods">
      <ul class="ul1">
      	<#if article_categorys_list??>
      		<#list article_categorys_list as item>
      			<#if item_index == 0 >
      				<li><a href="#" class="ul1_a">${item.title!''}</a></li>
      			<#else>
      				<li><a href="#">${item.title!''}</a></li>
      			</#if>
      		</#list>
      	</#if>
      	<#--
        <li><a href="#" class="ul1_a">热门分选</a></li>
        <li><a href="#">分类筛选分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        <li><a href="#">分类筛选</a></li>
        -->
      </ul>
      <ul class="ul2">
      	<#if article_category_sub_list??>
      		<#list article_category_sub_list as item>
      			<li><a href="#">${item.title!''}</a></li>
       			<li><a href="#" class="ul2_a">手慢无</a></li>
      		</#list>
      	</#if>
      	<#--
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        <li><a href="#">神价格</a></li>
        <li><a href="#" class="ul2_a">手慢无</a></li>
        -->
      </ul>
      <div class="advertisement"><img src="images/ad.png" alt="" /></div>
      <ul class="ul3">
        <li>
          <div class="li_left"><a href="#"><img src="images/goods1.png" /></a></div>
          <div class="li_right">
            <h1><a href="#">白菜特价包邮 羽绒服干洗剂 彩色量勺 酸奶瓶 订书机等20151019</a></h1>
            <div class="writer">
              <label class="label1">作者：<span>华谊兄弟研究院</span> </label>
              <label class="label2">标签：<span> 日用百货 白菜党</span></label>
              <label class="label3">2015-12-12</label>
            </div>
            <div class="words">
              <p><a href="#">Hi~大家好，忙碌的周一再次来袭，大家都有挺住吧。今天的白菜有比较应季的羽绒服干洗剂，许多城市轻羽绒已经上场了，手中备一瓶还是安心些。还有把手机套袋子放水里的密封棒又来了，每次见到都忍不住再看几遍详情里的与金鱼共浴图，好评。另外挂钩套装2件有锤锤赠送，虽然糙了Hi~大家好，忙碌的周一再次来袭，大家都有挺住吧。今天的白菜有比较应季的羽绒服干洗剂，许多城市轻羽绒已经上场了，手中备一瓶还是安心些。还有把手机套袋子放水里的密封棒又来了，每次见到都忍不住再看几遍详情里的与金鱼共浴图，好评。另外挂钩套装2件有锤锤赠送，虽然糙了</a></p>
            </div>
            <div class="read_all"><a href="#">阅读全文&nbsp;></a></div>
            <div class="comment">
              <div class="com1"><a href="#"><img src="images/comment1.png" /><span>1</span></a></div>
              <div class="com2"><a href="#"><img src="images/comment3.png" /><span>2</span></a></div>
              <div class="com3"><a href="#"><img src="images/comment2.png" /><span>34</span></a></div>
              <div  class="com4"><a href="#"><img src="images/comment4.png" /><span>优惠卷领取</span></a></div>
              <div class="com5"><a href="#">直达链接</a></div>
            </div>
          </div>
        </li>
        <li>
          <div class="li_left"><a href="#"><img src="images/goods1.png" /></a></div>
          <div class="li_right">
            <h1><a href="#">白菜特价包邮 羽绒服干洗剂 彩色量勺 酸奶瓶 订书机等20151019</a></h1>
            <div class="writer">
              <label class="label1">作者：<span>华谊兄弟研究院</span> </label>
              <label class="label2">标签：<span> 日用百货 白菜党</span></label>
              <label class="label3">2015-12-12</label>
            </div>
            <div class="words">
              <p><a href="#">Hi~大家好，忙碌的周一再次来袭，大家都有挺住吧。今天的白菜有比较应季的羽绒服干洗剂，许多城市轻羽绒已经上场了，手中备一瓶还是安心些。还有把手机套袋子放水里的密封棒又来了，每次见到都忍不住再看几遍详情里的与金鱼共浴图，好评。另外挂钩套装2件有锤锤赠送，虽然糙了Hi~大家好，忙碌的周一再次来袭，大家都有挺住吧。今天的白菜有比较应季的羽绒服干洗剂，许多城市轻羽绒已经上场了，手中备一瓶还是安心些。还有把手机套袋子放水里的密封棒又来了，每次见到都忍不住再看几遍详情里的与金鱼共浴图，好评。另外挂钩套装2件有锤锤赠送，虽然糙了</a></p>
            </div>
            <div class="read_all"><a href="#">阅读全文&nbsp;></a></div>
            <div class="comment">
              <div class="com1"><a href="#"><img src="images/comment1.png" /><span>1</span></a></div>
              <div class="com2"><a href="#"><img src="images/comment3.png" /><span>2</span></a></div>
              <div class="com3"><a href="#"><img src="images/comment2.png" /><span>34</span></a></div>
              <div  class="com4"><a href="#"><img src="images/comment4.png" /><span>优惠卷领取</span></a></div>
              <div class="com5"><a href="#">直达链接</a></div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div class="page"> <a href="#" class="last"></a> <a href="#" class="one">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#" class="dian">...</a> <a href="#">10</a> <a href="#" class="next"></a></div>
    
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
<#include "/client/common_footer.ftl" />
<!-- -----------------------底部结束---------------------------- -->
</body>
</html>
