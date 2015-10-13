//$(document).ready(function(){
//   
//    // 配送方式切换
//    $("#deliveryTypeSelect").change(function(){
//        var deliPrice = parseFloat($(this).find("option:selected").attr("price"));
//        var curPrice = parseFloat($("#currentPrice").html());
//        
//        $("#deliveryFee").html(deliPrice);
//        $("#totalPrice").html(curPrice + deliPrice);
//    });
//    
//    
//});

function payTypeChange(self)
{
    
}

function couponChange()
{
    var couponFee = parseFloat($("#couponSelect option:selected").attr("fee"));
    
    if (undefined == couponFee)
    {
        couponFee = 0;
    }
    
    var goodsFee = parseFloat($("#goodsFee").html());
    var payTypeFee = parseFloat($("#payTypeFee").html());
    var pointFee = parseFloat($("#pointFee").html());
    
    $("#couponFee").html(couponFee);
    $("#couponFeee").html(couponFee);
    if(pointFee + couponFee > goodsFee + payTypeFee){
    	$("#totalFee").html(0);
    }
    else{
    	$("#totalFee").html(goodsFee + payTypeFee - pointFee - couponFee);
    }
    
}

//function couponChange()
//{
//    var couponFee = parseFloat($("#couponSelect option:selected").attr("fee"));
//    
//    if (undefined == couponFee)
//    {
//        couponFee = 0;
//    }
//    
//    var goodsFee = parseFloat($("#goodsFee").html());
//    var payTypeFee = parseFloat($("#payTypeFee").html());
//    var pointFee = parseFloat($("#pointFee").html());
//    
//    $("#couponFee").html(couponFee);
//    $("#couponFeee").html(couponFee);
//    $("#totalFee").html(goodsFee + payTypeFee - couponFee - couponFee);
//}

function pointChange(self, point, total)
{
    if (null == point || null == total)
    {
        return;
    }
    
    var goodsFee = parseFloat($("#goodsFee").html());
    var payTypeFee = parseFloat($("#payTypeFee").html());
    var couponFee = parseFloat($("#couponFee").html());
    
    var p = parseInt(point);
    var t = parseInt(total);
    
    if (p > t)
    {
        alert("最多使用粮草" + t + "份");
        self.value = 0;
        
        $("#pointFee").html(0);
        $("#totalFee").html(goodsFee + payTypeFee - 0 - couponFee);
        
        return;
    }
    
    if(point + couponFee > goodsFee + payTypeFee){
    	alert("使用粮草大于商品金额！");
    	if(goodsFee + payTypeFee - couponFee > 0){
    		self.value = 0;
    		$("#pointFee").html(0);
    		$("#totalFee").html(goodsFee + payTypeFee - 0 - couponFee);
    	}
    	else{
    		self.value = 0;
    		$("#pointFee").html(0);
    	    $("#totalFee").html(0);
    	}
    }
    else{
    	self.value = point;
        
        $("#pointFee").html(point);
        $("#totalFee").html(goodsFee + payTypeFee - point - couponFee);
    }
}

// 选择收货地址
function selectAddress(self, id)
{
    $(self).siblings().removeClass("sel");
    $(self).addClass("sel");
    $("#input-address-id").val(id);
}

// 新增收货地址模块
function toggleNewAddress()
{
    $("#addressForm").toggleClass("hide");
}

// 提交收货地址
function submitAddress()
{
    var receiverName = $("#receiverName").val();
    
    //  var prov = $("#prov").val();
    //  var city = $("#city").val();
    //  var dist = $("#dist").val();
    //  var detail = $("#detailAdd").val();
    //  var postcode = $("#postcode").val();
      
      var mobile = $("#mobile").val();
      var receiverCarcode = $("#receiverCarcode").val();     //增加车牌 by zhangji
      var receiverCartype = $("#receiverCartype").val();     //车型
      
      if (undefined == receiverName || "" == receiverName)
      {
          alert("姓名不能为空！");
          $("#receiverName").focus();
          return;
      }
     /** 
      if (undefined == prov || "" == prov)
      {
          alert("省市不能为空");
          $("#prov").focus();
          return;
      }
      
      if (undefined == city || "" == city)
      {
          alert("省市不能为空");
          $("#city").focus();
          return;
      }
      
      if (undefined == detail || "" == detail)
      {
          alert("详细地址不能为空");
          $("#detailAdd").focus();
          return;
      }
      **/
      if (undefined == mobile || "" == mobile)
      {
          alert("手机号码不能为空！");
          $("#mobile").focus();
          return;
      }
      
      if(!(/^1[3|4|5|7|8][0-9]\d{8,8}$/.test(mobile))){ 
          alert("请填写正确的手机号！");
          $("#mobile").focus();
          return;
      }
      
      if (undefined == receiverCarcode || "" == receiverCarcode)
      {
          alert("请输入车牌号！如：云A1231");
          $("#receiverCarcode").focus();
          return;
      }
      if (undefined == receiverCartype || "" == receiverCartype)
      {
          alert("请输入车型！");
          $("#receiverCartype").focus();
          return;
      }
    
    $.ajax({
        type:"post",
        url:"/user/address/ajax/add",
        data:{
            "receiverName": receiverName, 
         //   "prov": prov,
         //   "city": city,
         //   "dist": dist,
         //   "detail": detail,
         //   "postcode": postcode,
            "mobile": mobile, 
            "receiverCarcode":receiverCarcode,     //新加车牌  by zhangji
            "receiverCartype":receiverCartype       //新加车型
        },
        
        success:function(res) {
            if (0 == res.code)
            {
                
                window.location.reload();
            }
            else
            {
                alert(res.message);
            }
        }
    });
}