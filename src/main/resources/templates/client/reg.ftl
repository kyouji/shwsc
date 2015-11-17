<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="/client/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="/client/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="/client/js/index.js"></script>
<script type="text/javascript" src="/client/js/Validform_v5.3.2_min.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/register.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/index.css"/>
<script type="text/javascript">
    $(document).ready(function(){
        //初始化表单验证
        $("#form1").Validform({
            tiptype: 3
        });
    });
    
    function chang(){
        var imgSrc = $("#img");
        var src = imgSrc.attr("src");
        imgSrc.attr("src","/code?date="+Math.random());
    }
    
</script>
</head>
<body>

<#-- 登录表格 -->
<div class="in_back" id="login-div" style="display:none"> 
<div class="sign_in">
  <div class="in_title">
    <label>登录</label>
    <a href="/reg">注册</a><i><a href="javascript:login_div_out();"><img src="client/images/iconfont-cha.png" /></a></i></div>
    <span style="color:red" id="msg"></span>
  <form id="login_form">
    <div>
        <input type="text" datatype="*,e" nullmsg="请输入用户名" id="email" placeholder="请输入用户名"/>
        <span class="Validform_checktip"></span>
    </div>
    <div>
        <input type="password" datatype="*" nullmsg="请输入密码" id="password" placeholder="请输入密码"/>
        <span class="Validform_checktip"></span>
    </div>
    <div class="forget">
      <input type="radio" name="saveCookie" class="dan" />
      <label>一个月内免登录</label>
      <a href="#">忘记密码？</a></div>
    <input type="submit" value="登录" id="btn_login" class="in_bottom"/>
  </form>
  <div class="other_in">
    <label class="label_contact">联合登录</label>
    <label class="QQ"><a href="#">新浪微博</a><a href="#">腾讯QQ</a><a href="#">腾讯微博</a><a href="#">我买网</a></label>
  </div>
</div></div>
<#-- 登录表格 -->

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
    <div class="join" onmouseover="join()" onmouseout="join_out()">
        <a href="#" ><span>爆料编辑</span><img src="/client/images/xiala.png" /></a>
        <div class="join_raw" id="join_raw">
            <a href="#" >优惠爆料</a>
            <a href="#" >分享商品</a>
            <a href="#" >原创投稿</a>
        </div>
    </div>
  </div>
</div>
<!-- -----------------------导航结束---------------------------- --> 
<!-- -----------------------头部---------------------------- -->
<div  class="head_back">
  <div class="head">
    <div class="head_left"><a href="/"><img src="<#if setting??>${setting.logoUri!''}</#if>" /></a></div>
    <div class="head_center">
      <form action="/search" method="post">
        <input type="text" class="search" name="keywords" value="" onfocus="myfocus()" onblur="myblur()"/>
        <input type="submit" class="ok" value="">
    </form>
    </div>
    <div class="head_right">
      <div class="right1">
        <label class="head_label1">App下载</label>
        <label class="head_label2">手机返利价更优</label>
      </div>
      <img src="<#if setting??>${setting.weiboQrCode!''}</#if>"/></div>
  </div>
</div>
<!-- -----------------------头部结束---------------------------- --> 

<!-- -----------------------中间  之左边---------------------------- -->
<div class="content">
  <div class="register_title">
    <label>注册<span>收藏您喜欢的商品和店铺；积累积分兑换商家优惠券；爆料并获取金币奖励，兑换礼品</span></label>
    <a href="javascript:login_div_in();">登录</a></div>
  <form id="form1" method="post" action="/reg" class="register_form">
    <div>
        <input type="text" name="email" datatype="*,e" errormsg="请输入正确的邮箱地址" ajaxurl="/reg/email/{email}" value="${email!''}" placeholder="邮箱"/>
        <span class="Validform_checktip newerror"></span>
    </div>
    <div>
        <input type="password" name="password" datatype="*6-18" errormsg="请输入密码,最少6位,最多18位" placeholder="密码"/>
        <span class="Validform_checktip newerror"></span>
    </div>
    <div>
        <input type="password" name="password1" datatype="*" recheck="password" errormsg="两次输入密码不一致" placeholder="确认密码"/>
        <span class="Validform_checktip newerror"></span>
    </div>
    <div>
        <input type="txet" name="nickname" datatype="*" placeholder="用户昵称"/>
        <span class="Validform_checktip newerror"></span>
    </div>
    <div class="sure_word">
       <input type="text" name="code" datatype="s4-4" errormsg="请填写4位字符" placeholder="验证码"/>
      <img id="img" src="/code" onclick="this.src = '/code?date='+Math.random();"/><a href="#" onclick="chang();">看不清？换一张</a>
      <span class="Validform_checktip newerror"><#if errCode??><b style="color:red">验证码错误</b></#if></span>
      </div>
      
    <div class="agree">
      <input type="radio" name="" class="dan" datatype="*"/>
      <label>同意</label>
      <a href="#">《精品导购协议》</a>
      <span class="Validform_checktip newerror"></span>
    </div>
    <input type="submit" value="注           册" class="register"/>
  </form>
</div>
<!-- -----------------------底部---------------------------- -->
<#include "/client/common_footer.ftl" />
<!-- -----------------------底部结束---------------------------- -->
</body>
</html>
