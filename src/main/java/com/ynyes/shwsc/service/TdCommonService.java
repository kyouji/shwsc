package com.ynyes.shwsc.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.entity.TdArticleCategory;
import com.ynyes.shwsc.entity.TdDemand;
import com.ynyes.shwsc.entity.TdProductCategory;
import com.ynyes.shwsc.entity.TdSetting;
import com.ynyes.shwsc.entity.TdSiteLink;

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
        String username = (String) req.getSession().getAttribute("email");
        map.addAttribute("email", username);
        
        map.addAttribute("navi_bar_item_list", tdNaviBarItemService.findByIsEnableTrueOrderBySortIdAsc());
    }

    public void setArticleType(ModelMap map, HttpServletRequest req){
    	
    	 TdAdType adType = tdAdTypeService.findByTitle("海淘专区中间小广告");
	        
	        if(null != adType){
	        	 map.addAttribute("among_ad", tdAdService
		                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
	        }
    	 // 海淘专区分类
        TdArticleCategory articleCategory = tdArticleCategoryService.findByTitle("海淘专区");
        if(null != articleCategory){
        	//海淘专区一级分类
        	List<TdArticleCategory> articleCategoryLevel1List =tdArticleCategoryService.findByParentId(articleCategory.getId());
        	
        	map.addAttribute("articleCategory_Leve1_nav", articleCategoryLevel1List);
        	map.addAttribute("articleCategory_Leve1_nav_index", 0);
        	if (null != articleCategoryLevel1List && articleCategoryLevel1List.size() > 0)
        	{
        	    map.addAttribute("articleCategoryLevel1nva", 
					tdArticleCategoryService.findByParentId(articleCategoryLevel1List.get(0).getId()));
        	}
        	
        }
        
    	
    }
    public void setHeader(ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        // 用户名，购物车
        if (null != username) {
            map.addAttribute("username", username);
            map.addAttribute("user",
                    tdUserService.findByUsernameAndIsEnabled(username));
            map.addAttribute("cart_goods_list",
                    tdCartGoodsService.updateGoodsInfo(tdCartGoodsService.findByUsername(username)));
        } else {
            map.addAttribute("cart_goods_list",
                    tdCartGoodsService.updateGoodsInfo(tdCartGoodsService.findByUsername(req.getSession().getId())));
        }
        
        // 顶部小图广告
        TdAdType adType = tdAdTypeService.findByTitle("搜索框左侧小图广告");
        if (null != adType) {
            map.addAttribute("top_small_ad_list", tdAdService
                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
        // 网站基本信息
        TdSetting setting = tdSettingService.findTopBy();
        
        // 统计访问量
        if (null != setting && null == req.getSession().getAttribute("countedTotalVisits"))
        {
            req.getSession().setAttribute("countedTotalVisits", "yes");
            if (null == setting.getTotalVisits())
            {
                setting.setTotalVisits(1L);
            }
            else
            {
                setting.setTotalVisits(setting.getTotalVisits() + 1L);
            }
            setting = tdSettingService.save(setting);
        }
        
        // 统计在线人数
        if (null != setting && null == req.getSession().getAttribute("countedTotalOnlines"))
        {
            req.getSession().setAttribute("countedTotalOnlines", "yes");
            if (null == setting.getTotalOnlines())
            {
                setting.setTotalOnlines(1L);
            }
            else
            {
                setting.setTotalOnlines(setting.getTotalOnlines() + 1L);
            }
            setting = tdSettingService.save(setting);
        }

        map.addAttribute("site", setting);
        map.addAttribute("keywords_list",
                tdKeywordsService.findByIsEnableTrueOrderBySortIdAsc());

        // 全部商品分类，取三级
        List<TdProductCategory> topCatList = tdProductCategoryService
                .findByParentIdIsNullOrderBySortIdAsc();
        map.addAttribute("top_cat_list", topCatList);

        if (null != topCatList && topCatList.size() > 0) 
        {
            for (int i = 0; i < topCatList.size(); i++) 
            {
                TdProductCategory topCat = topCatList.get(i);
                List<TdProductCategory> secondLevelList = tdProductCategoryService
                        .findByParentIdOrderBySortIdAsc(topCat.getId());
                map.addAttribute("second_level_" + i + "_cat_list", secondLevelList);

                if (null != secondLevelList && secondLevelList.size() > 0) 
                {
                    for (int j=0; j<secondLevelList.size(); j++)
                    {
                        TdProductCategory secondLevelCat = secondLevelList.get(j);
                        List<TdProductCategory> thirdLevelList = tdProductCategoryService
                                .findByParentIdOrderBySortIdAsc(secondLevelCat.getId());
                        map.addAttribute("third_level_" + i + j + "_cat_list", thirdLevelList);
                    }
                }
            }
        }

        // 导航菜单
        map.addAttribute("navi_item_list",
                tdNaviBarItemService.findByIsEnableTrueOrderBySortIdAsc());
        
        // 商城服务
        map.addAttribute("service_item_list", tdServiceItemService.findByIsEnableTrueOrderBySortIdAsc());

        // 帮助中心
        Long helpId = 12L;

        map.addAttribute("help_id", helpId);

        List<TdArticleCategory> level0HelpList = tdArticleCategoryService
                .findByMenuIdAndParentId(helpId, 0L);

        map.addAttribute("help_level0_cat_list", level0HelpList);

        if (null != level0HelpList) {

            for (int i = 0; i < level0HelpList.size() && i < 4; i++) {
                TdArticleCategory articleCat = level0HelpList.get(i);
                map.addAttribute("help_" + i + "_cat_list",
                        tdArticleCategoryService.findByMenuIdAndParentId(
                                helpId, articleCat.getId()));
            }
        }

        // 友情链接
        map.addAttribute("site_link_list",
                tdSiteLinkService.findByIsEnableTrue());
        
        //团购留言     
        List<TdDemand> tdDemand = tdDemandService.findByStatusIdAndIsShowable();
        map.addAttribute("demand_list",tdDemand);
        
    }
}
