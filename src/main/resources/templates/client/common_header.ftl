<div class="head" style="min-width:1200px;">
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

