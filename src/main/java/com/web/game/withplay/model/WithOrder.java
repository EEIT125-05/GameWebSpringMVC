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
	@JoinColumn(name="MPlay")
	private MemberBean Member;
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="Play")
	private WithPlay With;
	
	
	public WithOrder() {
		super();
	}
	public WithOrder(Integer iNo, Date dDate, Time tTime, Integer iStatus, Integer iPrice,String sGame,
			MemberBean MemberBean,WithPlay withPlay) {
		super();
		this.iNo = iNo;
		this.dDate = dDate;
		this.tTime = tTime;
		this.iStatus = iStatus;
		this.iPrice = iPrice;
		this.sGame = sGame;
		this.Member = MemberBean;
		With = withPlay;
	}
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
	
	public Integer getiStatus() {
		return iStatus;
	}
	public void setiStatus(Integer iStatus) {
		this.iStatus = iStatus;
	}
	public MemberBean getMember() {
		return Member;
	}
	public void setMember(MemberBean member) {
		Member = member;
	}
	public WithPlay getWith() {
		return With;
	}
	public void setWith(WithPlay with) {
		With = with;
	}
	

		
}
