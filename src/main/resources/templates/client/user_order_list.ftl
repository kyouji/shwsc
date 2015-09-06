<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><#if site??>${site.seoTitle!''}-</#if>云南车有同盟商贸有限公司</title>
<meta name="keywords" content="${site.seoKeywords!''}" />
<meta name="description" content="${site.seoDescription!''}" />
<meta name="copyright" content="云南车有同盟商贸有限公司" />
<link href="/client/css/common.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cytm.css" rel="stylesheet" type="text/css" />
<link href="/client/css/cartoon.css" rel="stylesheet" type="text/css" />
<link href="/client/css/style.css" rel="stylesheet" type="text/css" />
<link href="/client/css/mymember.css" rel="stylesheet" type="text/css" />
<link href="/mag/style/idialog.css" rel="stylesheet" id="lhgdialoglink">
<!--<link href="/client/css/member.css" rel="stylesheet" type="text/css" />-->
<script src="/client/js/jquery-1.9.1.min.js"></script>
<script src="/client/js/mymember.js"></script>
<script src="/client/js/common.js"></script>
<script src="/client/js/ljs-v1.01.js"></script>
<script type="text/javascript" src="/mag/js/lhgdialog.js"></script>
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

   
 //发送AJAX请求
        function sendAjaxUrl(winObj, postData, sendUrl) {
            $.ajax({
                type: "post",
                url: sendUrl,
                data: postData,
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $.dialog.alert('尝试发送失败，错误信息：' + errorThrown, function () { }, winObj);
                },
                success: function (data) {
                    if (data.code == 0) {
                        winObj.close();
                        $.dialog.tips(data.msg, 2, '32X32/succ.png', function () { location.reload(); }); //刷新页面
                    } else {
                        $.dialog.alert('错误提示：' + data.msg, function () { }, winObj);
                    }
                }
            });
        }
</script>

</head>
<body>
<#include "/client/common_header.ftl" />

