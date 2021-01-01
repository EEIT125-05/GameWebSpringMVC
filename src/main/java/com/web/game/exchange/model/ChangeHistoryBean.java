package com.web.game.exchange.model;


import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.web.game.member.model.MemberBean;

@Entity
@Table(name="ChangeHistory_Table")
public class ChangeHistoryBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private Timestamp date;
	private Integer status;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_partyA")
	private MemberBean partyA;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_gamebean_id")
	private SupportGameBean gamebean;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_partyB")
	private MemberBean partyB;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_mygamebean_id")
	private MyGameBean mygamebean;
	
	
	public ChangeHistoryBean() {
		super();
	}
	
	public ChangeHistoryBean(Integer no, MemberBean partyA, SupportGameBean gamebean, MemberBean partyB,
			MyGameBean mygamebean, Timestamp date, Integer status) {
		super();
		this.no = no;
		this.partyA = partyA;
		this.gamebean = gamebean;
		this.partyB = partyB;
		this.mygamebean = mygamebean;
		this.date = date;
		this.status = status;
	}
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public MemberBean getPartyA() {
		return partyA;
	}
	public void setPartyA(MemberBean partyA) {
		this.partyA = partyA;
	}
	public SupportGameBean getGamebean() {
		return gamebean;
	}
	public void setGamebean(SupportGameBean gamebean) {
		this.gamebean = gamebean;
	}
	public MemberBean getPartyB() {
		return partyB;
	}
	public void setPartyB(MemberBean partyB) {
		this.partyB = partyB;
	}
	public MyGameBean getDemandgamebean() {
		return mygamebean;
	}
	public void setDemandgamebean(MyGameBean demandgamebean) {
		this.mygamebean = demandgamebean;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
