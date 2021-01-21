package com.web.game.mall.model;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="BusinessHistoryTable")
public class BusinessHistory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer iNO;
    private String sAccount;
    private Timestamp tTime;
    private String fMoney;
    
    @OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="fk_cartid",referencedColumnName = "iNo")
	private Set<BusinessDetail> item =new LinkedHashSet<BusinessDetail>();
    
    
	public BusinessHistory() {
		super();
	}
	
	
	
	public BusinessHistory(Integer iNO, String sAccount, Timestamp tTime, Set<BusinessDetail> item,String sMoney) {
		super();
		this.iNO = iNO;
		this.sAccount = sAccount;
		this.tTime = tTime;
		this.item = item;
		this.fMoney=sMoney;
	}


	public String getfMoney() {
		return fMoney;
	}



	public void setfMoney(String fMoney) {
		this.fMoney = fMoney;
	}



	public Integer getiNO() {
		return iNO;
	}
	public void setiNO(Integer iNO) {
		this.iNO = iNO;
	}
	public String getsAccount() {
		return sAccount;
	}
	public void setsAccount(String sAccount) {
		this.sAccount = sAccount;
	}
	public Timestamp gettTime() {
		return tTime;
	}
	public void settTime(Timestamp tTime) {
		this.tTime = tTime;
	}

	public Set<BusinessDetail> getItem() {
		return item;
	}

	public void setItem(Set<BusinessDetail> item) {
		this.item = item;
	}
    
    
	
}
