package com.ynyes.jpdg.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.jpdg.entity.TdAdType;
import com.ynyes.jpdg.entity.TdArticleCategory;
import com.ynyes.jpdg.service.TdAdService;
import com.ynyes.jpdg.service.TdAdTypeService;
import com.ynyes.jpdg.service.TdArticleCategoryService;
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
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;
    
    @RequestMapping
    public String index(
            HttpServletRequest req, Device device, ModelMap map) {
       
        tdCommonService.setCommon(map, req);
        
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页大图轮播");

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
        
        //主页右侧大图广告
        adType = tdAdTypeService.findByTitle("主页右侧大图广告");
        
        if(null != adType){
        	map.addAttribute("index_reght_ad_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        // 首页推荐文章
        map.addAttribute("index_recommend_article_page", tdArticleService.findByIsRecommendIndexTrue(0, ClientConstant.pageSize));
        
        //热品推荐文章
        TdArticleCategory tdArticlecategory = tdArticleCategoryService.findByTitle("热品推荐");
        if(null != tdArticlecategory){
        	map.addAttribute("index_hot_article_list", tdArticleService.findByCategoryId(tdArticlecategory.getId()));
        }
        
        //国内优惠
        tdArticlecategory = tdArticleCategoryService.findByTitle("国内优惠");
        if(null != tdArticlecategory){
        	map.addAttribute("index_pre_article_list", tdArticleService.findByCategoryId(tdArticlecategory.getId()));
        }
        
        
        
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
