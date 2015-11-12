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