<!--mymember-->
<div class="myclear"></div>
<div class="mymember_out">
    <div class="mymember_main">
    <div class="myclear" style="height:20px;"></div>
    <#include "/client/common_user_menu.ftl" />
  
    <form name="form1" action="/user/order/list/${status_id}" method="POST">
        <script type="text/javascript">
            var theForm = document.forms['form1'];
            if (!theForm) {
                theForm = document.form1;
            }
            function __doPostBack(eventTarget, eventArgument) {
                if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                    theForm.submit();
                }
            }
        </script>
        <div class="mymember_mainbox">
            <div class="mymember_info mymember_info02">
                <div class="mymember_order_search">
                    <a class="a001" href="/user/order/list/${status_id}">
                        <#if status_id==0>
                            全部订单
                        <#elseif status_id==1>
                            待确认订单
                        <#elseif status_id==2>
                            待付款订单
                        <#elseif status_id==3>
                            待付尾款订单
                        <#elseif status_id==4>
                            待服务订单
                        <#elseif status_id==5>
                            待评价订单
                        <#elseif status_id==6>
                            已完成订单
                        <#elseif status_id==7>
                            已取消订单
                        <#elseif status_id==9>
                            已删除订单
                        </#if>
                    </a>
                </div>
                <table>
                    <tr class="mymember_infotab_tit01">
                        <th>订单信息</th>
                        <th width="100">预约时间</th>
                        <th width="120">预约门店</th>
                        <th width="70">收货人</th>
                        <th width="80">订单金额</th>
                        <th width="80">
                            <select name="timeId" onchange="javascript:setTimeout(__doPostBack('statusId',''), 0)">
                                <option value="0" <#if !time_id?? || time_id==0>selected="selected"</#if>>所有订单</option>
                                <option value="1" <#if time_id==1>selected="selected"</#if>>最近一个月</option>
                                <option value="3" <#if time_id==3>selected="selected"</#if>>最近三个月</option>
                                <option value="6" <#if time_id==6>selected="selected"</#if>>最近半年</option>
                                <option value="12" <#if time_id==12>selected="selected"</#if>>最近一年</option>                              
                            </select>
                        </th>
                        <th width="80"></th>
                        <th width="60">操作</th>
                    </tr>    
                    <#if order_page??>
                        <#list order_page.content as order>
                        <script>
                         //取消订单
                    function OrderCancel${order.id?c}() {
                        var dialog = $.dialog({
                            title: '取消订单',
                            content: '操作提示信息：<br />1、取消的订单，将不在购买流程中显示，您可以到取消的订单中查阅；<br />2、请单击相应按钮继续下一步操作！',
                            min: false,
                            max: false,
                            lock: true,
                            icon: 'confirm.gif',
                            button: [{
                                name: '直接取消',
                                callback: function () {
                                    var orderNumber = $.trim($("#spanOrderNumber${order.id?c}").text());
                                    var postData = { "orderNumber": orderNumber, "type": 1 };
                                    //发送AJAX请求
                                    sendAjaxUrl(dialog, postData, "/user/order/edit");
                                    return false;
                                },
                                focus: true
                        }, {
                            name: '关闭'
                        }]
                    });
        
                }
                //作废订单
                    function OrderInvalid${order.id?c}() {
                        var dialog = $.dialog({
                            title: '取消订单',
                            content: '操作提示信息：<br />确定删除订单？',
                            min: false,
                            max: false,
                            lock: true,
                            icon: 'confirm.gif',
                            button: [{
                                name: '确定删除',
                                callback: function () {
                                    var order_no = $.trim($("#spanOrderNumber${order.id?c}").text());
                                    var postData = { "orderNumber": order_no, "type": 2 };
                                    //发送AJAX请求
                                    sendAjaxUrl(dialog, postData, "/user/order/edit");
                                    return false;
                                }
                            }, {
                                name: '关闭'
                            }]
                        });
                    }
                        </script>
                            <tr>
                              <th colspan="8">订单编号：<a href="/user/order?id=${order.id?c}" id="spanOrderNumber${order.id?c}">${order.orderNumber!''}</a></th>
                            </tr>
                            <tr>
                              <td class="td001">
                                <#list order.orderGoodsList as og>
                                    <a href="/goods/${og.goodsId?c}"><img src="${og.goodsCoverImageUri}"></a>
                                </#list>
                              </td>
                              <td>
                                 ${order.appointmentTime!''}
                              </td>
                              <td>${order.shopTitle!''}</td>
                              <td>${order.shippingName!''}</td>
                              <td>
                                <p>￥${order.totalPrice?string("#.##")}</p>
                                <p>${order.payTypeTitle!''}</p>
                              </td>
                              <td class="td003">
                                ${order.orderTime!''}
                              </td>
                              <td>
                                <p>
                                    <#if order.statusId==1>
                                        待确认
                                    <#elseif order.statusId==2>
                                        <p>待付款</p>
                                        <#--
                                        <a href="/order/cancel/${order.id}">取消订单</a>
                                        -->
                                        <a href="/order/dopay/${order.id?c}">立即支付</a>
                                    <#elseif order.statusId==3>
                                        <p>待付尾款</p>
                                        <a href="/order/dopayleft/${order.id?c}">去支付</a>
                                    <#elseif order.statusId==4>
                                        待服务
                                    <#elseif order.statusId==5>
                                        <p>待评价</p>
                                        <a href="/user/comment/list">发表评论</a>
                                    <#elseif order.statusId==6>
                                        已完成
                                    <#elseif order.statusId==7>
                                        <p>已取消</p>
                                        <#--
                                        <a href="/order/delete/${order.id}">删除</a>
                                        -->
                                    </#if>
                                </p>
                              </td>
                              <td class="td003"> 
                                <#if order.statusId==2 >
                                    <p><a href="javascript:OrderCancel${order.id?c}()">取消</a></p>
                                <#elseif order.statusId==6>
                                    <p><a href="javascript:OrderInvalid${order.id?c}()">删除</a></p>
                                <#else>
                                    <p><a href="/user/order?id=${order.id?c}">查看</a></p>
                                </#if>
                                <#if order.statusId==5>
                                    <p><a href="/user/comment/list">评价</a></p>
                                <#elseif order.statusId==6>
                                    <p><a href="/user/return/${order.id?c}">申请返修/退换货</a></p>
                                </#if>
                              </td>
                            </tr>
                            
                        </#list>
                    </#if>
                </table>
                <div class="myclear" style="height:10px;"></div>
                <div class="mymember_page">
                    <#if order_page??>
                    <#assign continueEnter=false>
                    <#if order_page.totalPages gt 0>
                        <#list 1..order_page.totalPages as page>
                            <#if page <= 3 || (order_page.totalPages-page) < 3 || (order_page.number+1-page)?abs<3 >
                                <#if page == order_page.number+1>
                                    <a class="mysel" href="javascript:;">${page}</a>
                                <#else>
                                    <a href="/user/order/list/${statusId}?page=${page-1}&timeId=${time_id}&keywords=${keywords!''}">${page}</a>
                                </#if>
                                <#assign continueEnter=false>
                            <#else>
                                <#if !continueEnter>
                                    <b class="pn-break">&hellip;</b>
                                    <#assign continueEnter=true>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                  </#if>
                </div>
            </div>
    
    
        </div><!--mymember_center END-->
        
    </form>
    <div class="myclear"></div>
    </div><!--mymember_main END-->
    <div class="myclear"></div>
</div>
<!--mymember END-->
<#include "/client/common_footer.ftl" />

<script type="text/javascript">
$(document).ready(function(){
    mymemberMenuCheck("mymember_right_menu","a","mymember_right_check","li","mysel");
    mymemberRightMove("mymember_storybox",70,90,"mymember_story_next",15,3,"a");
    mymemberRightMove("mymember_gzbox",205,241,"mymember_gznext",15,3,"a");
    mymemberRightMove("mymember_shinebox",205,310,"mymember_shinenext",15,3,"div");
});
</script>
</body>
</html>
