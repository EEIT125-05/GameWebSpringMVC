package com.web.game.exchange.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="GameSupport_Table")
public class SupportGameBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private String gamename;
	private Integer qty;
	private String gamelocation;
	private String delivery;
	private String console;
	private String gamer;
	private String dlc;
	private String remark;
	private String condition;
	private String image;
	private Timestamp date;
	private Integer status;
	@OneToOne(mappedBy = "supportgamebean")
	@JsonIgnore
	private ChangeHistoryBean changehistorybean;
	@OneToOne(mappedBy = "supportgamebean")
	@JsonIgnore
	private MyGameBean mygamebean;
	
	public MyGameBean getMygamebean() {
		return mygamebean;
	}

	public void setMygamebean(MyGameBean mygamebean) {
		this.mygamebean = mygamebean;
	}

	public ChangeHistoryBean getChangehistorybean() {
		return changehistorybean;
	}

	public void setChangehistorybean(ChangeHistoryBean changehistorybean) {
		this.changehistorybean = changehistorybean;
	}
	
	
	
	public SupportGameBean() {
		super();
	}

	public SupportGameBean(Integer no, String gamename, Integer qty, String gamelocation, String delivery,
			String console, String gamer, String dlc, String remark, String condition, String image, Timestamp date,
			Integer status) {
		super();
		this.no = no;
		this.gamename = gamename;
		this.qty = qty;
		this.gamelocation = gamelocation;
		this.delivery = delivery;
		this.console = console;
		this.gamer = gamer;
		this.dlc = dlc;
		this.remark = remark;
		this.condition = condition;
		this.image = image;
		this.date = date;
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

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public String getGamelocation() {
		return gamelocation;
	}

	public void setGamelocation(String gamelocation) {
		this.gamelocation = gamelocation;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
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

	public String getDlc() {
		return dlc;
	}

	public void setDlc(String dlc) {
		this.dlc = dlc;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
