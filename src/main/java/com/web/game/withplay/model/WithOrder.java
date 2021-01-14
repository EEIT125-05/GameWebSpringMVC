package com.web.game.withplay.model;


import java.sql.Date;
import java.sql.Time;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.web.game.member.model.MemberBean;

@Entity
public class WithOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private Date dDate;
	private Time tTime;
	private Integer iStatus;
	private Integer iPrice;
	private String sGame;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="MemberBean")
	private MemberBean MemberBean;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="WithPlay")
	private WithPlay WithPlay;
	
	
	public Integer getiNo() {
		return iNo;
	}
	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public Time gettTime() {
		return tTime;
	}
	public void settTime(Time tTime) {
		this.tTime = tTime;
	}
	
	public Integer getiPrice() {
		return iPrice;
	}
	public void setiPrice(Integer iPrice) {
		this.iPrice = iPrice;
	}
	public String getsGame() {
		return sGame;
	}
	public void setsGame(String sGame) {
		this.sGame = sGame;
	}
	public MemberBean getMemberBean() {
		return MemberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		MemberBean = memberBean;
	}
	public WithPlay getWithPlay() {
		return WithPlay;
	}
	public void setWithPlay(WithPlay withPlay) {
		WithPlay = withPlay;
	}
	public Integer getiStatus() {
		return iStatus;
	}
	public void setiStatus(Integer iStatus) {
		this.iStatus = iStatus;
	}

		
}
