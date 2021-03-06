package com.ynyes.shwsc.controller.management;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.shwsc.entity.TdArticle;
import com.ynyes.shwsc.entity.TdArticleCategory;
import com.ynyes.shwsc.entity.TdGoods;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdBrandService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdManagerLogService;
import com.ynyes.shwsc.service.TdParameterCategoryService;
import com.ynyes.shwsc.service.TdParameterService;
import com.ynyes.shwsc.service.TdProductCategoryService;
import com.ynyes.shwsc.service.TdProductService;
import com.ynyes.shwsc.service.TdWarehouseService;
import com.ynyes.shwsc.util.SiteMagConstant;

/**
 * 后台首页控制器
 * 
 * @author Sharon
 */

@Controller
@RequestMapping(value="/Verwalter")
public class TdManagerEditController {
    
    @Autowired
    TdArticleCategoryService tdArticleCategoryService;
    
    @Autowired
    TdArticleService tdArticleService;
    
    @Autowired
    TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    TdGoodsService tdGoodsService;
    
    @Autowired
    TdWarehouseService tdWarehouseService;
    
    @Autowired
    TdManagerLogService tdManagerLogService;
    
    @Autowired
    TdParameterCategoryService tdParameterCategoryService;
    
    @Autowired
    TdParameterService tdParameterService;
    
    @Autowired
    TdProductService tdProductService;
    
    @Autowired
    TdBrandService tdBrandService;
    
    @RequestMapping(value="/category/edit")
    public String categoryEditDialog(Long cid, Long mid, Long id, Long sub, 
                                    String __EVENTTARGET,
                                    String __EVENTARGUMENT,
                                    String __VIEWSTATE,
                                    ModelMap map,
                                    HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }

        map.addAttribute("cid", cid);
        map.addAttribute("mid", mid);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
//        if (null != cid && cid.equals(2L)) // 商品分类
//        {
//            map.addAttribute("category_list", tdProductCategoryService.findAll());
//            
//            // 参数类型表
//            map.addAttribute("param_category_list", tdParameterCategoryService.findAll());
//            
//            if (null != sub) // 添加子类
//            {
//                if (null != id)
//                {
//                    map.addAttribute("fatherCat", tdProductCategoryService.findOne(id));
//                }
//            }
//            else
//            {
//                if (null != id)
//                {
//                    map.addAttribute("cat", tdProductCategoryService.findOne(id));
//                }
//            }
//            
//            return "/site_mag/product_category_edit";
//        }
//        else
        {
            if (null != mid)
            {
                map.addAttribute("category_list", tdArticleCategoryService.findByMenuId(mid));
            }
            
            if (null != id)
            {
                if (null != sub) // 添加子类
                {
                    map.addAttribute("fatherCat", tdArticleCategoryService.findOne(id));
                }
                else
                {
                    map.addAttribute("cat", tdArticleCategoryService.findOne(id));
                }
            }
            
            return "/site_mag/article_category_edit";
        }
    }
    
    @RequestMapping(value="/category/save", method = RequestMethod.POST)
    public String save(TdArticleCategory cat, 
                        String __EVENTTARGET,
                        String __EVENTARGUMENT,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        if (null == cat.getId())
        {
            tdManagerLogService.addLog("add", "用户修改文章分类", req);
        }
        else
        {
            tdManagerLogService.addLog("edit", "用户修改文章分类", req);
        }
        
        tdArticleCategoryService.save(cat);
        
        return "redirect:/Verwalter/category/list?cid=" + cat.getChannelId() 
                + "&mid=" + cat.getMenuId()
                + "&__EVENTTARGET=" + __EVENTTARGET
                + "&__EVENTARGUMENT=" + __EVENTARGUMENT
                + "&__VIEWSTATE=" + __VIEWSTATE;
    }
    
    @RequestMapping(value="/article/edit")
    public String articleEditDialog(Long cid, Long mid, Long pid, Long id, 
            String __EVENTTARGET,
            String __EVENTARGUMENT,
            String __VIEWSTATE,
            ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        if (null != id)
        {
            map.addAttribute("article", tdArticleService.findOne(id));
        }
        
        map.addAttribute("cid", cid);
        map.addAttribute("mid", mid);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != mid)
        {
            map.addAttribute("category_list", tdArticleCategoryService.findByMenuId(mid));
        }
        
