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
<title>叫个厨子</title>
<script>
function setDefault(id)
{
	    $.ajax({
        type:"post",
        url:"user/address/setDefault",
        data:{"id":id},
        success:function(data){
			if (data.code == 0)
			{
				alert("设置成功！");
				location.reload();
			}
			else
			{
                 alert(data.msg);
			}
        }
    });
}
</script>
</head>
<body class="bgc-f2">
    <!-- 头部 -->
    <header>
      <a class="back" href="/center"></a>
      <p>常用地址</p>
     
    </header>
    <!-- 头部 END -->

    <!-- 常用地址 -->
    <article class="common-address">
    <#if shipping??><#list shipping as item>
    <#if item.detailAddress??>
      <section class="sct1" >
       <p class="p1"><span>${item.receiverName!''}</span><span></span><span>${item.receiverMobile!''}</span><span style="float:right;"><a style="color:#999;margin-right:8px;" onclick="javascript:setDefault(${item.id?c});"> 设置默认</a><a style="color:#999;" href="/user/address/delete/${item.id?c}">删除</a></span></p>
        <p class="p2"><#if item.isDefaultAddress??&&item.isDefaultAddress>（默认）</#if>	${item.detailAddress!''}</p>
      </section>
      </#if>
      </#list></#if>
    </article>
    <!-- 常用地址 END -->

    <!-- 底部 -->
    <footer class="bdt-n">
      <a class="add-address" href="/tjxdz">添加新地址</a>
    </footer>
    <!-- 底部 END -->

</body>
</html>