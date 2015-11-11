// JavaScript Document
function myfocus(){document.getElementById("search").value=""}
function myblur(){document.getElementById("search").value="这里输入您想要的"}
window.onload=function(){
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
function join(){var jo=document.getElementById("join_raw");jo.style.visibility="visible";}
function join_out(){var jo=document.getElementById("join_raw");jo.style.visibility="hidden";}
function login_div_out(){var jo=document.getElementById("login-div");jo.style.visibility="hidden";}
function login_div_in(){var jo=document.getElementById("login-div");jo.style.visibility="visible";}
function get_article(page)
{
    
}