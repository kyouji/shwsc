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
        <#if email??>
    		<div class="join" onmouseover="join()" onmouseout="join_out()">
    			<a href="#" ><span id="final_name">${email!''}</span><img src="/client/images/xiala.png" /></a>
			    <div class="join_raw" id="join_raw">
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