package com.ynyes.shwsc.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.entity.TdArticleCategory;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdNaviBarItemService;
import com.ynyes.shwsc.util.ClientConstant;

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
    
    @RequestMapping
    public String index(HttpServletRequest req, Device device, ModelMap map) {
       
        tdCommonService.setCommon(map, req);
        
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页大图");

        if (null != adType) {
            map.addAttribute("big_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
     // 首页大图轮播广告
         adType = tdAdTypeService.findByTitle("首页大图2");

        if (null != adType) {
            map.addAttribute("big_scroll_ad_list2", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        // 首页大图轮播广告
        adType = tdAdTypeService.findByTitle("首页大图3");

       if (null != adType) {
           map.addAttribute("big_scroll_ad_list3", tdAdService
                   .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
       }
        
        // 首页中图
         adType = tdAdTypeService.findByTitle("首页中图");

        if (null != adType) {
            map.addAttribute("big_center_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
       

        // 首页下图
        adType = tdAdTypeService.findByTitle("首页下图");
        if (null != adType) {
            map.addAttribute("big_down_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
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
}
