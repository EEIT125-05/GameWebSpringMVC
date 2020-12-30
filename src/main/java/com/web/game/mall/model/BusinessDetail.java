package com.web.game.mall.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "BusinessDetailTable")
public class BusinessDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private String sCartName;
	private Integer iQty;
	private Float iPrice;

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsCartName() {
		return sCartName;
	}

	public void setsCartName(String sCartName) {
		this.sCartName = sCartName;
	}

	public Integer getiQty() {
		return iQty;
	}

	public void setiQty(Integer iQty) {
		this.iQty = iQty;
	}

	public Float getiPrice() {
		return iPrice;
	}

	public void setiPrice(Float iPrice) {
		this.iPrice = iPrice;
	}

	public BusinessDetail(Integer iNo, String sCartName, Integer iQty, Float iPrice) {
		super();
		this.iNo = iNo;
		this.sCartName = sCartName;
		this.iQty = iQty;
		this.iPrice = iPrice;
	}

	public BusinessDetail() {
		super();
	}

}
