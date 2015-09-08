<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>云南车有同盟商贸有限公司</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="云南车有同盟商贸有限公司" />
<link rel="shortcut icon" href="/client/images/cheyou.ico" />
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cytm.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<link href="/client/style/bankLogo.css" rel="stylesheet" type="text/css" />
<link href="/client/style/change_paymethod.css" rel="stylesheet" type="text/css" />
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/mymember.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script src="/client/js/jquery.cookie.js"></script>

<!--[if IE]>
   <script src="/client/js/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="/client/js/DD_belatedPNG_0.0.8a.js" ></script>
<script>
DD_belatedPNG.fix('.,img,background');
</script>
<![endif]-->
<script type="text/javascript">
  $(document).ready(function(){
    menuDownList("top_phone","#top_phonelist",".a1","sel");
    phoneListMore();//单独下拉
    menuDownList("top_order","#top_orderlist",".a4","sel");//顶部下拉
    navDownList("navdown","li",".nav_showbox");
    menuDownList("mainnavdown","#navdown",".a2","sel");
    checkNowHover("shopping_down","shopping_sel");
});
</script>
<script type="text/javascript">
    var forPaymentFllow = false;
</script>
</head>
<body>
<!-- header开始 -->
<#include "/client/common_header.ftl" />
<!--header结束-->
<div class="mymember_out">
<div class="mymember_main">
  <div class="myclear" style="height:20px;"></div>
  <#-- 左侧菜单 -->
  <#include "/client/common_user_menu.ftl" />
  <#-- 左侧菜单结束 -->
  
  <div class="mymember_mainbox">
    <div class="mymember_info mymember_info04">
      <h3>订单详细</h3>
      <dl>
        <dt>订单编号：${order.orderNumber!''}&nbsp;&nbsp;&nbsp;&nbsp; 下单时间：${order.orderTime!''}&nbsp;&nbsp;&nbsp;&nbsp;当前进度：
            <#if order??>
                <#if order.statusId==1>
                    待确认
                <#elseif order.statusId==2>
                    待付款
                <#elseif order.statusId==3>
                    待付尾款
                <#elseif order.statusId==4>
                    待服务
                <#elseif order.statusId==5>
                    待评价
                <#elseif order.statusId==6>
                    已完成
                <#elseif order.statusId==8>
                    支付失败
                </#if>
            </#if>
        </dt>
        <dt>
                     支付方式：<#if order??>${order.payTypeTitle!''}</#if>&nbsp;&nbsp;&nbsp;&nbsp;支付总额：<span>￥<#if order??><#if order.statusId==3>${order.totalLeftPrice?string("0.00")}(团购尾款)<#else>${order.totalPrice?string("0.00")}</#if></#if></span>
        </dt>
        <dd>
            <#if order??>
                <#if order.statusId==1>
                    请稍等，我们将尽快确认您的订单。
                <#elseif order.statusId==2>
                    亲爱的客户，此订单还未支付，您可以<a href="/order/dopay/${order.id?c}" style="color: #F00;">去支付</a>或者<span id="change_paytype" data-orderid="${order.id?c}" style="color: #F00;cursor:pointer;">修改支付方式</span>。
                <#elseif order.statusId==3>
                    亲爱的客户，此订单还需支付尾款，您可以<a href="/order/dopayleft/${order.id?c}" style="color: #F00;">去支付</a>或者<span id="change_paytype" data-orderid="${order.id?c}" style="color: #F00;cursor:pointer;">修改支付方式</span>。
                <#elseif order.statusId==4>
                    亲爱的客户，订单支付成功，您可以到店进行消费。
                <#elseif order.statusId==5>
                    亲爱的客户，您已消费成功，您可以<a href="/user/comment/list">发表评论</a>。
                <#elseif order.statusId==6>
                    亲爱的客户，此订单已交易成功。
                <#elseif order.statusId==8>
                    亲爱的客户，此订单支付失败,已取消。
                </#if>
            </#if>
        </dd>
      </dl>
      <#assign maxMethodCount=3/>
      <#assign changePayMethod=true/>
      <#include "/client/paybox_common.ftl" />
      <script type="text/javascript" src="/client/js/change_paymethod.js"></script>
      <div class="mymember_green">
        <#if order??>
            <#if order.statusId==2>
                <p><i></i>订单付款</p>
                <p><i></i><b></b>到店消费</p>
                <p><i></i><b></b>评价</p>
                <p><i></i><b></b>完成</p>
            <#elseif order.statusId==3>
                <p class="mysel"><i></i>订单付款</p>
                <p><i></i><b></b>到店消费</p>
                <p><i></i><b></b>评价</p>
                <p><i></i><b></b>完成</p>
            <#elseif order.statusId==4>
                <p class="mysel"><i></i>订单付款</p>
                <p class="mysel"><i></i><b></b>到店消费</p>
                <p><i></i><b></b>评价</p>
                <p><i></i><b></b>完成</p>
            <#elseif order.statusId==6>
                <p class="mysel"><i></i>订单付款</p>
                <p class="mysel"><i></i><b></b>到店消费</p>
                <p class="mysel"><i></i><b></b>评价</p>
                <p class="mysel"><i></i><b></b>完成</p>
            </#if>
        </#if>
        
        <div class="clear"></div>
      </div>
    </div><!--mymember_info END-->
    
    <div class="mymember_info mymember_info04">
      <h3>订单详细信息<a id="mymember_order01" href="javascript:myOrderShow('mymember_order01','mymember_ordersum01');">展开</a></h3>
      
      <table id="mymember_ordersum01" class="mymember_sq_tab">
        <tbody>
        <tr>
          <th width="100">订单编号</th>
          <td><#if order??>${order.orderNumber!''}</#if></td>
        </tr>
        <tr>
          <th>订单总额</th>
          <td>
            总额:
            <font color="#ff1000">￥<#if order??>${order.totalPrice?string("0.00")}</#if></font>
            &nbsp;&nbsp;=&nbsp;&nbsp;商品总金额:￥${order.totalGoodsPrice?string("0.00")}
            <#if order.deliverTypeFee??>
            &nbsp;&nbsp;+&nbsp;&nbsp;配送费用:￥${order.deliverTypeFee?string("0.00")}
            </#if>
            &nbsp;&nbsp;-&nbsp;&nbsp;粮草抵扣:￥${order.pointUse!'0'}
            &nbsp;&nbsp;-&nbsp;&nbsp;优惠券抵扣:￥${order.couponUse!'0'}
            &nbsp;&nbsp;&nbsp;&nbsp;支付方式：${order.payTypeTitle!''}
          </td>
        </tr>
        <tr>
          <th>安装信息</th>
          <td>同盟店：${order.shopTitle!''}&nbsp;&nbsp;&nbsp;&nbsp; 预约时间：<#if order.appointmentTime??>${order.appointmentTime?string("yyyy-MM-dd HH:mm:ss")}</#if>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <#--
        <tr>
          <th>联系方式</th>
          <td>联系人：<#if order??>${order.shippingName!''}</#if> &nbsp;&nbsp;&nbsp;&nbsp; 联系电话：${order.shippingPhone!''}</td>
        </tr>
        -->
      </tbody></table>
    </div><!--mymember_info END-->
    
    <div class="mymember_info mymember_info02">
      <table>
        <tbody>
        <tr class="mymember_infotab_tit01">
          <th colspan="2">商品信息</th>
          <th>赠品</th>
          <th>单价</th>
          <th>数量</th>
        </tr>   
        <#if order?? && order.orderGoodsList??>
            <#list order.orderGoodsList as og>
                <tr>
                  <td width="60" class="td001">
                    <a href="/goods/${og.goodsId?c}"><img src="${og.goodsCoverImageUri}"></a>
                  </td>
                  <td>
                    <a href="/goods/${og.goodsId?c}">${og.goodsTitle}</a>                 
                  </td>
                  <td width="260">
                  <#if goods_list??>
                    <#list goods_list as goodslist>
                        <#if goodslist.id == og.goodsId>
                            <#if goodslist.giftList??>
                              <#list goodslist.giftList as gl>
                                <#if gl_index < 5>
                                    <a href="/goods/${gl.goodsId?c}" title="${gl.goodsTitle}" style="display:block; float:left; width:50px; height:33px; overflow:hidden; float:left;">
                                        <img src="${gl.coverImageUri}" width="30" height="30" />
                                    </a>
                                </#if>
                              </#list>
                            </#if>
                        </#if>
                    </#list>
                  </#if>
                  </td>
                  <td>${og.price?string("#.##")}</td>
                  <td>${og.quantity!''}</td>
                </tr>
            </#list>
        </#if>
        </tbody>
      </table>
      
    </div><!--mymember_info END-->

    </div><!--mymember_mainbox END-->

  <div class="myclear"></div>  
</div><!--mymember_main END-->
<div class="myclear"></div>
</div>
<!--主体结束-->
<#include "/client/common_footer.ftl" />
</body>
</html>
<!--结束-->
