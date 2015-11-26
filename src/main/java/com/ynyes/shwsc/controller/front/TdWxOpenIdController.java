package com.ynyes.shwsc.controller.front;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdUser;
import com.ynyes.shwsc.service.TdUserService;

import net.sf.json.JSONObject;

@Controller
public class TdWxOpenIdController 
{
	@Autowired
	private TdUserService tdUserService;
	
	@RequestMapping("/WxOpenid")
	public void getReturn(HttpServletRequest req,String code,ModelMap map)
	{
		if (code != null)
    	{
    		System.out.println("Madejing: code = " + code);
    		
			String accessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx3f115843c9134e55&secret=323cf39a046d0eb9ea16ffd516c0d719&code=" + code + "&grant_type=authorization_code";
			
			System.out.println("Madejing: accessTokenUrl = " + accessTokenUrl);
			
			String result = com.ynyes.shwsc.util.HttpRequest.sendGet(accessTokenUrl, null);
			
			System.out.println("madjeing: result =" + result);
			
		    String openid =	JSONObject.fromObject(result).getString("openid");
		    System.out.println("Madejing: openid = " + openid);
		    String accessToken = JSONObject.fromObject(result).getString("access_token");
		    System.out.println("Madejing: access_token = " + accessToken);
			req.getSession().setAttribute("openid", openid);
			
			String userInfoUrl  = "https://api.weixin.qq.com/sns/userinfo?access_token=" + accessToken + "&openid=" + openid + "&lang=zh_CN";
			
			String userInfoResult = com.ynyes.shwsc.util.HttpRequest.sendGet(userInfoUrl, null);
			System.out.println("Madejing: userInfoResult:" + userInfoResult);
			String headUrlStr = JSONObject.fromObject(userInfoResult).getString("headimgurl");
			System.out.println("Madejing: headimgurl = " + headUrlStr);
			String nickname = JSONObject.fromObject(userInfoResult).getString("nickname");
			System.out.println("Madejing: nickname = " + nickname);
			map.addAttribute("nickname", nickname);
			TdUser user = tdUserService.findByUsername(openid);
			if (user == null)
			{
				user = new TdUser();
				user.setNickname(nickname);
				user.setHeadImageUri(headUrlStr);
				user.setUsername(openid);
				user.setRoleId(0L);
				user.setStatusId(1L);
				user.setPassword("123123");
			}
			user.setLastLoginTime(new Date());
			tdUserService.save(user);
			req.getSession().setAttribute("openid", user.getUsername());
			req.getSession().setAttribute("username", user.getUsername());
		}
	}
}
