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
		}
	}
}
