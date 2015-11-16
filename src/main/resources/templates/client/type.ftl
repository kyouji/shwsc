<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>海淘专区-${setting.seoTitle!''}</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/haitao.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/login.css"/>
<script type="text/javascript"> 
$(function(){
            $('.ul2').hide();
        $('.goods ul').eq(1).show();
        $('.ul1 li').eq(0).addClass('ul1_a');
        
            $('.ul1 li').each(function(i){          
                $(this).mouseover(function(){
                    $('.ul1 li a').removeClass('ul1_a')
                    $('.ul1 li a').eq(i).addClass('ul1_a')
                    $('.ul2').hide();
                    $('.goods ul').eq(i+1).show();          
                });             
            }); 
        });  
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
                <li><a href="${item.linkUri!''}" <#if item_index==type_index>class="myli"</#if>>${item.title!''}</a></li>
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
            <#if ht_scroll_ad_list??>
            <#list ht_scroll_ad_list as ad>
                <li><a href="${ad.linkUri!''}" target="_blank"><img src="${ad.fileUri!''}"/></a></li>
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
        <#if level0_category_list??>
            <#list level0_category_list as cat>
                <li><a href="javascript:;" <#if cat_index==0>class="ul1_a"</#if>>${cat.title!''}</a></li>
            </#list>
        </#if>
      </ul>
      <#if level0_category_list??>
        <#list level0_category_list as item>
            <ul class="ul2" <#if item_index!=0>style="display: none;"</#if>>
                <#if ("level1_"+item_index+"_category_list")?eval??>
                    <#list ("level1_"+item_index+"_category_list")?eval as cat>
                        <li><a href="#" <#if cat_index%2==1>class="ul2_a"</#if>>${cat.title!''}</a></li>
                    </#list>
                </#if>
            </ul>
        </#list>
      </#if>
      <div class="advertisement">
        <#if ht_flat_ad_list??>
            <#list ht_flat_ad_list as ad>
                <a href="${ad.linkUri!''}" target="_blank"><img src="${ad.fileUri!''}" alt="${ad.title!''}" /></a>
                <#break>
            </#list>
        </#if>
      </div>
      <ul class="ul3">
        <#if type_article_page??>
            <#list type_article_page.content as item>
                <li>
                  <div class="li_left"><a href="/item/${item.id?c}"><img src="${item.imgUrl!''}" /></a></div>
                  <div class="li_right">
                    <h1><a href="/item/${item.id?c}">${item.title!''}</a></h1>
                    <div class="writer">
                      <label class="label1">作者：<span>${item.source!''}</span> </label>
                      <label class="label2">标签：<span>${item.tagList!''}</span></label>
                      <label class="label3"><#if item.createTime??>${item.createTime?string("yyyy-MM-dd")}</#if></label>
                    </div>
                    <div class="words">
                      <p><a href="/item/${item.id?c}">${item.brief!''}</a></p>
                    </div>
                    <div class="read_all"><a href="/item/${item.id?c}">阅读全文&nbsp;></a></div>
                    <div class="comment">
                      <div class="com1"><a href="#"><img src="/client/images/comment1.png" /><span>${item.goodNumber!'0'}</span></a></div>
                      <div class="com2"><a href="#"><img src="/client/images/comment3.png" /><span>${item.collectNumber!'0'}</span></a></div>
                      <div class="com3"><a href="#"><img src="/client/images/comment2.png" /><span>${item.commentNumber!'0'}</span></a></div>
                      <#--
                      <div  class="com4"><a href="#"><img src="/client/images/comment4.png" /><span>优惠卷领取</span></a></div>
                      -->
                      <div class="com5"><a href="${item.linkUrl!''}">直达链接</a></div>
                    </div>
                  </div>
                </li>
            </#list>
        </#if>
      </ul>
    </div>
    <div class="page"> 
    <#if type_article_page??>
        <#assign continueEnter=false>
        <#if type_article_page.number+1 == 1>
            <a href="javascript:;" class="last"></a> 
        <#else>
            <a href="${type_article_page.number-1}" class="last"></a>
        </#if>
        
        <#if type_article_page.totalPages gt 0>
            <#list 1..type_article_page.totalPages as page>
                <#if page <= 3 || (type_article_page.totalPages-page) < 3 || (type_article_page.number+1-page)?abs<3 >
                    <#if page == type_article_page.number+1>
                        <a class="one" href="javascript:;">${page}</a>
                    <#else>
                        <a href="/promotion/tuan?page=${page-1}<#if type??>&type=${type}</#if>">${page}</a>
                    </#if>
                    <#assign continueEnter=false>
                <#else>
                    <#if !continueEnter>
                        <a href="javascript:;" class="dian">...</a> 
                        <#assign continueEnter=true>
                    </#if>
                </#if>
            </#list>
        </#if>
        
        <#if type_article_page.number+1 == type_article_page.totalPages || type_article_page.totalPages==0>
            <a href="javascript:;" class="next"></a>
        <#else>
            <a href="/${type_article_page.number+1}" class="next"></a>
        </#if>
    </#if>
    </div>
    
    <!-- -----------------------中间  之左边结束---------------------------- --> 
    
    <!-- -----------------------中间  之右边---------------------------- --> 
  </div>
  <div class="c_right">
    <div class="hot_right" >
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
    <div class="hot_classify" >
      <div class="classify1"><a href="#" class="a1">热门分类</a><a href="#" class="a2">热门发现</a><a href="#" class="a3">更多</a></div>
      <ul>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
      </ul>
    </div>
    <div class="pic1" ><img src="images/pic4.png" /></div>
    <div class="hot_cheap" >
      <div class="cheap_title"><a href="#" class="t_a1">热门优惠卷</a><a href="#" class="t_a2">更多</a></div>
      <div class="cheap_goods"><a href="#" class="ling">领取</a><a href="#" class="a_img"><img src="/client/images/cheap_goods.png" /></a><span><a href="#">优惠时尚商城60元优惠卷已经能优惠时尚商城60元优惠卷已经能优惠时尚商城60元优惠卷已经能</a></span></div>
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
    <div class="pic2" ><img src="/client/images/pic5.png" /></div>
  </div>
</div>

<!-- -----------------------中间  之右边结束---------------------------- --> 
<!-- -----------------------底部---------------------------- -->
<#include "/client/common_footer.ftl" />
<!-- -----------------------底部结束---------------------------- -->
</body>
</html>
