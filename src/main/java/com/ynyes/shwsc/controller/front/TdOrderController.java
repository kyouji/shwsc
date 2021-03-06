package com.ynyes.shwsc.controller.front;

import static org.apache.commons.lang3.StringUtils.leftPad;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cytm.payment.alipay.AlipayConfig;
import com.cytm.payment.alipay.Constants;
import com.cytm.payment.alipay.PaymentChannelAlipay;
import com.cytm.payment.alipay.core.AlipayNotify;
import com.ibm.icu.util.Calendar;
import com.tencent.common.Configure;
import com.tencent.common.MD5;
import com.tencent.common.RandomStringGenerator;
import com.tencent.common.Signature;
import com.ynyes.shwsc.entity.TdCartGoods;
import com.ynyes.shwsc.entity.TdCoupon;
import com.ynyes.shwsc.entity.TdCouponType;
import com.ynyes.shwsc.entity.TdDeliveryType;
import com.ynyes.shwsc.entity.TdDiySite;
import com.ynyes.shwsc.entity.TdGoods;
import com.ynyes.shwsc.entity.TdGoodsDto;
import com.ynyes.shwsc.entity.TdOrder;
import com.ynyes.shwsc.entity.TdOrderGoods;
import com.ynyes.shwsc.entity.TdPayRecord;
import com.ynyes.shwsc.entity.TdPayType;
import com.ynyes.shwsc.entity.TdProductCategory;
import com.ynyes.shwsc.entity.TdShippingAddress;
import com.ynyes.shwsc.entity.TdUser;
import com.ynyes.shwsc.entity.TdUserPoint;
import com.ynyes.shwsc.service.TdCartGoodsService;
import com.ynyes.shwsc.service.TdCommonService;
import com.ynyes.shwsc.service.TdCouponService;
import com.ynyes.shwsc.service.TdCouponTypeService;
import com.ynyes.shwsc.service.TdDeliveryTypeService;
import com.ynyes.shwsc.service.TdDiySiteService;
import com.ynyes.shwsc.service.TdGoodsCombinationService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdOrderGoodsService;
import com.ynyes.shwsc.service.TdOrderService;
import com.ynyes.shwsc.service.TdPayRecordService;
import com.ynyes.shwsc.service.TdProductCategoryService;
import com.ynyes.shwsc.service.TdShippingAddressService;
import com.ynyes.shwsc.service.TdUserPointService;
import com.ynyes.shwsc.service.TdUserService;
import com.ynyes.shwsc.util.QRCodeUtils;

import net.sf.json.JSONObject;

/**
 * 订单
 *
 */
@Controller
@RequestMapping("/order")
public class TdOrderController extends AbstractPaytypeController {

    private static final String PAYMENT_ALI = "ALI";
    private static final String PAYMENT_WX = "WX";

    @Autowired
    private TdCartGoodsService tdCartGoodsService;

    @Autowired
    private TdUserService tdUserService;

    @Autowired
    private TdGoodsService tdGoodsService;

    @Autowired
    private TdOrderGoodsService tdOrderGoodsService;

    @Autowired
    private TdOrderService tdOrderService;

    @Autowired
    private TdDeliveryTypeService tdDeliveryTypeService;

    @Autowired
    private TdCommonService tdCommonService;

    @Autowired
    private TdUserPointService tdUserPointService;

    @Autowired
    private TdCouponService tdCouponService;

    @Autowired
    private TdCouponTypeService tdCouponTypeService;

    @Autowired
    private TdDiySiteService tdDiySiteService;

    @Autowired
    private TdPayRecordService payRecordService;

    @Autowired
    private TdGoodsCombinationService tdGoodsCombinationService;


    @Autowired
    private TdProductCategoryService tdProductCategoryService;
    
    @Autowired
    private TdShippingAddressService tdShippingAddressService;
    
    private PaymentChannelAlipay paymentChannelAlipay = new PaymentChannelAlipay();

    
    
    @RequestMapping(value = "/cancel")
    public String orderCancel(String orderNumber, Long state,HttpServletRequest req)
    {
    	String username = (String) req.getSession().getAttribute("username");
    	
    	if (username == null)
    	{
    		return "redirect:/login";
		}
    	TdOrder tdOrder = tdOrderService.findByOrderNumber(orderNumber);
		if (null == tdOrder || !tdOrder.getStatusId().equals(2L))
		{
			return "redirect:/user/order?state=" + state; 
		}
		
		tdOrder.setStatusId(7L);
		tdOrderService.save(tdOrder);
    	
    	
    	return "redirect:/user/order?state=" + state;
    }
    
	/**
     * 立即购买
     * 
     * @param type
     *            购买类型 (comb: 组合购买)
     * @param gid
     *            商品ID
     * @param zhid
     *            组合ID，多个组合商品以","分开
     * @param req
     * @param map
     * @return
     */
    @RequestMapping(value = "/buy")
    public String orderBuy(Long gid, String zhid, Long quantity,HttpServletRequest req, ModelMap map) {
    	
        String username = (String) req.getSession().getAttribute("username");

        if (null == username)
        {
            return "redirect:/login";
        }
        
//        TdUser tdUser = tdUserService.findByUsername(username);

        List<TdGoodsDto> tdGoodsList = new ArrayList<TdGoodsDto>();

        if (null == quantity)
        {
			quantity = 1L;
		}

        // 购买商品
        TdGoods goods = tdGoodsService.findOne(gid);

        if (null == goods) {
        	return "/client/error_404";
        }

        // 优惠券
        // map.addAttribute("coupon_list",tdCouponService.findByUsernameAndIsUseable(username));

        TdGoodsDto buyGoods = new TdGoodsDto();

        buyGoods.setGoodsId(goods.getId());
        buyGoods.setGoodsTitle(goods.getTitle());
        buyGoods.setGoodsCoverImageUri(goods.getCoverImageUri());
        buyGoods.setPrice(goods.getSalePrice());
        buyGoods.setQuantity(1L);
        buyGoods.setSaleId(0);

        tdCommonService.setHeader(map, req);
        map.addAttribute("good", tdGoodsService.findOne(gid));
        return "/client/submit_order";
    }

