package com.ynyes.shwsc.controller.front;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.shwsc.entity.TdUser;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdSettingService;
import com.ynyes.shwsc.service.TdUserPointService;
import com.ynyes.shwsc.service.TdUserService;
import com.ynyes.shwsc.util.VerifServlet;

/**
 * 注册处理
 * 
 */
@Controller
public class TdRegController {
    @Autowired
    private TdUserService tdUserService;
    
    @Autowired
    private TdUserPointService tdUserPointService;
    
    @Autowired
    private TdSettingService tdSettingService;
    
    @Autowired
    private TdCommonService tdCommonService;
    
  
    
    @RequestMapping(value = "/reg/check/{type}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> validateForm(@PathVariable String type, String param) {
        Map<String, String> res = new HashMap<String, String>();

        res.put("status", "n");
        
        
        if (null == type)
        {
        	res.put("info", "参数错误");
            return res;
        }
        
        if (type.equalsIgnoreCase("username"))
        {
        	if (null == param || param.isEmpty()) {
                res.put("info", "用户名不能为空");
                return res;
            }
        	
        	TdUser user = tdUserService.findByUsername(param);
        	
        	if (null != user)
        	{
        		res.put("info", "该用户已经存在");
                return res;
        	}
        }
        
        /**
         * 	ajax实时验证
         * 	手机号查找用户
         * 	判断手机号是已否注册
         * @author libiao
         */
        if (type.equalsIgnoreCase("mobile"))		
        {
        	if (null == param || param.isEmpty())
        	{
                res.put("info", "用户名不能为空");
                return res;
            }
        	
        	TdUser user = tdUserService.findByMobile(param);		
        	
        	if (null != user)	
         	{
        		res.put("info", "该手机已经注册");
                return res;
        	}
        }

        res.put("status", "y");

        return res;
    }
    
    @RequestMapping("/reg")
	public String regUser(HttpServletRequest req,ModelMap map){
    	tdCommonService.setCommon(map, req);
		return "/client/reg";
	}
    
    @RequestMapping(value="/reg",method=RequestMethod.POST)
    public String reg(TdUser user, String code,HttpServletRequest req, HttpSession session, ModelMap map) {
    	
    	tdCommonService.setCommon(map, req);
        
    	String codeBack = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
		
        if(!codeBack.equalsIgnoreCase(code)){
        	map.addAttribute("errCode", "验证码错误");
        	return "/client/reg";
        }
        user.setUsername(user.getEmail());
        
        tdUserService.save(user);
        
        session.setAttribute("email", user.getEmail());
        return "/client/person_core";
	    }
    
    @RequestMapping(value = "/user/reg",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveUser(HttpServletRequest request, 
								    		String username,
								    		String password,
								    		String password2,
								    		ModelMap map)
    {
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == username || username.equals(""))
        {
        	res.put("msg", "用户名不能为空！");
        	return res;
        }
        
        if (null == password || password.equals(""))
        {
        	res.put("msg", "密码不能为空！");
        	return res;
        }
        
        if (null == password2 || password2.equals("") || !password2.equals(password) )
        {
        	res.put("msg", "两次密码不一致！");
        	return res;
        }
        
        if (!isMobile(username))
        {
        	res.put("msg", "请输入正确的手机号！");
        	return res;
        }
        
        TdUser exist = tdUserService.findByUsername(username);
        if (null != exist)
        {
        	res.put("msg", "该手机已被注册！");
        	return res;
        }
        
    	TdUser user  =  new TdUser();
    	user.setUsername(username);
    	user.setPassword(password);
		user.setMobile(password);  //zhangji
		user.setStatusId(0L);
    	tdUserService.save(user);
    	
//    	Map<String, Object> res = new HashMap<String,Object>();
    	res.put("baocun", "成功"); 
    	map.addAttribute("user",user);
    	
        res.put("code", 0);
        return res;
    }

