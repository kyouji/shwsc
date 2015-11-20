package com.ynyes.shwsc.controller.front;

import java.awt.MenuBar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.qrcode.decoder.Mode;
import com.ynyes.shwsc.entity.TdAdType;
import com.ynyes.shwsc.entity.TdGoods;
import com.ynyes.shwsc.entity.TdParameter;
import com.ynyes.shwsc.service.TdAdService;
import com.ynyes.shwsc.service.TdAdTypeService;
import com.ynyes.shwsc.service.TdGoodsService;
import com.ynyes.shwsc.service.TdParameterCategoryService;
import com.ynyes.shwsc.service.TdParameterService;
import com.ynyes.shwsc.service.TdProductCategoryService;

import scala.collection.generic.BitOperations.Int;

@Controller
@RequestMapping("/food")
public class TdFoodController 
{
	@Autowired
	private TdAdTypeService tdAdTypeService;
	
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
		return "client/food";
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


		return "/client/food_detail";
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
			return "/client/food_detail";
		}
		String number = strings[count];
		map.addAttribute("choosed_number", count + 1);
		map.addAttribute("type",tdProductCategoryService.findOne(typeId));
		
		map.addAttribute("goods_page",tdGoodsService.findByCategoryIdAndParamValueCollectContainingAndIsOnSaleTrueOrderByIdDesc(typeId,number));
		
		
		return "/client/food_detail";
	}
	/**
	 * 套餐详情
	 * @return
	 */
	@RequestMapping("/showdishes")
	public String dishesDetail(ModelMap map,Long goodId)
	{
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