    /**
     * 
     * @param addressId
     * @param shopId
     * @param payTypeId
     * @param deliveryTypeId
     * @param isNeedInvoice
     * @param invoiceTitle
     * @param userMessage
     * @param appointmentTime
     * @param req
     * @param map
     * @return
     */
    @RequestMapping(value = "/buysubmit", method = RequestMethod.POST)
    public String buySubmit(String shippingAddress, // 送货地址
    						String shippingName, //购买人
    						String shippingPhone, //购买人手机
    						String appointmentTime, //用餐时间    	
    						String userRemarkInfo, //用户留言
    						Long goodId,	//商品id
				            Long quantity, // 购买数量
				            Long taste, //口味
				            Long tool, //用餐工具
				            String peopleRange,//使用人数范围
				            HttpServletRequest req,
				            ModelMap map)
    {
    	Double totalLeftPrice = 0.0;
    	
        String username = (String) req.getSession().getAttribute("username");

        if (null == username)
        {
            return "redirect:/login";
        }

        TdUser tdUser = tdUserService.findByUsernameAndIsEnabled(username);

        if (null == tdUser)
        {
            return "redirect:/login";
        }

        // 订单商品
        List<TdOrderGoods> orderGoodsList = new ArrayList<TdOrderGoods>();
        
        
        // 商品
        TdGoods goods = tdGoodsService.findById(goodId);
        
        if (goods == null)
        {
			return "/client/food";
		}
        
        if (quantity == null)
        {
			quantity = 0L;
		}
        if (taste == null)
        {
			taste = 0L;
		}
        if (tool == null)
        {
        	tool = 0L;
		}
        
        Double totalGoodsPrice = 0.0;

        TdOrderGoods ordergoods = new TdOrderGoods();
        ordergoods.setGoodsId(goods.getId());
        ordergoods.setGoodsTitle(goods.getTitle());
        ordergoods.setGoodsCoverImageUri(goods.getCoverImageUri());
        ordergoods.setPrice(goods.getSalePrice());
        ordergoods.setQuantity(quantity);
        ordergoods.setIsCommented(false);
        
        totalGoodsPrice = quantity * goods.getSalePrice();

        orderGoodsList.add(ordergoods);
        
        
        if (null == orderGoodsList || orderGoodsList.size() <= 0)
        {
            return "/client/error_404";
        }

        // 安装信息
        TdShippingAddress address = null;

        TdOrder tdOrder = new TdOrder();

        Date current = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String curStr = sdf.format(current);
        Random random = new Random();

        // 预约时间
        if (null != appointmentTime && appointmentTime.length() > 0)
        {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 小写的mm表示的是分钟

            try
            {
                Date appTime = sdf.parse(appointmentTime);
                tdOrder.setAppointmentTime(appTime);
            }
            catch (ParseException e) 
            {
                e.printStackTrace();
            }
        }

        // 基本信息
        tdOrder.setUsername(tdUser.getUsername());
        tdOrder.setOrderTime(current);
        tdOrder.setShippingAddress(shippingAddress);//地址
        tdOrder.setShippingName(shippingName);//姓名
        tdOrder.setShippingPhone(shippingPhone);//电话
        tdOrder.setImgUrl(goods.getCoverImageUri());//图片
        tdOrder.setGoodTitle(goods.getTitle());//商品title
        tdOrder.setIsCut(goods.getIsNew());//是否砍价
        tdOrder.setIsCupon(goods.getIsRecommendType());//是否使用使用卷
        tdOrder.setQuantity(quantity);
        tdOrder.setTaste(taste);
        tdOrder.setTool(tool);
        tdOrder.setPeopleRange(peopleRange);
        
        // 订单号
        tdOrder.setOrderNumber("SX" + curStr + leftPad(Integer.toString(random.nextInt(999)), 3, "0"));

        // 用户留言
        tdOrder.setUserRemarkInfo(userRemarkInfo);

        // 待付款
        tdOrder.setStatusId(2L);

        // 需付尾款额
        tdOrder.setTotalLeftPrice(totalLeftPrice);

        // 订单商品
        tdOrder.setOrderGoodsList(orderGoodsList);
        
        tdOrder.setTotalGoodsPrice(totalGoodsPrice);
        tdOrder.setGoodsPrice(goods.getSalePrice());
        tdOrder.setTotalPrice(totalGoodsPrice);

        // 保存订单商品及订单
        tdOrderGoodsService.save(orderGoodsList);

        tdOrder = tdOrderService.save(tdOrder);        
        
        // if (tdOrder.getIsOnlinePay()) {
        return "redirect:/user/order";
        // }

        // return "redirect:/order/success?orderId=" + tdOrder.getId();
    }

    @RequestMapping(value = "/info")
    public String orderInfo(HttpServletRequest req, HttpServletResponse resp,
            ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username)
        {
            return "redirect:/login";
        }

        // 把所有的购物车项转到该登陆用户下
        String sessionId = req.getSession().getId();

        List<TdCartGoods> cartGoodsList = tdCartGoodsService
                .findByUsername(sessionId);

