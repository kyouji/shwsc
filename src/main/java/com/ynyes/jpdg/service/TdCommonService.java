package com.ynyes.jpdg.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.ynyes.jpdg.entity.TdAdType;
import com.ynyes.jpdg.entity.TdArticleCategory;
import com.ynyes.jpdg.entity.TdDemand;
import com.ynyes.jpdg.entity.TdProductCategory;
import com.ynyes.jpdg.entity.TdSetting;
import com.ynyes.jpdg.entity.TdSiteLink;

@Service
public class TdCommonService {

    @Autowired
    private TdSettingService tdSettingService;

    @Autowired
    private TdKeywordsService tdKeywordsService;

    @Autowired
    private TdCartGoodsService tdCartGoodsService;

    @Autowired
    private TdNaviBarItemService tdNaviBarItemService;

    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;

    @Autowired
    private TdArticleService tdArticleService;

    @Autowired
    private TdProductCategoryService tdProductCategoryService;

    @Autowired
    private TdSiteLinkService tdSiteLinkService;

    @Autowired
    private TdUserService tdUserService;
    
    @Autowired
    private TdServiceItemService tdServiceItemService;
    
    @Autowired
    private TdAdTypeService tdAdTypeService;
    
    @Autowired
    private TdAdService tdAdService;
    
    //团购 zhangji
    @Autowired
    private TdDemandService tdDemandService;

    public void setCommon(ModelMap map, HttpServletRequest req) {
        // 网站基本信息
        TdSetting setting = tdSettingService.findTopBy();
        map.addAttribute("setting", setting);
        
        // 友情链接
        List<TdSiteLink> sitelLinks = tdSiteLinkService.findByIsEnableTrue();
        map.addAttribute("site_link_list",sitelLinks);
        
        // 底部内容分类
        map.addAttribute("article_category_list", tdArticleCategoryService.findByMenuId(8L));
        
        // 登录信息
        String username = (String) req.getSession().getAttribute("username");
        map.addAttribute("username", username);
    }

}
