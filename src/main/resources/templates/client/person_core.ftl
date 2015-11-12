<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心首页</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/gerenzhongxin.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/index.css"/>
</head>

<body>
<#include "/client/common_header.ftl" />

<#--include "/client/common_nav.ftl" /-->

<!-- -----------------------中间  之左边---------------------------- -->
<div class="content">
  <div class="c_left">
    <div class="cleft_title"> 个人中心</div>
    <div class="cleft_me">
      <#if user??>
      
	      <div class="me_pic"><img src="${user.headImageUri!'/client/images/me.png'}" /></div>
	      <div class="me_detail">
	        <div class="me_name">
	          <label>${user.nickname!user.email} </label>
	          <a href="#"> <img src="/client/images/kuang.png" />我的消息</a><a href="#"><img src="/client/images/chilun.png" /> 账户设置</a></div>
	        <div class="me_money">
	          <label><a href="#"><#if num??>${num?c}<#else>0</#if></a><span>优惠券</span></label>
	          <label><a href="#"><#if level??>${level.experience?c}<#else>0</#if></a><span>经验</span></label>
	          <#--label><a href="#">20</a><span>金币</span></label-->
	        </div>
	      </div>
      </#if>
    </div>
    <div class="cleft_comment">
      <div class="com_title"><a href="/person/core"  class="this_a">首页</a><a href="#">评论</a><a href="#">消息</a><a href="#">收藏</a><a href="#">设置</a><a href="#">原创</a><a href="#">百科</a><a href="#">资讯</a><a href="#">爆料</a></div>
      <div class="myself_index1">
        <div class="myindex1_title">
          <label>原创</label>
          <a href="#">更多</a></div>
        <ul>
          <li>
          	<#if article??>
      			<div class="create_pic"><img src="${article.imgUrl!''}" /></div>
	              <div class="create_word">
	                <label class="create_label1">${article.title!''}</label>
	                <label class="create_label2">操作： <a href="#">编辑</a><a href="#">预览</a><a href="#">删除</a></label>
	              </div>
	            </div>
	            <div class="create_time"><#if time??>${time}</#if></div>
          	<#else>
          		<div class="none">还没有任何文章</div>
          	</#if>
            <div class="create">
              
          </li>
        </ul>
      </div>
      <div class="myself_index2">
        <div class="myindex1_title">
          <label>咨询</label>
          <a href="#">更多</a></div>
        <div class="none">还没有任何咨询</div>
      </div>
      <div class="myself_index3">
        <div class="myindex1_title">
          <label>百科</label>
          <a href="#">更多</a></div>
        <div class="none">还没有任何百科</div>
      </div>
      <div class="myself_index4">
        <div class="myindex1_title">
          <label>爆料</label>
          <a href="#">更多</a></div>
        <div class="none">还没有任何爆料</div>
      </div>
    </div>
  </div>
  <!-- -----------------------中间  之右边---------------------------- -->
  
     <div class="c_right">
    <div class="hot">
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
    <div class="hot_cheap" >
      <div class="cheap_title"><a href="#" class="t_a1">热门商品</a><a href="#" class="t_a2">更多</a></div>
      
      <!-- 商品轮播 -->
      <div class="picScroll">
        <div class="bd"> <a href="javascript:void(0)" class="prev"></a> <a href="javascript:void(0)" class="next"></a>
          <div class="scrollWrap">
            <ul class="picList">
              <li> <a href="#" ><img src="images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="images/cheap.png"></a> </li>
              <li> <a href="#" ><img src="images/bo.png"></a></li>
            </ul>
          </div>
        </div>
      </div>
      <script type="text/javascript">
	jQuery(".picScroll").slide({ mainCell:".picList", effect:"left",vis:1, pnLoop:false, scroll:1, autoPage:true});
	</script> 
      
      <!-- 商品轮播结束 -->
      <div class="cheap_news">
        <ul>
          <li class="li_first">
            <div class="yeleft"><img src="images/cheap2.png" /></div>
            <div class="yeright">
              <h1>漂亮的不像手环<br />
                ------月霜手环评测</h1>
              <h6><a href="#">评论<span>1000</span></a><a href="#">赞<span>1000</span></a></h6>
            </div>
          </li>
          <li>
            <div class="yeleft"><img src="images/cheap2.png" /></div>
            <div class="yeright">
              <h1>漂亮的不像手环<br />
                ------月霜手环评测</h1>
              <h6><a href="#">评论<span>1000</span></a><a href="#">赞<span>1000</span></a></h6>
            </div>
          </li>
          <li>
            <div class="yeleft"><img src="images/cheap2.png" /></div>
            <div class="yeright">
              <h1>漂亮的不像手环<br />
                ------月霜手环评测</h1>
              <h6><a href="#">评论<span>1000</span></a><a href="#">赞<span>1000</span></a></h6>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
    
<!-- -----------------------中间  之右边结束---------------------------- --> 

<!-- -----------------------底部---------------------------- -->
<#include "/client/common_footer.ftl">
<!-- -----------------------底部结束---------------------------- -->
</body>
</html>