        if (null != cartGoodsList && cartGoodsList.size() > 0) {
            for (TdCartGoods cartGoods : cartGoodsList) {
                cartGoods.setUsername(username);
                cartGoods.setIsLoggedIn(true);
            }
            tdCartGoodsService.save(cartGoodsList);
        }

        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);

        if (null != user) {
	        // 收货地址校验
	        List<TdShippingAddress> addressList = user.getShippingAddressList();
	        for (TdShippingAddress address : addressList) {
				if(null != address)
				{
					if(null == address.getReceiverCarcode() || null == address.getReceiverCartype()
							|| address.getReceiverCarcode().length()==0 || address.getReceiverCartype().length()==0)
					{
						tdShippingAddressService.delete(address);
					}
				}
			}
	        user = tdUserService.findByUsernameAndIsEnabled(username);
	        map.addAttribute("user", user);
        }

        
        List<TdCartGoods> selectedGoodsList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);

        Long totalPointLimited = 0L;// 积分限制综总和
        Double totalPrice = 0.0; // 购物总额

        // 积分限制总和 和 购物总额
        if (null != selectedGoodsList) {
            for (TdCartGoods cg : selectedGoodsList) {
                TdGoods goods = tdGoodsService.findOne(cg.getGoodsId());
                if (null != goods && null != goods.getPointLimited()) {
                    totalPointLimited += goods.getPointLimited()
                            * cg.getQuantity();
                    totalPrice += cg.getPrice() * cg.getQuantity();
                }
            }
        }

        // 查询购物车的所有种类
        List<String> productIds = new ArrayList<>();
        for (TdCartGoods cg : selectedGoodsList) {
            TdGoods goods = tdGoodsService.findOne(cg.getGoodsId());
            if (productIds.isEmpty()) {
                productIds.add(goods.getCategoryIdTree().split(",")[0]);// 根类别
            } else {
                if (!productIds
                        .contains(goods.getCategoryIdTree().split(",")[0])) {
                    productIds.add(goods.getCategoryIdTree().split(",")[0]);
                }
            }
        }
        /**
         * @author lc
         * @注释：优惠券 TODO: 满减券， 单品类券，普通券查找
         */
        // 如果有不同种类的商品则不能使用优惠券
        if (productIds.size() < 2) {
            List<TdCoupon> userCoupons = null;
            if (null != user.getMobile()) {
                userCoupons = tdCouponService.findByMobileAndIsUseable(user
                        .getMobile());// 根据账号查询所有优惠券
            }

            if (null != userCoupons) {
                List<TdCoupon> userCouponList = new ArrayList<>(); // 可用券
                TdCouponType couponType = null;
                for (int i = 0; i < userCoupons.size(); i++) {
                    couponType = tdCouponTypeService.findOne(userCoupons.get(i)
                            .getTypeId());
                    if (null != couponType
                            && !couponType.getTitle().equals("免费洗车券")
                            && !couponType.getTitle().equals("免费打蜡券")) {
                        if (couponType.getCategoryId().equals(1L)) {
                            TdProductCategory tpc = tdProductCategoryService
                                    .findOne(couponType.getProductTypeId());
                            List<String> templist = new ArrayList<>();
                            for (String cid : tpc.getParentTree().split(",")) {
                                templist.add(cid);
                            }
                            // 判断购物总价>满购券使用金额
                            if (totalPrice > couponType.getCanUsePrice()
                                    && templist.contains(productIds.get(0))) {
                                userCouponList.add(userCoupons.get(i));
                            }
                        } else if (couponType.getCategoryId().equals(0L)) {
                            userCouponList.add(userCoupons.get(i));
                        } else if (couponType.getCategoryId().equals(2L)) {
                            if (totalPrice > couponType.getCanUsePrice()) {
                                userCouponList.add(userCoupons.get(i));
                            }
                        }
                    }
                }
                map.addAttribute("coupon_list", userCouponList);
            }
        }

        // 积分限额
        if (null != user.getTotalPoints()) {
            if (totalPointLimited > user.getTotalPoints()) {
                map.addAttribute("total_point_limit", user.getTotalPoints());
            } else {
                map.addAttribute("total_point_limit", totalPointLimited);
            }
        }

        // 线下同盟店
        map.addAttribute("shop_list", tdDiySiteService.findByIsEnableTrue());

        // 支付方式列表
        setPayTypes(map, true, false, req);

        // 配送方式
        map.addAttribute("delivery_type_list",
                tdDeliveryTypeService.findByIsEnableTrue());

        // 选中商品
        map.addAttribute("buy_goods_list", selectedGoodsList);
        
        Date curr = new Date();
        Calendar cal = Calendar.getInstance();
        
        cal.setTime(curr);
        cal.add(Calendar.DATE, 1);
        
        map.addAttribute("tomorrow", cal.getTime());

        tdCommonService.setHeader(map, req);

        return "/client/order_info";
    }

    /**
     * 购物车数量加减
     * 
     * @param req
     * @param resp
     * @param type
     *            加减标志位
     * @param gid
     *            商品ID
     * @param map
     * @return
     */
    @RequestMapping(value = "/goods/{type}")
    public String orderEdit(HttpServletRequest req, HttpServletResponse resp,
            @PathVariable String type, Long gid, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        // 把所有的购物车项转到该登陆用户下
        List<TdCartGoods> cgList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);

        if (null != cgList && null != type && null != gid) {
            for (TdCartGoods cg : cgList) {
                if (gid.equals(cg.getGoodsId())) {
                    TdGoods goods = tdGoodsService.findOne(cg.getGoodsId());

                    if (null != goods) {
                        if (type.equalsIgnoreCase("plus")) {
                            // 闪购
                            if (goods.getIsFlashSale()
                                    && goods.getFlashSaleStartTime().before(
                                            new Date())
                                    && goods.getFlashSaleStopTime().after(
                                            new Date())
                                    && cg.getPrice().equals(
                                            goods.getFlashSalePrice())) {
                                if (cg.getQuantity().compareTo(
                                        goods.getFlashSaleLeftNumber()) < 0) {
                                    cg.setQuantity(cg.getQuantity() + 1L);
                                }
                            } else {
                                if (cg.getQuantity().compareTo(
                                        goods.getLeftNumber()) < 0) {
                                    cg.setQuantity(cg.getQuantity() + 1L);
                                }
                            }
                        } else {
                            if (cg.getQuantity().compareTo(1L) > 0) {
                                cg.setQuantity(cg.getQuantity() - 1L);
                            }
                        }

                        tdCartGoodsService.save(cg);
                        break;
                    }
                }
            }
        }
        //
        // List<TdCartGoods> selectedGoodsList =
        // tdCartGoodsService.findByUsernameAndIsSelectedTrue(username);
        // map.addAttribute("selected_goods_list", selectedGoodsList);

        return "redirect:/order/info";
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public String submit(Long addressId, // 送货地址
            Long shopId, Long payTypeId, // 支付方式ID
            Long deliveryTypeId, // 配送方式ID
            Long pointUse, // 使用粮草
            Boolean isNeedInvoice, // 是否需要发票
            String invoiceTitle, // 发票抬头
            String userMessage, // 用户留言
            Long couponId, // 优惠券ID
            String appointmentTime, HttpServletRequest req, ModelMap map) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        TdUser user = tdUserService.findByUsernameAndIsEnabled(username);

        if (null == user) {
            return "/client/error_404";
        }

        double payTypeFee = 0.0;
        double deliveryTypeFee = 0.0;
        double pointFee = 0.0;
        double couponFee = 0.0;

        // 收货地址
        TdShippingAddress address = null;

        if (null != addressId) {
            if (null == pointUse) {
                pointUse = 0L;
            }

            List<TdShippingAddress> addressList = user.getShippingAddressList();

            for (TdShippingAddress add : addressList) {
                if (add.getId().equals(addressId)) {
                    address = add;
                    break;
                }
            }
        }

        // 使用粮草
        if (null != user.getTotalPoints()) {
            if (pointUse.compareTo(user.getTotalPoints()) >= 0) {
                pointUse = user.getTotalPoints();
            }
        }

        // 购物车商品
        List<TdCartGoods> cartSelectedGoodsList = tdCartGoodsService
                .findByUsernameAndIsSelectedTrue(username);

        List<TdOrderGoods> orderGoodsList = new ArrayList<TdOrderGoods>();

        // 商品总价
        Double totalGoodsPrice = 0.0;

        // 返粮草总额
        Long totalPointReturn = 0L;

        // 购物车商品
        if (null != cartSelectedGoodsList) {
            for (TdCartGoods cartGoods : cartSelectedGoodsList) {
                if (cartGoods.getIsSelected()) {

                    TdGoods goods = tdGoodsService.findOne(cartGoods
                            .getGoodsId());

                    // 不存在该商品或已下架，则跳过
                    if (null == goods || !goods.getIsOnSale()) {
                        continue;
                    }

                    TdOrderGoods orderGoods = new TdOrderGoods();

                    // 商品信息
                    orderGoods.setGoodsId(goods.getId());
                    orderGoods.setGoodsTitle(goods.getTitle());
                    orderGoods.setGoodsSubTitle(goods.getSubTitle());
                    orderGoods.setGoodsCoverImageUri(goods.getCoverImageUri());

                    // 是否已申请退货
                    orderGoods.setIsReturnApplied(false);

                    // 销售方式
                    orderGoods.setGoodsSaleType(0);

                    long quantity = 0;

                    // 成交价
                    orderGoods.setPrice(goods.getSalePrice());

                    // 数量
                    quantity = Math.min(cartGoods.getQuantity(),
                            goods.getLeftNumber());

                    orderGoods.setQuantity(quantity);

                    // 获得积分
                    if (null != goods.getReturnPoints()) {
                        totalPointReturn += goods.getReturnPoints() * quantity;
                        orderGoods
                                .setPoints(goods.getReturnPoints() * quantity);
                    }

                    // 商品总价
                    totalGoodsPrice += cartGoods.getPrice()
                            * cartGoods.getQuantity();

                    orderGoodsList.add(orderGoods);

                    // 更新销量
                    Long soldNumber = goods.getSoldNumber();

                    if (null == soldNumber) {
                        soldNumber = 0L;
                    }

                    soldNumber += quantity;
                    goods.setSoldNumber(soldNumber);

                    /**
                     * @author lc
                     * @注释：更新库存
                     */
                    Long leftNumber = goods.getLeftNumber();
                    if (leftNumber >= quantity) {
                        leftNumber = leftNumber - quantity;
                    }
                    goods.setLeftNumber(leftNumber);

                    // 保存商品
                    tdGoodsService.save(goods, username);
                }
            }
        }

        if (null == orderGoodsList || orderGoodsList.size() <= 0) {
            return "/client/error_404";
        }

        TdOrder tdOrder = new TdOrder();

        Date current = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String curStr = sdf.format(current);
        Random random = new Random();

        // 预约时间
        if (null != appointmentTime) {
            sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 小写的mm表示的是分钟

            try {
                Date appTime = sdf.parse(appointmentTime);

                tdOrder.setAppointmentTime(appTime);

            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        // 基本信息
        tdOrder.setUsername(user.getUsername());
        tdOrder.setOrderTime(current);

        // 订单号
        tdOrder.setOrderNumber("P" + curStr
                + leftPad(Integer.toString(random.nextInt(999)), 3, "0"));

        // 安装信息
        if (null != address) {
            // 增加车牌 by zhangji
            tdOrder.setCarCode(address.getReceiverCarcode());
            // 增加车型 by zhangji
            tdOrder.setCarType(address.getReceiverCartype());

            tdOrder.setPostalCode(address.getPostcode());

            tdOrder.setShippingName(address.getReceiverName());
            tdOrder.setShippingPhone(address.getReceiverMobile());
            tdOrder.setShippingAddress(address.getProvince()
                    + address.getCity() + address.getDisctrict()
                    + address.getDetailAddress());
        }

        if (null != payTypeId) {
            TdPayType payType = tdPayTypeService.findOne(payTypeId);

            // 支付类型
            payTypeFee = payType.getFee();
            tdOrder.setPayTypeId(payType.getId());
            tdOrder.setPayTypeTitle(payType.getTitle());
            tdOrder.setPayTypeFee(payTypeFee);
            tdOrder.setIsOnlinePay(payType.getIsOnlinePay());
        }

        // 配送方式
        if (null != deliveryTypeId) {
            TdDeliveryType deliveryType = tdDeliveryTypeService
                    .findOne(deliveryTypeId);
            tdOrder.setDeliverTypeId(deliveryType.getId());
            tdOrder.setDeliverTypeTitle(deliveryType.getTitle());
            tdOrder.setDeliverTypeFee(deliveryType.getFee());
            deliveryTypeFee = deliveryType.getFee();
        }

        // 线下同盟店
        if (null != shopId) {
            TdDiySite shop = tdDiySiteService.findOne(shopId);

            if (null != shop) {
                tdOrder.setShopId(shop.getId());
                tdOrder.setShopTitle(shop.getTitle());

                // 用户归属
                if (null != user.getUpperDiySiteId()) {
                    user.setUpperDiySiteId(shop.getId());
                    user = tdUserService.save(user);
                }
            }
        }

        // 使用积分
        tdOrder.setPointUse(pointUse);

        // 用户留言
        tdOrder.setUserRemarkInfo(userMessage);

        // 优惠券
        if (null != couponId) {
            TdCoupon coupon = tdCouponService.findOne(couponId);

            if (null != coupon) {
                TdCouponType couponType = tdCouponTypeService.findOne(coupon
                        .getTypeId());

                couponFee = couponType.getPrice();
                coupon.setIsUsed(true);
                tdCouponService.save(coupon);
                tdOrder.setCouponUse(couponFee);
                tdOrder.setCouponTitle(coupon.getTypeTitle());
            }
        }

        pointFee = pointUse / 1;

        // 待付款
        tdOrder.setStatusId(2L);

        // 总价
        if ((totalGoodsPrice + payTypeFee + deliveryTypeFee) < (pointFee + couponFee) ) {
        	tdOrder.setTotalPrice(0.0);
		}else{
			tdOrder.setTotalPrice(totalGoodsPrice + payTypeFee
                    + deliveryTypeFee - pointFee - couponFee);
		}

        // 需付尾款额
        tdOrder.setTotalLeftPrice(0.0);

        // 发票
        if (null != isNeedInvoice) {
            tdOrder.setIsNeedInvoice(isNeedInvoice);
            tdOrder.setInvoiceTitle(invoiceTitle);
        } else {
            tdOrder.setIsNeedInvoice(false);
        }

        // 订单商品
        tdOrder.setOrderGoodsList(orderGoodsList);
        tdOrder.setTotalGoodsPrice(totalGoodsPrice);

        // 粮草奖励
        tdOrder.setPoints(totalPointReturn);

        // 保存订单商品及订单
        tdOrderGoodsService.save(orderGoodsList);
        /**
         * @author lc
         * @注释：设置订单类型
         */
        tdOrder.setTypeId(1L);
        tdOrder = tdOrderService.save(tdOrder);

        // 添加积分使用记录
        if (null != user) {
            if (null == user.getTotalPoints()) {
                user.setTotalPoints(0L);

                user = tdUserService.save(user);
            }

            if (pointUse.compareTo(0L) >= 0 && null != user.getTotalPoints()
                    && user.getTotalPoints().compareTo(pointUse) >= 0) {
                TdUserPoint userPoint = new TdUserPoint();
                userPoint.setDetail("购买商品使用积分抵扣");
                userPoint.setOrderNumber(tdOrder.getOrderNumber());
                userPoint.setPoint(0 - pointUse);
                userPoint.setPointTime(new Date());
                userPoint.setUsername(username);
                userPoint.setTotalPoint(user.getTotalPoints() - pointUse);
                tdUserPointService.save(userPoint);

                user.setTotalPoints(user.getTotalPoints() - pointUse);
                tdUserService.save(user);
            }
        }

        // 删除已生成订单的购物车项
        tdCartGoodsService.delete(cartSelectedGoodsList);

        if (tdOrder.getTotalPrice() == 0) {
			afterPaySuccess(tdOrder);
		}
        
        // if (tdOrder.getIsOnlinePay()) {
        return "redirect:/order/pay?orderId=" + tdOrder.getId();
        // }

        // return "redirect:/order/success?orderId=" + tdOrder.getId();
    }

    @RequestMapping(value = "/success")
    public String success(Long orderId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        tdCommonService.setHeader(map, req);

        if (null == orderId) {
            return "/client/error_404";
        }

        map.addAttribute("order", tdOrderService.findOne(orderId));

        return "/client/order_success";
    }

    /**
     * 支付选择页面
     * 
     * @param orderId
     *            订单ID
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/pay")
    public String pay(Long orderId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        tdCommonService.setHeader(map, req);

        if (null == orderId)
        {
            return "/client/error_404";
        }

        map.addAttribute("order", tdOrderService.findOne(orderId));

        return null;
    }

    /**
     * 支付
     * 
     * @param orderId
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/dopay")
    public String payOrder(Long orderId, ModelMap map,HttpServletRequest req,Long state,String code)
    {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username)
        {
            return "redirect:/login";
        }
        TdUser user = tdUserService.findByUsername(username);

        tdCommonService.setHeader(map, req);

        String openId = "";
        if (null == state) 
        {
            return "/client/error_404";
        }
        if (user.getOpenid() == null)
        {
            if (code != null)
        	{
        		System.out.println("Madejing: code = " + code);
        		
    			String accessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxb8723d9b73bb0fb5&secret=45725ddd60c7ac33d91ea1caa843a2dc&code=" + code + "&grant_type=authorization_code";
    			
    			System.out.println("Madejing: accessTokenUrl = " + accessTokenUrl);
    			
    			String result = com.ynyes.shwsc.util.HttpRequest.sendGet(accessTokenUrl, null);
    			
    			System.out.println("madjeing: result =" + result);
    			
    		    openId = JSONObject.fromObject(result).getString("openid");
    		    user.setOpenid(JSONObject.fromObject(result).getString("openid"));
    		    System.out.println("Madejing: openid = " + openId);
    		}
		}


        TdOrder order = tdOrderService.findOne(state);

        if (null == order)
        {
            return "/client/error_404";
        }

        // 根据订单类型来判断支付时间是否过期
        // 普通 订单提交后24小时内
        Date cur = new Date();
        long temp = cur.getTime() - order.getOrderTime().getTime();
        if (temp > 1000 * 3600 / 2)
        {
        	order.setStatusId(7L);
        	tdOrderService.save(order);
        	return "/client/wddd";
        }

        // 待付款
        if (!order.getStatusId().equals(2L))
        {
            return "/client/error_404";
        }

        String amount = order.getTotalPrice().toString();
        req.setAttribute("totalPrice", amount);

        String payForm = "";
        map.addAttribute("order", order);
        map.addAttribute("order_number", order.getOrderNumber());
		map.addAttribute("total_price", order.getTotalPrice());

		Calendar calExpire = Calendar.getInstance();
		calExpire.setTime(order.getOrderTime());


		//统一支付接口
		String noncestr = RandomStringGenerator.getRandomStringByLength(32);
		ModelMap signMap = new ModelMap();
		signMap.addAttribute("appid", Configure.getAppid());
		signMap.addAttribute("attach", "订单支付");
		signMap.addAttribute("body", "支付订单" + order.getOrderNumber());
		signMap.addAttribute("mch_id", Configure.getMchid());
		signMap.addAttribute("nonce_str",noncestr);
		signMap.addAttribute("out_trade_no", order.getOrderNumber());
		signMap.addAttribute("total_fee", Math.round(order.getTotalPrice() * 100));
		signMap.addAttribute("spbill_create_ip", "116.55.230.178");
		signMap.addAttribute("notify_url", "http://chuzi.peoit.com/order/wx_notify");
		signMap.addAttribute("trade_type", "JSAPI");
		signMap.addAttribute("openid", user.getOpenid());

		String mysign = Signature.getSign(signMap);

		String content = "<xml>\n" + "<appid>"
				+ Configure.getAppid()
				+ "</appid>\n"
				+ "<attach>订单支付</attach>\n"
				+ "<body>支付订单"
				+ order.getOrderNumber()
				+ "</body>\n"
				+ "<mch_id>"
				+ Configure.getMchid()
				+ "</mch_id>\n"
				+ "<nonce_str>"
				+ noncestr
				+ "</nonce_str>\n"
				+ "<notify_url>http://chuzi.peoit.com/order/wx_notify</notify_url>\n"
				+ "<out_trade_no>" + order.getOrderNumber() + "</out_trade_no>\n"
				+ "<spbill_create_ip>116.55.230.178</spbill_create_ip>\n"
				+ "<total_fee>" + Math.round(order.getTotalPrice() * 100)
				+ "</total_fee>\n" + "<trade_type>JSAPI</trade_type>\n"
				+ "<sign>" + mysign + "</sign>\n"
				+ "<openid>" + user.getOpenid() + "</openid>\n" + "</xml>\n";
		System.out.print("MDJ: xml=" + content + "\n");

		String return_code = null;
		String prepay_id = null;
		String result_code = null;
		String line = null;
		HttpsURLConnection urlCon = null;
		try
		{
			urlCon = (HttpsURLConnection) (new URL("https://api.mch.weixin.qq.com/pay/unifiedorder")).openConnection();
			urlCon.setDoInput(true);
			urlCon.setDoOutput(true);
			urlCon.setRequestMethod("POST");
			urlCon.setRequestProperty("Content-Length",String.valueOf(content.getBytes().length));
			urlCon.setUseCaches(false);
			// 设置为gbk可以解决服务器接收时读取的数据中文乱码问题
			urlCon.getOutputStream().write(content.getBytes("utf-8"));
			urlCon.getOutputStream().flush();
			urlCon.getOutputStream().close();
			BufferedReader in = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));

			while ((line = in.readLine()) != null)
			{
				System.out.println(": rline: " + line);
				if (line.contains("<return_code>"))
				{
					return_code = line.replaceAll(
							"<xml><return_code><\\!\\[CDATA\\[", "")
							.replaceAll("\\]\\]></return_code>", "");
				} 
				else if (line.contains("<prepay_id>")) 
				{
					prepay_id = line.replaceAll("<prepay_id><\\!\\[CDATA\\[",
							"").replaceAll("\\]\\]></prepay_id>", "");
				}
				else if (line.contains("<result_code>"))
				{
					result_code = line.replaceAll(
							"<result_code><\\!\\[CDATA\\[", "").replaceAll(
									"\\]\\]></result_code>", "");
				}
			}

			System.out.println("MDJ: return_code: " + return_code + "\n");
			System.out.println("MDJ: prepay_id: " + prepay_id + "\n");
			System.out.println("MDJ: result_code: " + result_code + "\n");

			if ("SUCCESS".equalsIgnoreCase(return_code)
					&& "SUCCESS".equalsIgnoreCase(result_code)
					&& null != prepay_id)
			{
				noncestr = RandomStringGenerator.getRandomStringByLength(32);

				String timeStamp = String.valueOf(System.currentTimeMillis() / 1000);
				String packageString = "prepay_id=" + prepay_id;
				String signType = "MD5";
				ModelMap returnsignmap = new ModelMap();
				returnsignmap.addAttribute("appId", Configure.getAppid());
				returnsignmap.addAttribute("timeStamp", timeStamp);
				returnsignmap.addAttribute("nonceStr", noncestr);
				returnsignmap.addAttribute("package", packageString);
				returnsignmap.addAttribute("signType", signType);

				
				String returnsign = Signature.getSign(returnsignmap);
				content = "<xml>\n" + 
				"<appid>" + Configure.getAppid() + "</appid>\n" + 
				"<timeStamp>" + timeStamp + "</timeStamp>\n" +
				"<nonceStr>" + noncestr + "</nonceStr>\n" + 
				"<package>" + packageString + "</package>\n" + 
				"<signType>" + signType + "</signType>\n" + 
				"<signType>" + returnsign + "</signType>\n" + 
				"</xml>\n";

				System.out.print(": returnPayData xml=" + content);
				map.addAttribute("appId", Configure.getAppid());
				map.addAttribute("timeStamp", timeStamp);
				map.addAttribute("nonceStr", noncestr);
				map.addAttribute("package", packageString);
				map.addAttribute("signType", signType);
				map.addAttribute("paySign", returnsign);
				map.addAttribute("orderId", state);
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
        tdOrderService.save(order);

        map.addAttribute("payForm", payForm);

        return "/client/pay_order";
    }

    @RequestMapping(value = "/wx_return")
    public void wx_return(HttpServletResponse response,
            HttpServletRequest request) throws Exception {
        /**
         * <xml> <appid><![CDATA[wx8a4517e0f1b3536a]]></appid>
         * <openid><![CDATA[od6bXt6a8VHV7cjB21j8O6zwVOIU]]></openid>
         * <mch_id><![CDATA[1265095501]]></mch_id>
         * <is_subscribe><![CDATA[N]]></is_subscribe>
         * <nonce_str><![CDATA[XyodZmN32CcaPoub]]></nonce_str>
         * <product_id><![CDATA[b15091419521303]]></product_id>
         * <sign><![CDATA[CDF42D34EE39FBDADD3A0B0951AC2F4B]]></sign> </xml>
         */

    	System.out.println("MDJ: 回调方法触发！\n");
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));

		String line = null;
		String return_code = null;
		String result_code = null;
		String noncestr = null;
		String out_trade_no = null;

		try {
			while ((line = br.readLine()) != null) {
				System.out.print("MDJ: notify" + line + "\n");

				if (line.contains("<return_code>")) {
					return_code = line.replaceAll("<return_code><\\!\\[CDATA\\[", "") .replaceAll("\\]\\]></return_code>", "");
				} else if (line.contains("<out_trade_no>")) {
					out_trade_no = line.replaceAll("<out_trade_no><\\!\\[CDATA\\[", "").replaceAll("\\]\\]></out_trade_no>", "");
				} else if (line.contains("<result_code>")) {
					result_code = line.replaceAll("<result_code><\\!\\[CDATA\\[", "").replaceAll("\\]\\]></result_code>", "");
				}
			}

			System.out.println("MDJ: notify return_code: " + return_code + "\n");
			System.out.println("MDJ: notify out_trade_no: " + out_trade_no + "\n");
			System.out.println("MDJ: notify result_code: " + result_code + "\n");

			if (return_code.contains("SUCCESS") && 
					result_code.contains("SUCCESS") && 
					null != out_trade_no)
			{
				TdOrder order = tdOrderService.findByOrderNumber(out_trade_no);

				if (null != order)
				{
					afterPaySuccess(order);
				}
				
				String content = "<xml>\n"
						+ "<result_code>SUCCESS</result_code>\n"
						+ "<return_code></return_code>\n"
						+ "</xml>\n";

				System.out.print("MDJ: return xml=" + content + "\n");

				try {
					// 把xml字符串写入响应
					byte[] xmlData = content.getBytes();

					response.setContentType("text/xml");
					response.setContentLength(xmlData.length);

					ServletOutputStream os = response.getOutputStream();
					os.write(xmlData);

					os.flush();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			br.close();
		}
    }

    @RequestMapping(value = "/wx_notify")
    public void wx_notify(HttpServletResponse response,
            HttpServletRequest request) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(
                request.getInputStream()));

        String line = null;
        String return_code = null;
        String result_code = null;
        String noncestr = null;
        String out_trade_no = null;

        try {
            while ((line = br.readLine()) != null) {
                System.out.print("Sharon: notify" + line + "\n");
                
                if (line.contains("<return_code>")) {
                    return_code = line.replaceAll("<return_code><\\!\\[CDATA\\[", "") .replaceAll("\\]\\]></return_code>", "");
                } else if (line.contains("<out_trade_no>")) {
                    out_trade_no = line.replaceAll("<out_trade_no><\\!\\[CDATA\\[", "").replaceAll("\\]\\]></out_trade_no>", "");
                } else if (line.contains("<result_code>")) {
                    result_code = line.replaceAll("<result_code><\\!\\[CDATA\\[", "").replaceAll("\\]\\]></result_code>", "");
                }
            }
            
            System.out.println("Sharon: notify return_code: " + return_code);
            System.out.println("Sharon: notify out_trade_no: " + out_trade_no);
            System.out.println("Sharon: notify result_code: " + result_code);
            
            if (return_code.contains("SUCCESS") && 
                    result_code.contains("SUCCESS") && 
                    null != out_trade_no)
            {
                TdOrder order = tdOrderService.findByOrderNumber(out_trade_no.substring(0, out_trade_no.length() - 1));
                
                if (null != order)
                {
                    afterPaySuccess(order);
                }
                
                noncestr = RandomStringGenerator.getRandomStringByLength(32);
                String sa = "appid=" + Configure.getAppid()
                        + "&mch_id=" + Configure.getMchid()
                        + "&nonce_str=" + noncestr
                        + "&result_code=SUCCESS"
                        + "&return_code=SUCCESS";
                
                String sign = MD5.MD5Encode(
                        sa + "&key=192006250b4c09247ec02edce69f6acy")
                        .toUpperCase();
                
                String content = "<xml>\n"
                        + "<appid>" + Configure.getAppid() + "</appid>\n"
                        + "<mch_id>" + Configure.getMchid() + "</mch_id>\n"
                        + "<nonce_str>" + noncestr + "</nonce_str>\n"
                        + "<result_code>SUCCESS</result_code>\n"
                        + "<return_code>SUCCESS</return_code>\n"
                        + "<sign>" + sign + "</sign>\n"
                        + "</xml>\n";
                
                System.out.print("Sharon: return xml=" + content);

                try {
                    // 把xml字符串写入响应
                    byte[] xmlData = content.getBytes();

                    response.setContentType("text/xml");
                    response.setContentLength(xmlData.length);

                    ServletOutputStream os = response.getOutputStream();
                    os.write(xmlData);

                    os.flush();
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            br.close();
        }
    }

    @RequestMapping(value = "/payqrcode", method = RequestMethod.GET)
    public void verify(HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        QRCodeUtils qr = new QRCodeUtils();
        String url = (String) request.getSession().getAttribute(
                "WXPAYURLSESSEION");
        qr.getQRCode(url, 300, response);
    }

    /**
     * 支付尾款
     * 
     * @param orderId
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/dopayleft/{orderId}")
    public String payOrderLeft(@PathVariable Long orderId, ModelMap map,
            HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");

        if (null == username) {
            return "redirect:/login";
        }

        tdCommonService.setHeader(map, req);

        if (null == orderId) {
            return "/client/error_404";
        }

        TdOrder order = tdOrderService.findOne(orderId);

        if (null == order) {
            return "/client/error_404";
        }
        // 根据订单类型来判断支付时间是否过期
        if (order.getTypeId().equals(3L)) { // 抢拍 订单提交后20分钟内
            Date cur = new Date();
            long temp = cur.getTime() - order.getOrderTime().getTime();
            // System.out.println(temp);
            if (temp > 1000 * 60 * 20) {
                return "/client/overtime";
            }
        } else if (order.getTypeId().equals(4L) || order.getTypeId().equals(5L)) { // 团购
        	
        	TdGoods tdGoods = tdGoodsService.findOne(order.getOrderGoodsList().get(0).getGoodsId());
        	
        	long temp = 0L;
        	Date cur = new Date();
        	// 预付是订单提交后12小时内，尾款是团购时间结束后24小时
            if (order.getTypeId().equals(4L) && null != tdGoods.getGroupSaleStopTime()) {
            	temp =cur.getTime() - tdGoods.getGroupSaleStopTime().getTime() ;
			}else {
				if (null != tdGoods.getGroupSaleHundredStopTime()) {
					temp = cur.getTime() - tdGoods.getGroupSaleHundredStopTime().getTime();
				}				
			}            
            if (temp > 1000 * 3600 * 24) {
                return "/client/overtime";
            }
        } else { // 普通 订单提交后24小时内
            Date cur = new Date();
            long temp = cur.getTime() - order.getOrderTime().getTime();
            if (temp > 1000 * 3600 * 24) {
                return "/client/overtime";
            }
        }

        // 待付尾款
        if (!order.getStatusId().equals(3L)) {
            return "/client/error_404";
        }

        String amount = order.getTotalLeftPrice().toString();
        req.setAttribute("totalPrice", amount);

        String payForm = "";

        Long payId = order.getPayTypeId();
        TdPayType payType = tdPayTypeService.findOne(payId);
        if (payType != null) {
            TdPayRecord record = new TdPayRecord();
            record.setCreateTime(new Date());
            record.setOrderId(order.getId());
            record.setPayTypeId(payType.getId());
            record.setStatusCode(1);
            record.setCreateTime(new Date());
            record = payRecordService.save(record);

            String payRecordId = record.getId().toString();
            int recordLength = payRecordId.length();
            if (recordLength > 6) {
                payRecordId = payRecordId.substring(recordLength - 6);
            } else {
                payRecordId = leftPad(payRecordId, 6, "0");
            }
            req.setAttribute("payRecordId", payRecordId);

            req.setAttribute("orderNumber", order.getOrderNumber());

            String payCode = payType.getCode();
            if (PAYMENT_ALI.equals(payCode)) {
                payForm = paymentChannelAlipay.getPayFormData(req);
                map.addAttribute("charset", AlipayConfig.CHARSET);
            }else if (PAYMENT_WX.equals(payCode)) {
                map.addAttribute("order_number", order.getOrderNumber());
                map.addAttribute("total_price", order.getTotalLeftPrice());

                String sa = "appid=" + Configure.getAppid() + "&mch_id="
                        + Configure.getMchid() + "&nonce_str="
                        + RandomStringGenerator.getRandomStringByLength(32)
                        + "&product_id=" + order.getId() + "&time_stamp="
                        + System.currentTimeMillis() / 1000;

                String sign = MD5.MD5Encode(
                        sa + "&key=192006250b4c09247ec02edce69f6acy")
                        .toUpperCase();

                System.out.print("Sharon: weixin://wxpay/bizpayurl?" + sa
                        + "&sign=" + sign + "\n");

                req.getSession().setAttribute("WXPAYURLSESSEION",
                        "weixin://wxpay/bizpayurl?" + sa + "&sign=" + sign);
                // "weixin://wxpay/bizpayurl?appid=wx2421b1c4370ec43b&mch_id=10000100&nonce_str=f6808210402125e30663234f94c87a8c&product_id=1&time_stamp=1415949957&sign=512F68131DD251DA4A45DA79CC7EFE9D");
                return "/client/order_pay_wx";
            }
            else {
                // 其他目前未实现的支付方式
                return "/client/error_404";
            }
        } else {
            return "/client/error_404";
        }

        tdOrderService.save(order);

        map.addAttribute("payForm", payForm);

        return "/client/order_pay_form";
    }

    @RequestMapping(value = "/pay/success")
    public String paySuccess(ModelMap map, HttpServletRequest req) {
        // String username = (String) req.getSession().getAttribute("username");
        //
        // if (null == username) {
        // return "redirect:/login";
        // }

        tdCommonService.setHeader(map, req);

        return "/client/order_pay_success";
    }

    @RequestMapping(value = "/pay/notify")
    public String payNotify(ModelMap map, HttpServletRequest req) {
        // String username = (String) req.getSession().getAttribute("username");
        //
        // if (null == username) {
        // return "redirect:/login";
        // }

        tdCommonService.setHeader(map, req);

        return "/client/order_pay";
    }

    /*
     * 
     */
    @RequestMapping(value = "/pay/notify_alipay")
    public void payNotifyAlipay(ModelMap map, HttpServletRequest req,
            HttpServletResponse resp) {
    	paymentChannelAlipay.doResponse(req, resp);
    }

    /*
     * 
     */
    @RequestMapping(value = "/pay/notify_cebpay")
    public void payNotifyCEBPay(ModelMap map, HttpServletRequest req,
            HttpServletResponse resp) {
    }

    /*
     * 
     */
    @RequestMapping(value = "/pay/result_alipay")
    public String payResultAlipay(Device device, ModelMap map, HttpServletRequest req,
            HttpServletResponse resp) {
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = req.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            try {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"),
                        AlipayConfig.CHARSET);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put(name, valueStr);
        }

        // 获取支付宝的返回参数
        String orderNo = "";
        String trade_status = "";
        try {
            // 商户订单号
            orderNo = new String(req.getParameter(Constants.KEY_OUT_TRADE_NO)
                    .getBytes("ISO-8859-1"), AlipayConfig.CHARSET);
            // 交易状态
            trade_status = new String(req.getParameter("trade_status")
                    .getBytes("ISO-8859-1"), AlipayConfig.CHARSET);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        // 计算得出通知验证结果
        boolean verify_result = AlipayNotify.verify(params);

        tdCommonService.setHeader(map, req);
        orderNo = (orderNo == null) ? "" : (orderNo.length() < 6) ? orderNo
                : orderNo.substring(0, orderNo.length() - 6);
        TdOrder order = tdOrderService.findByOrderNumber(orderNo);
        if (order == null) {
            // 订单不存在
        	// 触屏
            if (device.isMobile() || device.isTablet()) {
                return "/touch/order_pay_failed";
            }
            return "/client/order_pay_failed";
        }
        map.put("order", order);
        if (verify_result) {// 验证成功
            if ("WAIT_SELLER_SEND_GOODS".equals(trade_status)) {

                // 订单支付成功
                afterPaySuccess(order);
                // 触屏
                if (device.isMobile() || device.isTablet()) {
                    return "/touch/order_pay_success";
                }
                return "/client/order_pay_success";
            }
        }

        // 验证失败或者支付失败
        // 触屏
        if (device.isMobile() || device.isTablet()) {
            return "/touch/order_pay_failed";
        }
        return "/client/order_pay_failed";
    }

    @RequestMapping(value = "/pay/result_wxpay")
    public String payResultWxpay(Device device, String productid, String openid, ModelMap map,
            HttpServletRequest req, HttpServletResponse resp) {

        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = req.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = iter.next();
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            try {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"),
                        AlipayConfig.CHARSET);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put(name, valueStr);
        }

        // 获取支付宝的返回参数
        String orderNo = "";
        String trade_status = "";
        try {
            // 商户订单号
            orderNo = new String(req.getParameter(Constants.KEY_OUT_TRADE_NO)
                    .getBytes("ISO-8859-1"), AlipayConfig.CHARSET);
            // 交易状态
            trade_status = new String(req.getParameter("trade_status")
                    .getBytes("ISO-8859-1"), AlipayConfig.CHARSET);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        // 计算得出通知验证结果
        boolean verify_result = AlipayNotify.verify(params);

        tdCommonService.setHeader(map, req);

        orderNo = (orderNo == null) ? "" : (orderNo.length() < 6) ? orderNo
                : orderNo.substring(0, orderNo.length() - 6);
        TdOrder order = tdOrderService.findByOrderNumber(orderNo);
        if (order == null) {
            // 订单不存在
        	 // 触屏
            if (device.isMobile() || device.isTablet()) {
                return "/touch/order_pay_failed";
            }
            return "/client/order_pay_failed";
            
        }

        map.put("order", order);

        if (verify_result) {// 验证成功
            if ("WAIT_SELLER_SEND_GOODS".equals(trade_status)) {

                // 订单支付成功
                afterPaySuccess(order);
                // 触屏
                if (device.isMobile() || device.isTablet()) {
                    return "/touch/order_pay_success";
                }
                return "/client/order_pay_success";
            }
        }

        // 验证失败或者支付失败
        // 触屏
        if (device.isMobile() || device.isTablet()) {
            return "/touch/order_pay_failed";
        }
        return "/client/order_pay_failed";
    }

    /*
     * 
     */


    /*
     * 
     */
    @RequestMapping(value = "/change_paymethod", method = { RequestMethod.POST })
    public @ResponseBody Map<String, String> changePaymentMethod(Long orderId,
            Long paymentMethodId, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("username");
        Map<String, String> result = new HashMap<String, String>();
        result.put("status", "F");
        if (null == username) {
            result.put("message", "请先登录！");
            return result;
        }

        if (null == orderId) {
            result.put("message", "订单Id非法！");
            return result;
        }

        if (null == paymentMethodId) {
            result.put("message", "支付方式非法！");
            return result;
        }

        TdOrder order = tdOrderService.findOne(orderId);

        if (null == order) {
            result.put("message", "不存在的订单信息！");
            return result;
        }

        TdPayType payType = tdPayTypeService.findOne(paymentMethodId);
        if (null == payType) {
            result.put("message", "不存在的支付方式信息！");
            return result;
        }

        if (!order.getStatusId().equals(2L) && !order.getStatusId().equals(3L)) {
            result.put("message", "订单不能修改支付方式！");
            return result;
        }

        if (payType.getIsEnable()) {
            result.put("message", "所选的支付方式暂不支持，请选择其他支付方式！");
        }

        Double payTypeFee = payType.getFee();
        payTypeFee = payTypeFee == null ? 0.0 : payTypeFee;

        double goodPrice = order.getTotalGoodsPrice();
        Double deliverTypeFee = order.getDeliverTypeFee();
        deliverTypeFee = deliverTypeFee == null ? 0.0 : deliverTypeFee;
        /*
         * 订单金额=商品总额+支付手续费+运费-优惠券金额-积分抵扣金额 优惠券金额+积分抵扣金额=商品总额+支付手续费+运费-订单金额
         */
        Double orgPayTypeFee = order.getPayTypeFee();
        orgPayTypeFee = orgPayTypeFee == null ? 0.0 : orgPayTypeFee;
        double couponAndPointsFee = goodPrice + orgPayTypeFee + deliverTypeFee
                - order.getTotalPrice();

        /*
         * 按百分比收取手续费,手续费重新计算(商品总额*百分比)
         */
        if (payType.getIsFeeCountByPecentage()) {
            payTypeFee = goodPrice * payTypeFee / 100;
        }

        order.setTotalPrice(goodPrice + payTypeFee + deliverTypeFee
                - couponAndPointsFee);
        order.setPayTypeFee(payTypeFee);
        order.setPayTypeId(payType.getId());
        order.setPayTypeTitle(payType.getTitle());
        order.setIsOnlinePay(payType.getIsOnlinePay());

        tdOrderService.save(order);

        result.put("status", "S");
        result.put("message", "订单支付方式修改成功！");
        return result;
    }

    /**
     * 订单支付成功后步骤
     * 
     * @param tdOrder
     *            订单
     */
    private void afterPaySuccess(TdOrder tdOrder) {
    	if (null == tdOrder) {
			return;
		}

		// 用户
		TdUser tdUser = tdUserService.findByUsername(tdOrder.getUsername());

		if (tdOrder.getStatusId().equals(2L)
				&& !tdOrder.getTotalLeftPrice().equals(0)) 
		{
			// 待付尾款
			tdOrder.setPayTime(new Date());
			tdOrder.setStatusId(4L);
			tdOrder = tdOrderService.save(tdOrder);
			return;
		} 
		else
		{
			// 待发货
			tdOrder.setStatusId(4L);
			tdOrder = tdOrderService.save(tdOrder);
		}

		List<TdOrderGoods> tdOrderGoodsList = tdOrder.getOrderGoodsList();

		Long totalPoints = 0L;
		Double totalCash = 0.0;

		// 返利总额
		if (null != tdOrderGoodsList) {
			for (TdOrderGoods tog : tdOrderGoodsList) {
				if (0 == tog.getGoodsSaleType()) // 正常销售
				{
					TdGoods tdGoods = tdGoodsService.findOne(tog.getGoodsId());

					if (null != tdGoods && null != tdGoods.getReturnPoints()) {
						totalPoints += tdGoods.getReturnPoints();

						if (null != tdGoods.getShopReturnRation()) {
							totalCash = tdGoods.getSalePrice() * tdGoods.getShopReturnRation();
						}
					}
				}
			}
		}
    }
}
