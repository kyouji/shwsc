package com.ynyes.shwsc.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.entity.TdArticleCategory;
import com.ynyes.shwsc.entity.TdNavigationMenu;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdNaviBarItemService;
import com.ynyes.shwsc.util.ClientConstant;

@Controller
@RequestMapping("/")
public class TypeController {
	
	@Autowired
	private TdNaviBarItemService tdNaviBarItemService;
	
	@Autowired
	private TdCommonService tdCommonService;
	
	@Autowired
	private TdAdService tdAdService;
	
	@Autowired
	private TdAdTypeService tdAdTypeService;
	
	@Autowired
	private TdArticleCategoryService tdArticleCategoryService;
	
	@Autowired
	private TdArticleService tdArticleService;
	
	//套餐详情
	   @RequestMapping("/tcxq")
	    public String tcxq(HttpServletRequest req, Device device, ModelMap map) {
	       
	        tdCommonService.setCommon(map, req);
	        
	        
	        // 首页顶部轮播
	        TdAdType adType = tdAdTypeService.findByTitle("首页顶部轮播");
	        if (adType != null)
	        {
				map.addAttribute("ht_scroll_ad_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
			}
	        
	      
	        
	        return "/client/tcxq";
	    }
	

	   //无肉不欢
	   @RequestMapping("/wrbh")
	    public String wrbh(HttpServletRequest req, Device device, ModelMap map) {
	       
	        tdCommonService.setCommon(map, req);
	        map.addAttribute("wrbh_recommend_article_page", tdArticleService.findByIsRecommendIndexTrue(0, ClientConstant.pageSize));
	        
	      
	        
	        return "/client/wrbh";
	    }

}
		
	

	
	/*@RequestMapping("/type/{typeName}")
	public String toOverseasMarket(@PathVariable String typeName, HttpServletRequest req,ModelMap map){
		
		tdCommonService.setCommon(map, req);
		
		if (null != typeName)
		{
		    if (typeName.equalsIgnoreCase("haitao")) // 海淘
		    {
		        map.addAttribute("type_index", 1);
		        
		        // 大图轮播广告
		        TdAdType adType = tdAdTypeService.findByTitle("海淘专区大图轮播广告");
		        
		        if (null != adType) {
		            map.addAttribute("ht_scroll_ad_list", tdAdService
		                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
		        }
		        
		        // 读取海淘专区所有一级、二级分类
		        TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("海淘专区");
		        
		        if (null != haitaoCat)
		        {
		            // 查找一级分类
		            List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
	                
		            if (null != level0CatList)
		            {
		                map.addAttribute("level0_category_list", level0CatList);
		                
		                // 查找二级分类
		                for (int i = 0; i < level0CatList.size(); i++)
		                {
		                    TdArticleCategory cat = level0CatList.get(i);
		                    
		                    map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
		                }
		            }
		        }
		        
		        adType = tdAdTypeService.findByTitle("海淘专区页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
		        map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
		        
		         adType = tdAdTypeService.findByTitle("右下侧面广告");
		         if (null != adType) {
			            map.addAttribute("ht_rigit_ad_list", tdAdService
			                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
			        }
		         
		    }
		    else if (typeName.equalsIgnoreCase("guonei")) // 国内
		    {
		        map.addAttribute("type_index", 2);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("国内优惠大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("国内优惠");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("国内优惠页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
		    }
		    else if (typeName.equalsIgnoreCase("repin")) // 热品推荐
            {
                map.addAttribute("type_index", 3);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("热品推荐大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("热品推荐");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("热品推荐页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }
		    else if (typeName.equalsIgnoreCase("yc")) // 原创
            {
                map.addAttribute("type_index", 4);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("原创大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("原创");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("原创页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }
		    else if (typeName.equalsIgnoreCase("bk")) // 百科
            {
                map.addAttribute("type_index", 5);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("百科大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("百科");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("百科页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }else if (typeName.equalsIgnoreCase("zx")) // 资讯
            {
                map.addAttribute("type_index", 6);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("资讯大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("资讯");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("资讯页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }
            else if (typeName.equalsIgnoreCase("bl")) // 爆料
            {
                map.addAttribute("type_index", 7);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("爆料大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("爆料");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("爆料页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }
            else if (typeName.equalsIgnoreCase("zc")) // 众测
            {
                map.addAttribute("type_index", 8);
                
                // 大图轮播广告
                TdAdType adType = tdAdTypeService.findByTitle("众测大图轮播广告");
                
                if (null != adType) {
                    map.addAttribute("ht_scroll_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                // 读取海淘专区所有一级、二级分类
                TdArticleCategory haitaoCat = tdArticleCategoryService.findByTitle("众测");
                
                if (null != haitaoCat)
                {
                    // 查找一级分类
                    List<TdArticleCategory> level0CatList = tdArticleCategoryService.findByParentId(haitaoCat.getId());
                    
                    if (null != level0CatList)
                    {
                        map.addAttribute("level0_category_list", level0CatList);
                        
                        // 查找二级分类
                        for (int i = 0; i < level0CatList.size(); i++)
                        {
                            TdArticleCategory cat = level0CatList.get(i);
                            
                            map.addAttribute("level1_" + i + "_category_list", tdArticleCategoryService.findByParentId(cat.getId()));
                        }
                    }
                }
                
                adType = tdAdTypeService.findByTitle("众测页面中部横幅广告");
                
                if (null != adType) {
                    map.addAttribute("ht_flat_ad_list", tdAdService
                            .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
                }
                
                map.addAttribute("type_article_page", tdArticleService.findByCategoryId(haitaoCat.getId(), 0, ClientConstant.pageSize));
                
            }
		}
		
//        
//        //海淘专区中间分类
//        TdArticleCategory articleCategory = tdArticleCategoryService.findByTitle("海淘专区");
//        if(null != articleCategory){
//        	List<TdArticleCategory> articleCategoryList =tdArticleCategoryService.findByParentId(articleCategory.getId());
//        	map.addAttribute("article_categorys_list", articleCategoryList);
//        	if(articleCategoryList.size() > 0){
//        		List<TdArticleCategory> articleCategorySubList =tdArticleCategoryService.findByParentId(articleCategoryList.get(0).getId());
//        		map.addAttribute("article_category_sub_list", articleCategorySubList);
//        		//海淘专区左边文章列表
//        		articleCategory = articleCategorySubList.get(0);
////        		map.addAttribute("articleList", tdArticleService.findByMenuIdAndCategoryIdAndIsEnableOrderByIdDesc(menuId, catId, page, size).)
//        	}
//        }
//        
        
        
        
         
		
		return "/client/tcxq";
	}
	
//	@RequestMapping("/atricle/list")
//	public String updateAtricle(Long id, HttpServletRequest req,ModelMap map){
//		tdCommonService.setArticleType(map, req);
//		
//		List<TdArticleCategory>  articleCategoryLevel2List = 
//				tdArticleCategoryService.findByParentId(id);
//		map.addAttribute("articleCategoryLevel1nva", articleCategoryLevel2List);
//		
//		map.addAttribute("id",id);
//		
//		return "/client/article_update";
//	}
	
}*/

