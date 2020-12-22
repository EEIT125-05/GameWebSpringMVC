//package com.web.game.exchange.model;
//
//import java.io.Serializable;
//import java.sql.Timestamp;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//@Entity
//@Table(name="GameDemand_Table")
//public class DemandGameBean implements Serializable{
//
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer no;
//	private String gamename;
//	private String console;
//	private String area;
//	private Timestamp date;
//	private String gamer;
//	private String account;
//	private String image; //對照gamename系統直接給路徑
//	
//	
//	public DemandGameBean(Integer no, String gamename, String console, Timestamp date, String gamer, String account) {
//		super();
//		this.no = no;
//		this.gamename = gamename;
//		this.console = console;
//		this.date = date;
//		this.gamer = gamer;
//		this.account = account;
//	}
//	
//	
//	public DemandGameBean() {
//		super();
//	}
//
//
//	public Integer getNo() {
//		return no;
//	}
//
//
//	public void setNo(Integer no) {
//		this.no = no;
//	}
//
//
//	public String getGamename() {
//		return gamename;
//	}
//
//
//	public void setGamename(String gamename) {
//		this.gamename = gamename;
//	}
//
//
//	public String getConsole() {
//		return console;
//	}
//
//
//	public void setConsole(String console) {
//		this.console = console;
//	}
//
//
//	public Timestamp getDate() {
//		return date;
//	}
//
//
//	public void setDate(Timestamp date) {
//		this.date = date;
//	}
//
//
//	public String getGamer() {
//		return gamer;
//	}
//
//
//	public void setGamer(String gamer) {
//		this.gamer = gamer;
//	}
//
//
//	public String getAccount() {
//		return account;
//	}
//
//
//	public void setAccount(String account) {
//		this.account = account;
//	}
//	
//	
//	
//	
//	
//	
//}
