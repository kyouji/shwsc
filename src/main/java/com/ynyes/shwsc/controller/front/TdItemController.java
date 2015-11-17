package com.ynyes.shwsc.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdArticle;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdDiySiteService;
import com.ynyes.shwsc.service.TdGoodsCombinationService;
import com.ynyes.shwsc.service.TdProductCategoryService;
import com.ynyes.shwsc.service.TdProductService;
import com.ynyes.shwsc.service.TdSettingService;
import com.ynyes.shwsc.service.TdUserCollectService;
import com.ynyes.shwsc.service.TdUserCommentService;
import com.ynyes.shwsc.service.TdUserConsultService;
import com.ynyes.shwsc.service.TdUserPointService;
import com.ynyes.shwsc.service.TdUserRecentVisitService;
import com.ynyes.shwsc.service.TdUserService;
import com.ynyes.shwsc.util.ClientConstant;

/**
 * 商品详情页
 * 
 * @author Sharon
 *
 */
@Controller
public class TdItemController {
    @Autowired
    private TdArticleService tdArticleService;
    
    @Autowired
    private TdArticleCategoryService tdArticleCategoryService;

    @Autowired
    private TdUserConsultService tdUserConsultService;

    @Autowired
    private TdUserCommentService tdUserCommentService;

    @Autowired
    private TdUserCollectService tdUserCollectService;

    @Autowired
    private TdProductCategoryService tdProductCategoryService;

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdGoodsCombinationService tdGoodsCombinationService;

    @Autowired
    private TdUserRecentVisitService tdUserRecentVisitService;

    @Autowired
    private TdSettingService tdSettingService;

    @Autowired
    private TdUserService tdUserService;

    @Autowired
    private TdProductService tdProductService;

    @Autowired
    private TdUserPointService tdUserPointService;

    @Autowired
    private TdDiySiteService tdDiySiteService;

    @RequestMapping("/item/{itemId}")
    public String product(@PathVariable Long itemId, Long shareId,
            Integer qiang, ModelMap map, HttpServletRequest req) {

        tdCommonService.setCommon(map, req);
        
        if (null != itemId)
        {
            TdArticle article = tdArticleService.findOne(itemId);
            
            if (null != article)
            {
                map.addAttribute("article", article);
                map.addAttribute("category", tdArticleCategoryService.findOne(article.getCategoryId()));
            
                map.addAttribute("prev_article", 
                        tdArticleService.findPrevOne(article.getId(), article.getCategoryId(), 10L));
                map.addAttribute("next_article", 
                        tdArticleService.findNextOne(article.getId(), article.getCategoryId(), 10L));
            }
            
            map.addAttribute("article_love_page", 
                    tdArticleService.findByCategoryId(article.getCategoryId(), 0, ClientConstant.pageSize));
        
            // 评论
            map.addAttribute("comment_page", tdUserCommentService.findByGoodsIdAndIsShowable(article.getId(), 0, ClientConstant.pageSize));
        }

        return "/client/item";
    }

//    @RequestMapping("/goods/comment/{goodsId}")
//    public String comments(@PathVariable Long goodsId, Integer page,
//            Long stars, ModelMap map, HttpServletRequest req) {
//
//        if (null == goodsId) {
//            return "error_404";
//        }
//
//        if (null == page) {
//            page = 0;
//        }
//
//        if (null == stars) {
//            stars = 0L;
//        }
//
//        // 全部评论数
//        map.addAttribute("comment_count",
//                tdUserCommentService.countByGoodsIdAndIsShowable(goodsId));
//
//        // 好评数
//        map.addAttribute("three_star_comment_count", tdUserCommentService
//                .countByGoodsIdAndStarsAndIsShowable(goodsId, 3L));
//
//        // 中评数
//        map.addAttribute("two_star_comment_count", tdUserCommentService
//                .countByGoodsIdAndStarsAndIsShowable(goodsId, 2L));
//
//        // 差评数
//        map.addAttribute("one_star_comment_count", tdUserCommentService
//                .countByGoodsIdAndStarsAndIsShowable(goodsId, 1L));
//
//        if (stars.equals(0L)) {
//            map.addAttribute("comment_page", tdUserCommentService
//                    .findByGoodsIdAndIsShowable(goodsId, page,
//                            ClientConstant.pageSize));
//        } else {
//            map.addAttribute("comment_page", tdUserCommentService
//                    .findByGoodsIdAndStarsAndIsShowable(goodsId, stars, page,
//                            ClientConstant.pageSize));
//        }
//
//        // 评论
//        map.addAttribute("page", page);
//        map.addAttribute("stars", stars);
//        map.addAttribute("goodsId", goodsId);
//
//        return "/client/goods_comment";
//    }
//
//    @RequestMapping("/goods/consult/{goodsId}")
//    public String consults(@PathVariable Long goodsId, Integer page,
//            ModelMap map, HttpServletRequest req) {
//
//        if (null == goodsId) {
//            return "error_404";
//        }
//
//        if (null == page) {
//            page = 0;
//        }
//
//        Page<TdUserConsult> consultPage = tdUserConsultService
//                .findByGoodsIdAndIsShowable(goodsId, page,
//                        ClientConstant.pageSize);
//
//        // 咨询
//        map.addAttribute("consult_page", consultPage);
//        map.addAttribute("page", page);
//        map.addAttribute("goodsId", goodsId);
//
//        return "/client/goods_consult";
//    }
}
