package com.ynyes.jpdg.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.jpdg.entity.TdAdType;
import com.ynyes.jpdg.service.TdAdService;
import com.ynyes.jpdg.service.TdAdTypeService;
import com.ynyes.jpdg.service.TdArticleService;
import com.ynyes.jpdg.service.TdCommonService;
import com.ynyes.jpdg.service.TdNaviBarItemService;
import com.ynyes.jpdg.util.ClientConstant;

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
    
    @RequestMapping
    public String index(
            HttpServletRequest req, Device device, ModelMap map) {
       
        tdCommonService.setCommon(map, req);
        
        map.addAttribute("navi_bar_item_list", tdNaviBarItemService.findByIsEnableTrueOrderBySortIdAsc());
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页大图轮播广告");

        if (null != adType) {
            map.addAttribute("big_scroll_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        adType = tdAdTypeService.findByTitle("首页轮播图片右侧小图广告");

        // 首页轮播图片右侧小图广告
        if (null != adType) {
            map.addAttribute("index_small_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
       
        // 首页推荐文章
        map.addAttribute("index_recommend_article_page", tdArticleService.findByIsRecommendIndexTrue(0, ClientConstant.pageSize));
        
        return "/client/index";
    }
    
    @RequestMapping(value="/article")
    public String articlePage(ModelMap map, Integer page)
    {
        if (null == page || page < 0)
        {
            page = 0;
        }
     
        // 首页推荐文章
        map.addAttribute("index_recommend_article_page", tdArticleService.findByIsRecommendIndexTrue(page, ClientConstant.pageSize));
        
        return "/client/index_article_page";
    }
}
