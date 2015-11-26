package com.ynyes.shwsc.controller.front;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.shwsc.entity.TdCoupon;
import com.ynyes.shwsc.entity.TdCouponType;
import com.ynyes.shwsc.entity.TdUser;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdCouponService;
import com.ynyes.shwsc.service.TdCouponTypeService;
import com.ynyes.shwsc.service.TdDiySiteService;
import com.ynyes.shwsc.service.TdUserRecentVisitService;
import com.ynyes.shwsc.service.TdUserService;
//import com.ynyes.shwsc.util.SMSUtil;

/**
 * 
 * 优惠券
 *
 */
@Controller
@RequestMapping("/coupon")
public class TdCouponController {
	@Autowired 
	private TdDiySiteService tdDiySiteService;
	
	@Autowired 
    private TdCouponService tdCouponService;
	
	@Autowired 
    private TdCouponTypeService tdCouponTypeService;
	
	@Autowired
    private TdCommonService tdCommonService;
	
	@Autowired
	private TdUserService tdUserService;
	
	@Autowired
    private TdUserRecentVisitService tdUserRecentVisitService;
    
	@RequestMapping("/list")
    public String infoList(Integer page, 
                            ModelMap map,
                            HttpServletRequest req) {
	    
	    tdCommonService.setHeader(map, req);
        
        // 优惠券种类
        List<TdCouponType> couponTypeList = tdCouponTypeService.findAllOrderBySortIdAsc();
        
        map.addAttribute("coupon_type_list", couponTypeList);
        
        if (null != couponTypeList)
        {
            for (TdCouponType ct : couponTypeList)
            {
                List<TdCoupon> couponList = tdCouponService.findByTypeIdAndIsDistributtedFalse(ct.getId());
                
                List<TdCoupon> disCouponList = tdCouponService.findByTypeIdAndIsDistributtedTrueOrderByIdDesc(ct.getId());
                
                // 未领取优惠券
                map.addAttribute("coupon_" + ct.getId() + "_list", couponList);
                
                // 已领取优惠券
                map.addAttribute("distributed_coupon_" + ct.getId() + "_list", disCouponList);
            }
        }
        
        //普通优惠券领取人
        List<TdCoupon> disCouponList1 = tdCouponService.findByIsDistributtedFalseOrderBySortIdAsc();
        if (null != disCouponList1) {
        	map.addAttribute("coupon_list", disCouponList1);
		}
       
        map.addAttribute("today", new Date());
        
        //传入用户信息
        String username = (String) req.getSession().getAttribute("username");
        TdUser tdUser = tdUserService.findByUsername(username);
        if (null != tdUser) {
        	 map.addAttribute("user", tdUser);
		}
        return "/client/yhj";
    }
	/**
	 * 优惠券领用
	 * @param page
	 * @param map
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/request", method=RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> couponRequest(Long couponId, 
                            HttpServletRequest req) {
	    Map<String, Object> res = new HashMap<String, Object>();
	    String username = (String) req.getSession().getAttribute("username");
	    if (null == username)
	    {
	    	res.put("msg", "请登录");
	    	return res;
	    }
	    TdUser user = tdUserService.findByUsername(username);
	    String mobile = user.getMobile();
	    res.put("code", 1);
	    
	    if (null == couponId)
	    {
	        res.put("message", "未选择优惠券");
	        return res;
	    }
	    
	    TdCoupon leftCoupon = tdCouponService.findOne(couponId);
	    
	    String couponName=leftCoupon.getTypeTitle();
	    if (null == leftCoupon || leftCoupon.getLeftNumber().compareTo(1L) < 0)
	    {
	        res.put("message", couponName+"已被领完");
            return res;
	    }
	    
	    TdCoupon coupon = tdCouponService.findByTypeIdAndMobileAndIsDistributtedTrue(leftCoupon.getTypeId(), mobile);
	    
	    if (null != coupon)
	    {
	        res.put("message", "每个用户限领一张同类型优惠券");
            return res;
	    }
	    
	    leftCoupon.setLeftNumber(leftCoupon.getLeftNumber() - 1L);
	    
	    tdCouponService.save(leftCoupon);
	    
	    TdCouponType ctype = tdCouponTypeService.findOne(leftCoupon.getTypeId());
	    
	    TdCoupon getCoupon = new TdCoupon();
	    
//	    getCoupon.setDiySiteId(leftCoupon.getDiySiteId());
//	    getCoupon.setDiySiteTitle(leftCoupon.getDiySiteTitle());
	    getCoupon.setCanUsePrice(leftCoupon.getCanUsePrice());
	    getCoupon.setTypeCategoryId(leftCoupon.getTypeCategoryId());
	    getCoupon.setGetNumber(1L);
	    getCoupon.setGetTime(new Date());
	    
	    
	    if (null != ctype && null != ctype.getTotalDays())
	    {
    	    Calendar ca = Calendar.getInstance();
    	    ca.add(Calendar.DATE, ctype.getTotalDays().intValue());
    	    getCoupon.setExpireTime(ca.getTime());
	    }
	    getCoupon.setPrice(ctype.getPrice());
	    getCoupon.setIsDistributted(true);
	    getCoupon.setIsUsed(false);
	    getCoupon.setMobile(mobile);
	    getCoupon.setTypeDescription(leftCoupon.getTypeDescription());
	    getCoupon.setTypeId(leftCoupon.getTypeId());
	    getCoupon.setTypePicUri(leftCoupon.getTypePicUri());
	    getCoupon.setTypeTitle(leftCoupon.getTypeTitle());
	    getCoupon.setUsername(username);
	    
	    tdCouponService.save(getCoupon);
	    
	    res.put("code", 0);
	    
	    return res;
	}
}
