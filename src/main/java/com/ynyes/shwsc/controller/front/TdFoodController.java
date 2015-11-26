package com.ynyes.shwsc.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.shwsc.entity.TdCartGoods;
import com.ynyes.shwsc.entity.TdGoods;
import com.ynyes.shwsc.entity.TdParameter;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdCartGoodsService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdParameterService;
import com.ynyes.shwsc.service.TdProductCategoryService;

@Controller
@RequestMapping("/food")
public class TdFoodController 
{
	@Autowired
	private TdAdTypeService tdAdTypeService;
	
	@Autowired
	private TdCartGoodsService tdCartGoodsService;
	
	@Autowired
	private TdAdService tdAdService;
	
	@Autowired
	private TdGoodsService tdGoodsService;
	
	@Autowired
	private TdParameterService TdParameterService;
	
	@Autowired
	private TdProductCategoryService tdProductCategoryService;
	
	/**
	 * 美食首页
	 * @return
	 */
	@RequestMapping()
	public String foodIndex()
	{
		return "client/food_index";
	}
	
	/**
	 * 美食列表
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("/detail/{id}")
	public String foodDetal(ModelMap map, @PathVariable Long id)
	{
		TdParameter parameter =  TdParameterService.findOne(1L);
		String parameterValue = parameter.getValueList();
		String[] strings =  parameterValue.split(",");
		map.addAttribute("people_number",strings);
		Page<TdGoods> goods_page = tdGoodsService.findByCategoryIdAndIsOnSaleTrue(id, 0, 10000);
		map.addAttribute("type",tdProductCategoryService.findOne(id));
		map.addAttribute("goods_page", goods_page.getContent());


		return "/client/food_list";
	}
	
	@RequestMapping("/number/{count}/{typeId}")
	public String foodNumber(HttpServletRequest req, ModelMap map,@PathVariable int count ,@PathVariable Long typeId)
	{
		TdParameter parameter =  TdParameterService.findOne(1L);
		
		String parameterValue = parameter.getValueList();
		
		String[] strings =  parameterValue.split(",");
		
		map.addAttribute("people_number",strings);
		if (count == -1)
		{
			Page<TdGoods> goods_page = tdGoodsService.findByCategoryIdAndIsOnSaleTrue(typeId, 0, 10000);
			map.addAttribute("choosed_number", -1);
			map.addAttribute("type",tdProductCategoryService.findOne(typeId));
			map.addAttribute("goods_page", goods_page.getContent());
			return "/client/food_list";
		}
		String number = strings[count];
		map.addAttribute("choosed_number", count + 1);
		map.addAttribute("type",tdProductCategoryService.findOne(typeId));
		
		map.addAttribute("goods_page",tdGoodsService.findByCategoryIdAndParamValueCollectContainingAndIsOnSaleTrueOrderByIdDesc(typeId,number));
		
		
		return "/client/food_list";
	}
	/**
	 * 套餐详情
	 * @return
	 */
	@RequestMapping("/showdishes")
	public String dishesDetail(ModelMap map,Long goodId,HttpServletRequest req)
	{
		String username = (String) req.getSession().getAttribute("username");

		if (username == null)
		{
			username =req.getSession().getId();
		}
		List<TdCartGoods> cartSessionGoodsList = tdCartGoodsService.findByUsername(req.getSession().getId());
		if (null == username)
		{
			username = req.getSession().getId();
		}
		else
		{
			// 合并商品
			// 已登录用户的购物车
			List<TdCartGoods> cartUserGoodsList = tdCartGoodsService
					.findByUsername(username);
			for (TdCartGoods cg : cartSessionGoodsList)
			{
				// 将未登录用户的购物车加入已登录用户购物车中
				cg.setUsername(username);
				cartUserGoodsList.add(cg);
			}

			cartUserGoodsList = tdCartGoodsService.save(cartUserGoodsList);

			for (TdCartGoods cg1 : cartUserGoodsList) 
			{
				// 删除重复的商品
				List<TdCartGoods> findList = tdCartGoodsService.findByGoodsIdAndUsername(cg1.getGoodsId(), username);

				if (null != findList && findList.size() > 1) 
				{
					tdCartGoodsService.delete(findList.subList(1,findList.size()));
				}
			}
		}
		List<TdCartGoods> resList = tdCartGoodsService.findByUsername(username);
		map.addAttribute("cart_good_number",resList.size());
		map.addAttribute("good", tdGoodsService.findOne(goodId));
		return "/client/dishes_detail";
	}

	/**
	 * 进入购买
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("/buy")
	public String buy(ModelMap map,Long id)
	{
		map.addAttribute("good", tdGoodsService.findOne(id));
		return "/client/submit_order";
	}
	
	/**
	 * 购买详细页
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("/buydetail")
	public String buyDetail(ModelMap map,Long id)
	{
		map.addAttribute("good", tdGoodsService.findOne(id));
		return "/client/submit_detail";
	}
	
	/**
	 * 地址等信息
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("/user/information")
	public String userinformation(ModelMap map,Long id)
	{
		map.addAttribute("good", tdGoodsService.findOne(id));
		return "/client/submit_userinformation";
	}

	 @RequestMapping("/pay")
	 public String ordershowpay(ModelMap map)
	 {
		 return "/client/pay_order";
	 }
	
}
