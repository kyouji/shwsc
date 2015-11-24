<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!--css-->

<script src="/client/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/client/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
<title>叫个厨子</title>

</head>
<body>
  <!-- 登录注册 -->
  <article class="art-bg">
	<section class="sec-login-title">
	  <div class="store-name">叫个厨子</div>
	  <div class="subtitle">
	  	<p class="p1">全国最大的互联网私厨平台</p>
	  	<p class="p2">jiaogechuzi.com</p>
	  </div>
	  <div class="visitor"><a href="#">游&nbsp;客</a></div>
	</section>
  </article>

  <article class="login-register">
  	<div class="tab-view">
  	  <ul class="title-group-login-register">
        <li class="active"><a href="#">登录</a></li>
        <li><a href="#">注册</a></li>
      </ul>
      <ul class="group-login-register">
	    <!-- 登录 -->
        <li style="display:block;" class="login">
          <form>
          	<div class="phone-num">
          	  <input type="text" maxlength="11" id="txt_loginId" value="" placeholder="手机号">
          	</div>
          	<div class="password">
          	  <input type="password"  id="txt_loginPwd" value=""   placeholder="密码">
          	</div>

			<div class="login-way">
			  <input class="checkbox" type="checkbox">
			  <div class="group-login-way">
			  	<p class="p1 c999">其他方式登录</p>
			  	<p class="p2">
			  	  <a href="#">QQ</a>/
			  	  <a href="#">微信</a>/
			  	  <a href="#">微博</a>
			  	</p>
			  </div>
			  <input class="btn-login" type="button"  id="btn_login"  value="登 录">
			</div>

          </form>
        </li>
        <!-- 注册 -->
        <li class="register">
          <form id="form1" action="user/reg" method="post">
          	<div class="phone-num">
          	  <input type="text" maxlength="11"  id="mobileNumber" name="username" datatype="m"  ajaxurl="/reg/check/mobile"/ placeholder="手机号">
          	</div>
          	<div class="security-code">
          	  <input type="text" name="smsCode" placeholder="验证码">
          	  <a class="btn-get-code" href="#">获取验证码</a>
          	</div>
          		<div class="password">
          	  <input type="text" name="password" placeholder="密码">
          	</div>
          	<input class="btn-register" type="submit" value="注 册">
          	<div class="sec1 c999">新用户注册即送20元优惠券</div>
          	<div class="sec1 c999"><input type="checkbox">我已阅读并同意《叫个厨子》相关条例</div>
          	<div class="sec2 c999">已注册，直接<a id="click-login" href="#">登录</a></div>
          </form>
        </li>
      </ul>
  	</div>
    <script type="text/javascript">
      $(document).ready(function(){
    	$('.tab-view .title-group-login-register').on('click','a',function(){
    		var $self = $(this);//当前a标签
    		var $active = $self.closest('li');//当前点击li
    		var index = $active.prevAll('li').length;//当前索引

    		$active.addClass('active').siblings('li').removeClass('active');
    		$('.group-login-register').find('>li')[index==-1?'show':'hide']().eq(index).show();
    	});
    	$('#click-login').click(function(){
    	  $('.group-login-register>li').removeClass('active').hide().next().siblings('li').addClass('active').show();
    	});
      });
    </script>
  </article>
<script type="text/javascript">
	$(function(){
	
	    $("#btn_login").click(function(){
	    	login();
	    });
	     
	});
   function login(){
        var username = $("#txt_loginId").val();
        var password = $("#txt_loginPwd").val();
        
        if (username.length < 6 || password.length < 6)
        {
            alert("用户名或密码长度输入不足");
            return;
        }
        $.ajax({
                type: "post",
                url: "/login/login",
                data: { "username": username, "password": password },
                dataType: "json",
                success: function (data)
                { 
                <!-- 修改 -->
                    if (data.code == 1)
                    {
                    //alert(data.msg);
                       window.location.href="/center";
                    } 
                    else
                    {
                        alert(data.msg);
                    }
                }
            });
    };


</script>
  <!-- 登录注册 END -->
</body>
</html>