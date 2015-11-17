<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精品导购<#if item??>-${item.seoTitle!''}</#if></title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/shangpinxiangqing.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/login.css"/>
<script>
$(document).ready(function() {
    
    $('#commentForm').submit(function(event) {
        
        // get the form data
        // there are many ways to get this data using jQuery (you can use the class or id also)
        var formData = {
            'content'   : $('input[name=comment]').val(),
            'gid'       : ${article.id?c}
        };

        // process the form
        $.ajax({
            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            url         : '/user/comment/add', // the url where we want to POST
            data        : formData, // our data object
            dataType    : 'json', // what type of data do we expect back from the server
            encode          : true,
            success     : function(data){
                if (data.code != 0)
                {
                    alert(data.message);
                }
                else
                {
                    alert("提交评论成功");
                }
            }
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
                <li><a href="${item.linkUri!''}">${item.title!''}</a></li>
            </#list>
        </#if>
    </ul>
    <div class="join">
        <#if email??>
            <div class="join" onmouseover="join()" onmouseout="join_out()">
                <a href="/user" ><span id="final_name">${email!''}</span><img src="/client/images/xiala.png" /></a>
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
    <div class="location">当前位置：<a href="/"><span>首页</span></a>><#if category??><a href="#"><span>${category.title!''}</span></a></#if><#if article??>>${article.title!''}</#if></div>
    <div class="how_goods"><img src="${article.imgUrl!''}" />
      <div class="how_words">
        <div class="word1">
          <p>${article.title!''}</p>
        </div>
        <div class="word2">时间：<span><#if article.createTime??>${article.createTime?string("HH:mm:ss")}</#if></span></div>
        <div class="word3"> 作者：<span> ${article.source!''}</span> </div>
        <div class="word4"> 分类：<span> ${category.title!''}</span></div>
        <div class="word5"> 标签：<span> ${article.tagList!''}</span></div>
        <a href="${article.linkUrl!''}?t=${article.tag!''}&tag=${article.tag!''}" class="zhi">直达链接 ></a> </div>
    </div>
    <div class="goods_detail">
      <div class="detail_title">详细信息</div>
      ${article.content!''}
    </div>
    
    <div class="collect">
      <div class="co1">收藏：<a href="#"><span>${article.collectNumber!'0'}</span></a></div>
      <div class="co2">评论：<a href="#div-comment" ><span>${article.commentNumber!'0'}</span></a></div>
      <div class="co3">
        <label>分享到：</label>
        <a href="#" class="co3_a1"></a><a href="#" class="co3_a2"></a><a href="#" class="co3_a3"></a><a href="#" class="co3_a4"></a><a href="#" class="co3_a5"></a><a href="#" class="co3_a6"></a><a href="#" class="co3_a7"></a><a href="#" class="co3_a8"></a><a href="#" class="co3_a9"></a></div>
    </div>
    <div class="last_article">
        <a href="<#if prev_article??>/item/${prev_article.id?c}<#else>javascript:;</#if>" class="last_a">上一篇<br />
            <span><#if prev_article??>${prev_article.title!''}</#if></span> 
        </a>
        <a href="<#if next_article??>/item/${next_article.id?c}<#else>javascript:;</#if>" class="next_a"> 下一篇<br />
            <span><#if next_article??>${next_article.title!''}</#if></span>
        </a>
    </div>
    <div class="other_like">
      <label>您可能还喜欢</label>
      
      
      
      <!-- 商品轮播 -->
      <#if article_love_page??>
      <div class="picScroll">
        <div class="bd"> <a href="javascript:void(0)" class="prev"></a> <a href="javascript:void(0)" class="next"></a>
          <div class="scrollWrap">
            <ul class="picList">
                <#if article_love_page??>
                    <#list article_love_page.content as item>
                        <li> <a href="/item/${item.id?c}" ><img src="${item.imgUrl!''}"></a> <p>${item.title!''}</p></li>
                    </#list>
                </#if>
            </ul>
          </div>
        </div>
      </div>
    <script type="text/javascript">
        jQuery(".picScroll").slide({ mainCell:".picList", effect:"left",vis:4, pnLoop:false, scroll:4, autoPage:true});
    </script> 
    </#if>
      
      <!-- 商品轮播结束 --> 
      
      
      
    </div>
    <div class="commont" id="div-comment">
      <div class="com_title">评论<span>（<#if comment_page??>${comment_page.totalElements!'0'}</#if> 条）</span></div>
      <div class="com_write"> <a href="#" class="me"></a>
        <form id="commentForm">
          <input type="text" class="txt" name="comment"/>
          <input type="submit"  value="提交" class="mit"/>
        </form>
      </div>
      <div class="com_history">
        <div class="his_title"><a href="javascript:;" class="his_a">最新</a><#--<a href="#">最热</a>--></div>
        <ul>
            <#if comment_page??>
                <#list comment_page.content as comment>
                  <li>
                    <div class="his_li1t"><a href="javascript:;" class="tou"></a><a href="javascript:;">${comment.username!''}</a>
                      <label><span><#if comment.commentTime??>${comment.commentTime?string("yyyy-MM-dd HH:mm:ss")}</#if></span></label>
                    </div>
                    <div class="his_li2">
                      <label><span>${comment_index+1}</span>楼</label>
                      <span>${comment.content!''}</span></div>
                    <#--
                    <div class="his_li3"><a href="#">回复</a><a href="#">踩（<span>0</span>）</a><a href="#">顶（<span>0</span>）</a></div>
                    -->
                  </li>
                </#list>
            </#if>
        </ul>
      </div>
    </div>
  </div>
  <!-- -----------------------中间  之右边---------------------------- -->
  
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
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
        <li><a href="#"><img src="/client/images/hot2.png" /></a></li>
      </ul>
    </div>
    <div class="pic1" ><img src="/client/images/pic4.png" /></div>
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
