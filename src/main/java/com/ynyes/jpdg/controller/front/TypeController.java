package com.ynyes.jpdg.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.jpdg.entity.TdAdType;
import com.ynyes.jpdg.entity.TdArticleCategory;
import com.ynyes.jpdg.service.TdAdService;
import com.ynyes.jpdg.service.TdAdTypeService;
import com.ynyes.jpdg.service.TdArticleCategoryService;
import com.ynyes.jpdg.service.TdArticleService;
import com.ynyes.jpdg.service.TdCommonService;
import com.ynyes.jpdg.service.TdNaviBarItemService;

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
	
	
	@RequestMapping("/type/{typeName}")
	public String toOverseasMarket(@PathVariable String typeName, HttpServletRequest req,ModelMap map){
		
		tdCommonService.setCommon(map, req);
		
		if (null != typeName)
		{
		    if (typeName.equalsIgnoreCase("haitao")) // 海淘
		    {
		        map.addAttribute("haitao_index", 1);
		        
		        // 大图轮播广告
		        TdAdType adType = tdAdTypeService.findByTitle("海淘专区大图轮播");
		        
		        if (null != adType) {
		            map.addAttribute("big_scroll_ad_list", tdAdService
		                    .findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
		        }
		        
		       
		        tdCommonService.setArticleType(map, req);
		        
		       
		        
		        
		    }
		    else if (typeName.equalsIgnoreCase("guonei"))
		    {
		        
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
        
        
        
         
		
		return "/client/type";
	}
	
	@RequestMapping("/atricle/list")
	public String updateAtricle(Long id, HttpServletRequest req,ModelMap map){
		tdCommonService.setArticleType(map, req);
		
		List<TdArticleCategory>  articleCategoryLevel2List = 
				tdArticleCategoryService.findByParentId(id);
		map.addAttribute("articleCategoryLevel1nva", articleCategoryLevel2List);
		
		map.addAttribute("id",id);
		
		return "/client/article_update";
	}
	
}
