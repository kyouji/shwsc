package com.ynyes.shwsc.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdNaviBarItemService;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/")
public class TdIndexController {

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdNaviBarItemService tdNaviBarItemService;
    
    @Autowired
    private TdAdService tdAdService;
    
    @Autowired
    private TdAdTypeService tdAdTypeService;

    @Autowired
    private TdArticleService tdArticleService;
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;
    
    @RequestMapping("/launch")
    public String Launch()
    {
    	return "/client/Launch";
    }
    
    @RequestMapping()
    public String index(HttpServletRequest req, Device device, ModelMap map) {
       
        tdCommonService.setCommon(map, req);
        
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页顶部轮播");
        if (adType != null)
        {
			map.addAttribute("top_ad_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
		}
        
        // 首页中图
         adType = tdAdTypeService.findByTitle("首页展示");

        if (null != adType) {
            map.addAttribute("content_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        return "/client/index";
    }
    
    /**
     * 城市选择
     * @author mdj
     * @param req
     * @param map
     * @return
     */
    @RequestMapping("/citys")
    public String chooseCity(HttpServletRequest req,ModelMap map)
    {
    	return "client/cities";
    }
    
   //个人中心
    @RequestMapping("/center")
    public String center(HttpServletRequest req,ModelMap map)
    {
    	return "client/center";
    }
    //头像编辑
    @RequestMapping("/head_portrait")
    public String head_portrait(HttpServletRequest req,ModelMap map)
    {
    	return "client/head_portrait";
    }
    
    //基本信息
    @RequestMapping("/message")
    public String message(HttpServletRequest req,ModelMap map)
    {
    	return "client/message";
    }
    
    
    //基本信息编辑
    @RequestMapping("/message_portrait")
    public String message_portrait(HttpServletRequest req,ModelMap map)
    {
    	return "client/message_portrait";
    }
    /**
     * 搜索
     * @param req 
     * @param map
     * @return
     */
    @RequestMapping("/search")
    public String search(String keyword, HttpServletRequest req,ModelMap map)
    {
    	return "client/search";
    }
}
