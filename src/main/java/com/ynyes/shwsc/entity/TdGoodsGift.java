package com.ynyes.shwsc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 赠品
 * 
 * @author Sharon
 *
 */

@Entity
public class TdGoodsGift {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    // 菜品名称
	@Column
	private String goodsId;
	
	// 菜品描述
	@Column
	private String goodsTitle;
	
	// 赠品价格
	@Column
	private String goodsPrice;
	
	// 赠品缩略图
	@Column
	private String coverImageUri;
	
	// 排序号
	@Column
	private Long sortId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }


    public String getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getCoverImageUri() {
        return coverImageUri;
    }

    public void setCoverImageUri(String coverImageUri) {
        this.coverImageUri = coverImageUri;
    }

    public Long getSortId() {
        return sortId;
    }

    public void setSortId(Long sortId) {
        this.sortId = sortId;
    }
}