//        if (null != cid)
//        {
//            if (cid.equals(5L)) // 产品
//            {
//                map.addAttribute("category_list", tdProductCategoryService.findAll());
//                return "/site_mag/product_edit";
//            }
//            else if (cid.equals(2L)) // 商品
//            {
//                map.addAttribute("category_list", tdProductCategoryService.findAll());
//                
//                if (null != id)
//                {
//                    TdGoods tdGoods = tdGoodsService.findOne(id);
//                    
//                    if (null != tdGoods)
//                    {
//                        // 参数列表
//                        TdProductCategory tpc = tdProductCategoryService.findOne(tdGoods.getCategoryId());
//                        
//                        if (null != tpc && null != tpc.getParamCategoryId())
//                        {
//                            map.addAttribute("param_list", tdParameterService.findByCategoryTreeContaining(tpc.getParamCategoryId()));
//                        }
//                        
//                        // 查找产品列表
//                        map.addAttribute("product_list", tdProductService.findByProductCategoryTreeContaining(tdGoods.getCategoryId()));
//                    
//                        // 查找品牌
//                        map.addAttribute("brand_list", tdBrandService.findByProductCategoryTreeContaining(tdGoods.getCategoryId()));
//                        
//                        map.addAttribute("warehouse_list", tdWarehouseService.findAll());
//                        
//                        if (null != tdGoods.getProductId())
//                        {
//                            map.addAttribute("product", tdProductService.findOne(tdGoods.getProductId()));
//                        }
//                        
//                        map.addAttribute("goods", tdGoods);
//                    }
//                }
//                
//                return "/site_mag/goods_edit";
//            }
//        }
        
        return "/site_mag/article_content_edit";
    }
    
    @RequestMapping(value="/article/save", method = RequestMethod.POST)
    public String save(TdArticle article, 
            String __EVENTTARGET,
            String __EVENTARGUMENT,
            String __VIEWSTATE,
            ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        String logType = null;
        if (null == article.getId())
        {
            logType = "add";
        }
        else
        {
            logType = "edit";
        }
        tdArticleService.save(article);
        
        tdManagerLogService.addLog(logType, "用户修改文章", req);
        
        return "redirect:/Verwalter/content/list?cid=" + article.getChannelId() 
                + "&mid=" + article.getMenuId()
                + "&__EVENTTARGET=" + __EVENTTARGET
                + "&__EVENTARGUMENT=" + __EVENTARGUMENT
                + "&__VIEWSTATE=" + __VIEWSTATE;
    }
    
    @RequestMapping(value = "/article/dialog/list")
    public String goodsListDialog(String keywords,
            Long categoryId, Integer page, Integer size, Integer total,
            String __EVENTTARGET, String __EVENTARGUMENT, String __VIEWSTATE,
            ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET) {
            if (__EVENTTARGET.equalsIgnoreCase("btnPage")) {
                if (null != __EVENTARGUMENT) {
                    page = Integer.parseInt(__EVENTARGUMENT);
                }
            } else if (__EVENTTARGET.equalsIgnoreCase("btnSearch")) {

            } else if (__EVENTTARGET.equalsIgnoreCase("categoryId")) {

            }
        }

        if (null == page || page < 0) {
            page = 0;
        }

        if (null == size || size <= 0) {
            size = SiteMagConstant.pageSize;
            ;
        }

        if (null != keywords) {
            keywords = keywords.trim();
        }

        Page<TdArticle> articlePage = null;

        if (null == categoryId) {
            if (null == keywords || "".equalsIgnoreCase(keywords)) {
                articlePage = tdArticleService.findAllOrderBySortIdAsc(page, size);
            } else {
                articlePage = tdArticleService.searchAndOrderBySortIdAsc(keywords,
                        page, size);
            }
        } else {
            if (null == keywords || "".equalsIgnoreCase(keywords)) {
                articlePage = tdArticleService
                        .findByCategoryIdOrderBySortIdAsc(categoryId, page, size);
            } else {
                articlePage = tdArticleService
                        .searchAndFindByCategoryIdOrderBySortIdAsc(keywords,
                                categoryId, page, size);
            }
        }

        map.addAttribute("article_page", articlePage);

        // 参数注回
        map.addAttribute("category_list", tdProductCategoryService.findAll());
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("total", total);
        map.addAttribute("keywords", keywords);
        map.addAttribute("categoryId", categoryId);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);

        return "/site_mag/dialog_article_list";
    }
    
}
