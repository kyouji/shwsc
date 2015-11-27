<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="copyright" content="" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!--css-->
<link rel="stylesheet" type="text/css" href="/client/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/client/css/main.css"/>
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/Validform_v5.3.2_min.js"></script>
<title>叫个厨子</title>
</head>
<body>
    <!-- 头部 -->
    <header>
      <a class="back" href="/message"></a>
      
      <!-- 验证信息的准确性-->
    <!--  <script type="text/javascript"> 
	$(function(){
	    $("#message_yz").click(function(){
	    	message();
	    });  
	});

   function message(){
   
   		var re = /^1\d{10}$/;
        var nickname1 = $("#nickname").val();
        var mobile1 = $("#mobile").val();
        var detailAddress1 = $("#detailAddress").val();
        var sex1 = $("#sex").val();
        var career1 = $("#career").val();
        
        if (nickname1.length==0 || mobile1.length==0 || detailAddress1.length==0 || career1.length==0)
        {
            alert("信息不能为空");
            return;
        }
         if (!re.test(mobile)) {
            alert("请输入正确的手机号");
            return;
        }
     
    }
</script> -->
      <p>基本信息</p>
    </header>
    <!-- 头部 END -->

    <!-- 头像和签名 -->
    <article class="head-signature">
      <!-- 图片原始尺寸 150*150-->
      <a href="/head_portrait"><img src="/client/images/head_portrait.jpg" alt="头像"></a>
      <div class="div2">
        <span>"</span>
        <span class="c000">美食签名可以提高你的逼格哦</span>
      </div>
    </article>
    <!-- 头像和签名 END -->

    <!-- 基本信息浏览 -->
    <article class="base-info-look">
    <form id="form1" action="/user/savee" method="post">
      <section>
        <div class="div1">
          <label>昵称</label>
          <!-- <span>邓qq</span> -->
          <input type="text" name="nickname" value="${user.nickname!''}">
        </div>
        <div class="div2">
          <label>手机号</label>
          <!-- <span>13355023236</span> -->
          <input type="text" name="mobile" value="${user.mobile!''}">
        </div>
        <div class="div3">
          <label>地址</label>
          <!-- <span>重庆市沙坪坝区天星桥晒光平1号 21-8</span> -->
          <input type="text" name="detailAddress" value="${user.detailAddress!''}">
        </div>
        <div class="div4">
          <label>性别</label>
          <!-- <span>女</span> -->
          <select  name="sex">
            <option value="男">男</option>
            <option value="女">女</option>
          </select>
        </div>
        <div class="div5">
          <label>职业</label>
          <!-- <span>医生</span> -->
          <input type="text" name="career" value="${user.career!''}">
        </div>
      </section>
      <input  class="btn-submit" type="submit" value="提交">
    </form>
    </article>
    <!-- 基本信息浏览 END -->

</body>
</html>