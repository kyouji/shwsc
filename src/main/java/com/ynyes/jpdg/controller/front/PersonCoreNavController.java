package com.ynyes.jpdg.controller.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.jpdg.service.TdCommonService;

@Controller
@RequestMapping("/")
public class PersonCoreNavController {
	
	@Autowired
    private TdCommonService tdCommonService;

	@RequestMapping("/favourable")
	public String toFavourable(HttpServletRequest req,ModelMap map){
		tdCommonService.setCommon(map, req);
		
		return "/client/favourable";
	}
	
	@RequestMapping("/person_core")
	public String coreIndex(HttpServletRequest req,ModelMap map){
		
		tdCommonService.setCommon(map, req);
		
		String email = (String)req.getSession().getAttribute("email");
		System.out.println(email);
		if(null == email){
			return "redirect:/";
		}
		return "/client/person_core";
	}
	
	
}
