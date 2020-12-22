package com.web.game.exchange.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ConditionList")
public class ConditionBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer iNo;
	String sCondition;
	
	public ConditionBean() {
		super();
	}
	public ConditionBean(Integer iNo, String sCondition) {
		super();
		this.iNo = iNo;
		this.sCondition = sCondition;
	}
	
	public Integer getiNo() {
		return iNo;
	}
	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	public String getsCondition() {
		return sCondition;
	}
	public void setsCondition(String sCondition) {
		this.sCondition = sCondition;
	}

	
}
