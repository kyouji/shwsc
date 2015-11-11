<div class="head">
  <div class="head_left">
    <a href="/"><img src="<#if setting??>${setting.logoUri!''}</#if>" /></a>
  </div>
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

<#-- 登录表格 -->
<div id="login-div" class="in_back" style="visibility: hidden;"> 
    <div class="sign_in">
      <div class="in_title">
        <label>登录</label>
        <a href="/reg">注册</a><i><a href="javascript:login_div_out();"><img src="/client/images/iconfont-cha.png" /></a></i></div>
        <form>
            <input type="text" placeholder="请输入用户名"/>
            <input type="password" placeholder="请输入密码"/>
            <div class="forget">
                <input type="radio" class="dan"/>
                <label>一个月内免登录</label>
                <a href="#">忘记密码？</a>
            </div>
            <input type="submit" value="登录" class="in_bottom"/>
        </form>
      <div class="other_in">
        <label class="label_contact">联合登录</label>
        <label class="QQ">
            <a href="#">新浪微博</a>
            <a href="#">腾讯QQ</a>
            <a href="#">腾讯微博</a>
            <a href="#">我买网</a>
        </label>
      </div>
    </div>
</div>
<#-- 登录表格 -->