package com.ynyes.shwsc.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.entity.TdArticle;
import com.ynyes.shwsc.entity.TdShippingAddress;
import com.ynyes.shwsc.entity.TdUser;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdArticleCategoryService;
import com.ynyes.shwsc.service.TdArticleService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdKeywordsService;
import com.ynyes.shwsc.service.TdNaviBarItemService;
import com.ynyes.shwsc.service.TdShippingAddressService;
import com.ynyes.shwsc.service.TdUserCollectService;
import com.ynyes.shwsc.service.TdUserService;
import com.ynyes.shwsc.util.ClientConstant;

/**
 * 前端首页控制
 *
 */
@Controller
@RequestMapping("/")
public class TdIndexController {
	@Autowired
    private TdUserService tdUserService;

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
    
    @Autowired
    private TdUserCollectService tdUserCollectService;
    
    @Autowired
    private TdShippingAddressService tdShippingAddressService;
    
    @Autowired
    private TdGoodsService tdGoodsService;
    
    @Autowired
    private TdKeywordsService tdKeywordsService;
    
    @RequestMapping("/launch")
    public String Launch()
    {
    	return "/client/Launch";
    }
    
    @RequestMapping()
    public String index(HttpServletRequest req, Device device, ModelMap map) {
       
        tdCommonService.setCommon(map, req);
        
        
        // 首页大图轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("首页顶部轮播");
        if (null!=adType)
        {
			map.addAttribute("top_ad_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
		}
        
        // 首页中图
         adType = tdAdTypeService.findByTitle("首页展示");

        if (null != adType) {
            map.addAttribute("content_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
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
    
    //用餐信息编辑submit_userinformation
    
    @RequestMapping("/submit_userinformation")
    public String submit_userinformation(HttpServletRequest req,ModelMap map)
    {
    	return "client/submit_userinformation";
    }
    
    @RequestMapping("/citys")
    public String chooseCity(HttpServletRequest req,ModelMap map)
    {
    	return "client/cities";
    }
    //搜索页
    @RequestMapping("/ssy")
    public String ssy(HttpServletRequest req,ModelMap map)
    {
    	map.addAttribute("keywords_list",
    			tdKeywordsService.findByIsEnableTrueOrderBySortIdAsc());
    	return "client/ssy";
    }
    
    /**
     * @author libiao
     * 
     */
    //我的收藏
    @RequestMapping("/wdsc")
    public String wdsc(HttpServletRequest req,Integer page, ModelMap map)
    {
    	String username =(String)req.getSession().getAttribute("username");
    	if(null == username)
    	{
    		return "redirect:/login";
    	}
    	
    	tdCommonService.setHeader(map, req);
    	// 菜单收藏
    	map.addAttribute("collect_goods_list", 
    				tdUserCollectService.findByUsernameAndType(username, 1L));
    	// 厨师收藏
    	map.addAttribute("collect_cook_list", 
    				tdUserCollectService.findByUsernameAndType(username, 2L));
    	return "client/wdsc";
    }
    
    //购物车
    @RequestMapping("/gwc")
    public String gwc(HttpServletRequest req,ModelMap map)
    {
    	return "client/gwc";
    }
    
    //签名编辑
    @RequestMapping("/qmbj")
    public String qmbj(HttpServletRequest req,TdUser user)
    {
    	String username=(String)req.getSession().getAttribute("username");
    	
    	
		//TdUser curentUser =tdUserService.findByUsername(username);
    	
    	if(username==null){
    		
    		return "redirect:/login";
    	}
    	
    	return "client/qmbj";
    }
    

    //头像编辑
    @RequestMapping("/head_portrait")
    public String head_portrait(HttpServletRequest req,ModelMap map)
    	
    {
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){
    		
    		return "redirect:/login";
    	}
	TdUser curentUser = tdUserService.findByUsername(username);
	
		
		map.addAttribute("user", curentUser);
    	return "client/head_portrait";
    }
    
    //基本信息
    @RequestMapping("/message")
    public String message(HttpServletRequest req,ModelMap map)
    {
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){
    		return "redirect:/login";
    	}
    	
    	TdUser curentUser = tdUserService.findByUsername(username);
		map.addAttribute("user", curentUser);
		return "client/message";
    	
    }
    
    
    //基本信息编辑
    @RequestMapping("/message_portrait")
    public String message_portrait(HttpServletRequest req,ModelMap map)
    {
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null)
    	{
    		return "redirect:/login";
    	}
    	map.addAttribute("user", tdUserService.findByUsername(username));
    	return "client/message_portrait";
    }
    //厨师列表
    @RequestMapping("/cslb")
    public String cslb(HttpServletRequest req,ModelMap map)
    {
    	tdCommonService.setCommon(map, req);
    	
    	List<TdArticle> chefList = tdArticleService.findByMenuId(10L);
    	map.addAttribute("chef_list", chefList);
    	return "client/cslb";
    }
    
    //厨师介绍
    @RequestMapping("/csjs/{id}")
    public String csjs(@PathVariable Long id, Long mid, ModelMap map, HttpServletRequest req){
        
	    tdCommonService.setCommon(map, req);
	    
        if (null == id || null == mid)
        {
            return "/client/error_404";
        }
        
//        String username = (String) req.getSession().getAttribute("username");
//        
//        // 读取浏览记录
//        if (null == username)
//        {
//            map.addAttribute("recent_page", tdUserRecentVisitService.findByUsernameOrderByVisitTimeDesc(req.getSession().getId(), 0, ClientConstant.pageSize));
//        }
//        else
//        {
//            map.addAttribute("recent_page", tdUserRecentVisitService.findByUsernameOrderByVisitTimeDesc(username, 0, ClientConstant.pageSize));
//        }
//        
//        TdNavigationMenu menu = tdNavigationMenuService.findOne(mid);
//        
//        map.addAttribute("menu_name", menu.getTitle());
//        
//        List<TdArticleCategory> catList = tdArticleCategoryService.findByMenuId(mid);
//        
//        map.addAttribute("info_category_list", catList);
        map.addAttribute("mid", mid);
        
        TdArticle tdArticle = tdArticleService.findOne(id);
        
        if (null != tdArticle)
        {
            map.addAttribute("article", tdArticle);
            map.addAttribute("prev_info", tdArticleService.findPrevOne(id, tdArticle.getCategoryId(), tdArticle.getMenuId()));
            map.addAttribute("next_info", tdArticleService.findNextOne(id, tdArticle.getCategoryId(), tdArticle.getMenuId()));
        }
        
        // 最近添加
        map.addAttribute("latest_info_page", tdArticleService.findByMenuIdAndIsEnableOrderByIdDesc(mid, 0, ClientConstant.pageSize));
        
    	return "/client/csjs";
    }
    
    /**
     * @author libiao
     * 
     */
    //活动
    @RequestMapping("/hd")
    public String hd(HttpServletRequest req,ModelMap map)
    {
    	String username =(String)req.getSession().getAttribute("username");
    	if(null == username)
    	{
    		return "redirect:/login";
    	}
    	tdCommonService.setCommon(map, req);
    	
    	// 列表页轮播广告
        TdAdType adType = tdAdTypeService.findByTitle("活动页广告");

        if (null != adType) {
            map.addAttribute("ad_list", tdAdService.findByTypeIdAndIsValidTrueOrderBySortIdAsc(adType.getId()));
        }
        
    	map.addAttribute("new_goods_list",tdGoodsService.findByIsNew());
    	
    	return "/client/hd";
    }
    //砍价活动套餐
    @RequestMapping("/kjhdtc")
    public String kjhdtc(HttpServletRequest req,ModelMap map)
    {
    	return "/client/kjhdtc";
    }
    //口味和禁忌
    @RequestMapping("/kwhjj")
    public String kwhjj(HttpServletRequest req,ModelMap map)
    {
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){
    		return "redirect:/login";
    	}
    	TdUser curentUser = tdUserService.findByUsername(username);
    	List<TdShippingAddress> kwhjj=curentUser.getShippingAddressList();
		map.addAttribute("kwhjj", kwhjj);
    	return "client/kwhjj";
    }
    //口味和禁忌编辑
    @RequestMapping("/kwhjjbj")
    public String kwhjjbj(HttpServletRequest req,ModelMap map)
    {	
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){	
    		return "redirect:/login";
    	}
    	return "client/kwhjjbj";
    }
    //套餐继续砍价
    @RequestMapping("/tcjxkj")
    public String tcjxkj(HttpServletRequest req,ModelMap map){
    	
    	return "client/tcjxkj";
    }
    //套餐具体砍价
    @RequestMapping("tcjtkj")
    public String tcjtkj(HttpServletRequest req,ModelMap map)
    {
    	return "client/tcjtkj";
    	
    }
    //砍价活动登陆tckj-login
    @RequestMapping("tckj_login")
    public String tckj_login(HttpServletRequest req,ModelMap map)
    {
    	return "client/tckj-login";
    	
    }
    //好友砍价详情
    @RequestMapping("hykjxq")
    public String hykjxq(HttpServletRequest req,ModelMap map)
    {
    	return "client/hykjxq";
    	
    }

    //常用地址
    @RequestMapping("cydz")
    public String cydz(HttpServletRequest req,ModelMap map)
    {	
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){
    		return "redirect:/login";
    	}
    	TdUser curentUser = tdUserService.findByUsername(username);
    	List<TdShippingAddress> shipping=curentUser.getShippingAddressList();
		map.addAttribute("shipping", shipping);
    	return "client/cydz";
    	
    }
    //优惠劵
    @RequestMapping("yhj")
    public String yhj(HttpServletRequest req,ModelMap map)
    {
    	return "client/yhj";
    	
    }
    //添加新地址
    
    @RequestMapping("tjxdz")
    public String tjxdz(HttpServletRequest req,ModelMap map)
    {
    	
    	String username=(String)req.getSession().getAttribute("username");
    	if(username==null){
    		
    		return "redirect:/login";
    	}
    	return "client/tjxdz";
    	
    }
    /**
     * 搜索
     * @param req 
     * @param map
     * @return
     */
    @RequestMapping("/search")
    public String search(String keyword, HttpServletRequest req,ModelMap map)
    {
    	return "client/search";
    }
}
