package com.ynyes.shwsc.controller.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ynyes.shwsc.entity.TdArticleCategory;
import com.ynyes.shwsc.entity.TdKeywords;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdKeywordsService;
import com.ynyes.shwsc.service.TdProductCategoryService;
import com.ynyes.shwsc.util.ClientConstant;

/**
 * 商品检索
 * @author Sharon
 *
 */
@Controller
public class TdSearchController {
    
    @Autowired
    private TdCommonService tdCommonService;
    
    @Autowired
    private TdGoodsService tdGoodsService;
    
    @Autowired
    private TdKeywordsService tdKeywordsService;
    
    @Autowired
    private TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;
    
    @Autowired
    private TdArticleService tdArticleService;
    
    // 组成：[排序字段]-[销量排序标志]-[价格排序标志]-[上架时间排序标志]-[是否有货]-[页号]_[价格低值]-[价格高值]
    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String list(String keywords,  HttpServletRequest req, ModelMap map){
        
        tdCommonService.setCommon(map, req);
        
        if (null != keywords)
        {
            TdKeywords key = tdKeywordsService.findByTitle(keywords);
            
            if (null != key)
            {
                if (null == key.getTotalSearch())
                {
                    key.setTotalSearch(1L);
                }
                else
                {
                    key.setTotalSearch(key.getTotalSearch() + 1L);
                }
                
                key.setLastSearchTime(new Date());
                
                tdKeywordsService.save(key);
            }
            
            map.addAttribute("goods_list", tdGoodsService.searchGoods(keywords.trim()));
        }
        
        map.addAttribute("keywords", keywords);
        
        return "/client/search_list";
    }
}
