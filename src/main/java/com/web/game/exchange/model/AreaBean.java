package com.web.game.exchange.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="AreaList")
public class AreaBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer iNo;
	String sArea;
	

	public AreaBean() {
		super();
	}
	
	public AreaBean(Integer iNo, String sArea) {
		super();
		this.iNo = iNo;
		this.sArea = sArea;
	}
	public Integer getiNo() {
		return iNo;
	}
	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	public String getsArea() {
		return sArea;
	}
	public void setsArea(String sArea) {
		this.sArea = sArea;
	}

}
