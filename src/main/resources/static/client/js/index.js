// JavaScript Document
function myfocus(){document.getElementById("search").value=""}
function myblur(){document.getElementById("search").value="这里输入您想要的"}
window.onload=function(){
	var pname = document.getElementById('final_name');              // 声明变量。
    var sname = pname.innerHTML;
   
	   var ssname = sname.substr(0, 6); // 获取子字符串。
	   pname.innerHTML=ssname;               // 返回 "Spain"。
	   
	   var myul=document.getElementById("myul1");
	   var lis=myul.getElementsByTagName("li");
	   for(i=0;i<lis.length;i++){
		   if (lis[i].childNodes[0].className!=""){var yes=lis[i].childNodes[0];}
		   lis[i].childNodes[0].onmouseover=function(){
			   for(i=0;i<lis.length;i++){lis[i].childNodes[0].className="";}
			   this.className="myli";}
		   lis[i].childNodes[0].onmouseout=function(){
			   for(i=0;i<lis.length;i++){lis[i].childNodes[0].className="";}
			   yes.className="myli"}
   }
}
function join(){
	var jo=document.getElementById("join_raw");
	jo.style.display="block";}
function join_out(){
	var jo=document.getElementById("join_raw");
	jo.style.display="none";}
function login_div_in(){
	var jo=document.getElementById("login-div");
	jo.style.display="block";}
function login_div_out(){
	var jo=document.getElementById("login-div");
	jo.style.display="none";}

$(function(){
	$("#btn_login").click(function(){
        login();
	});	
});


 function login(){
 	var email = $("#email").val().trim();
	var password = $("#password").val().trim();
	$.ajax({
		type:"post",
    	url:"/login/validat",
    	data:{"email":email,"password":password},
    	dataType:"json",
    	success:function(data){
    		if(data.status == 0){
    			window.location.href="/";
    		}else{
    			alert(data.msg);
    		}
    	},
    });
 }
 



 //保存用户信息 
function saveUserInfo() { 
    if (document.getElementById("rmbUser").checked==true) { 
        var userName = $("#txt_loginId").val(); 
        var passWord = $("#txt_loginPwd").val(); 
        $.cookie("email", email, { expires: 30 }); // 存储一个带7天期限的 cookie 
        $.cookie("passWord", passWord, { expires: 30 }); // 存储一个带7天期限的 cookie 
    } 
    else { 
        $.cookie("email", '', { expires: -1 }); 
        $.cookie("passWord", '', { expires: -1 }); 
    } 
};
