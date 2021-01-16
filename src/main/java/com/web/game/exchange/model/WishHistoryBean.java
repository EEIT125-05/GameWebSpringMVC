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
@Table(name="WishHistory_Table")
public class WishHistoryBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private Timestamp date;
	private Integer status;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_partyA")
	private MemberBean partyA;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_demandgamebean_id")
	private DemandGameBean demandgamebean;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_partyB")
	private MemberBean partyB;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_mygamebean_id")
	private MyGameBean mygamebean;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
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
	public MemberBean getPartyA() {
		return partyA;
	}
	public void setPartyA(MemberBean partyA) {
		this.partyA = partyA;
	}
	public DemandGameBean getDemandgamebean() {
		return demandgamebean;
	}
	public void setDemandgamebean(DemandGameBean demandgamebean) {
		this.demandgamebean = demandgamebean;
	}
	public MemberBean getPartyB() {
		return partyB;
	}
	public void setPartyB(MemberBean partyB) {
		this.partyB = partyB;
	}
	public MyGameBean getMygamebean() {
		return mygamebean;
	}
	public void setMygamebean(MyGameBean mygamebean) {
		this.mygamebean = mygamebean;
	}
	public WishHistoryBean(Integer no, Timestamp date, Integer status, MemberBean partyA, DemandGameBean demandgamebean,
			MemberBean partyB, MyGameBean mygamebean) {
		super();
		this.no = no;
		this.date = date;
		this.status = status;
		this.partyA = partyA;
		this.demandgamebean = demandgamebean;
		this.partyB = partyB;
		this.mygamebean = mygamebean;
	}
	public WishHistoryBean() {
		super();
	}
	
	
}