	   //验证手机号
    public static boolean isMobile(String str) {   
        Pattern p = null;  
        Matcher m = null;  
        boolean b = false;   
        p = Pattern.compile("^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$"); // 验证手机号  
        m = p.matcher(str);  
        b = m.matches();   
        return b;  
    }

	    
	    @RequestMapping(value="/logutil")
	    public String LogUtils(){
	        return "/logutil";
    }
    /**
     * 
     * 注册用户保存到数据库<BR>
     * 方法名：saveUser<BR>
     * 时间：2015年2月2日-下午1:44:45 <BR>
     * @param user
     * @param name
     * @param mobile
     * @param password
     * @param newpassword
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
//    @RequestMapping(value="/reg",method=RequestMethod.POST)
//    public String reg(String username,
//                String mobile,
//                String password,
//                String email,
//                String smsCode,
//                String code,
//                String carCode,
//                Long shareId,
//                HttpServletRequest request){
//        String codeBack = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
//        String smsCodeSave = (String) request.getSession().getAttribute("SMSCODE");
//        if (null == codeBack || null == smsCodeSave)
//        {
//            if (null == shareId)
//            {
//                return "redirect:/reg?name= "+username+"&carCode="+carCode;
//            }
//            else
//            {
//                return "redirect:/reg?shareId=" + shareId + "&name= "+username+"&carCode="+carCode;
//            }
//        }
//        
//        if (!codeBack.equalsIgnoreCase(code))
//        {
//            if (null == shareId)
//            {
//                return "redirect:/reg?errCode=1&name= "+username+"&carCode="+carCode;
//            }
//            else
//            {
//                return "redirect:/reg?errCode=1&shareId=" + shareId + "&name= "+username+"&carCode="+carCode;
//            }
//        }
//        
//        if (!smsCodeSave.equalsIgnoreCase(smsCode))
//        {
//            if (null == shareId)
//            {
//                return "redirect:/reg?errCode=4&name= "+username+"&mobile="+mobile;
//            }
//            else
//            {
//                return "redirect:/reg?errCode=4&shareId=" + shareId + "&name= "+username+"&carCode="+carCode;
//            }
//        }
//        
//        
//       TdUser user = tdUserService.addNewUser(username, password, mobile, email, carCode);
//        
//        if (null == user)
//        {
//            if (null == shareId)
//            {
//                return "redirect:/reg?errCode=3";
//            }
//            else
//            {
//                return "redirect:/reg?errCode=3&shareId=" + shareId;
//            }
//        }
//        
//        user = tdUserService.save(user);
//        
//        // 奖励分享用户
//        if (null != shareId)
//        {
//            TdUser sharedUser = tdUserService.findOne(shareId);
//            
//            if (null != sharedUser && sharedUser.getRoleId().equals(0L))
//            {
//                TdSetting setting = tdSettingService.findTopBy();
//                TdUserPoint userPoint = new TdUserPoint();
//                
//                if (null != setting)
//                {
//                    userPoint.setPoint(setting.getRegisterSharePoints());
//                }
//                else
//                {
//                    userPoint.setPoint(0L);
//                }
//                
//                if (null != sharedUser.getTotalPoints())
//                {
//                    userPoint.setTotalPoint(sharedUser.getTotalPoints() + userPoint.getPoint());
//                }
//                else
//                {
//                    userPoint.setTotalPoint(userPoint.getPoint());
//                }
//                
//                userPoint.setUsername(sharedUser.getUsername());
//                userPoint.setDetail("用户分享网站成功奖励");
//                
//                userPoint = tdUserPointService.save(userPoint);
//                
//                sharedUser.setTotalPoints(userPoint.getTotalPoint()); // 积分
//                tdUserService.save(sharedUser);
//            }
//        }
//        
//        request.getSession().setAttribute("username", username);
//        
//        String referer = (String) request.getAttribute("referer");
//        
//        if (null != request.getAttribute("referer"))
//        {
//            return "redirect:" + referer;
//        }
//        
//        if (null == shareId)
//        {
//            return "redirect:/user";
//        }
//        
//        return "redirect:/user?shareId=" + shareId;
//    }
    
    @RequestMapping(value = "/code",method = RequestMethod.GET)
    public void verify(HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        VerifServlet randomValidateCode = new VerifServlet();
        randomValidateCode.getRandcode(request, response);
//        QRCodeUtils qr = new QRCodeUtils();
//        qr.getQRCode("weixin://wxpay/bizpayurl?appid=wx2421b1c4370ec43b&mch_id=10000100&nonce_str=f6808210402125e30663234f94c87a8c&product_id=1&time_stamp=1415949957&sign=512F68131DD251DA4A45DA79CC7EFE9D", 125, response);
    }
    
    
}