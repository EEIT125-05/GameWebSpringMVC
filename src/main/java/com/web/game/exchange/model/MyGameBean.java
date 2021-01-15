package com.web.game.exchange.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="MyGames_Table")
public class MyGameBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private String gamename;
	private String console;
	private String gamer;
	private Integer status;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_supportgamebean_id")
	@JsonIgnore
	private SupportGameBean supportgamebean;
	@OneToOne(mappedBy = "mygamebean")
	@JsonIgnore
	private ChangeHistoryBean changehistorybean;
	@OneToOne(mappedBy = "mygamebean")
	@JsonIgnore
	private WishHistoryBean wishhistorybean;
	@OneToOne(mappedBy = "mygamebean")
	@JsonIgnore
	private DemandGameBean demandgamebean;
	
	
	public WishHistoryBean getWishhistorybean() {
		return wishhistorybean;
	}

	public void setWishhistorybean(WishHistoryBean wishhistorybean) {
		this.wishhistorybean = wishhistorybean;
	}

	public DemandGameBean getDemandgamebean() {
		return demandgamebean;
	}

	public void setDemandgamebean(DemandGameBean demandgamebean) {
		this.demandgamebean = demandgamebean;
	}

	public ChangeHistoryBean getChangehistorybean() {
		return changehistorybean;
	}

	public void setChangehistorybean(ChangeHistoryBean changehistorybean) {
		this.changehistorybean = changehistorybean;
	}

	public SupportGameBean getSupportgamebean() {
		return supportgamebean;
	}

	public void setSupportgamebean(SupportGameBean supportgamebean) {
		this.supportgamebean = supportgamebean;
	}

	public MyGameBean() {
		super();
	}

	public MyGameBean(Integer no, String gamename, String console, String gamer, Integer status) {
		super();
		this.no = no;
		this.gamename = gamename;
		this.console = console;
		this.gamer = gamer;
		this.status = status;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getGamename() {
		return gamename;
	}

	public void setGamename(String gamename) {
		this.gamename = gamename;
	}

	public String getConsole() {
		return console;
	}

	public void setConsole(String console) {
		this.console = console;
	}

	public String getGamer() {
		return gamer;
	}

	public void setGamer(String gamer) {
		this.gamer = gamer;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
	
}
