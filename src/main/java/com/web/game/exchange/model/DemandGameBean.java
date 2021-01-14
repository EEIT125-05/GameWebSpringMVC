package com.web.game.exchange.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="GameDemand_Table")
public class DemandGameBean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private String gamename;
	private String console;
	private String area;
	private Timestamp date;
	private String gamer;
	private String image; //對照gamename系統直接給路徑
	private String remark; 
	private Integer status;
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="FK_mygamebean")
	private MyGameBean mygamename;
	
	public MyGameBean getMygamename() {
		return mygamename;
	}

	public void setMygamename(MyGameBean mygamename) {
		this.mygamename = mygamename;
	}

	public DemandGameBean() {
		super();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public DemandGameBean(Integer no, String gamename, String console, String area, Timestamp date, String gamer,
			String image, String remark, Integer status) {
		super();
		this.no = no;
		this.gamename = gamename;
		this.console = console;
		this.area = area;
		this.date = date;
		this.gamer = gamer;
		this.image = image;
		this.remark = remark;
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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getGamer() {
		return gamer;
	}

	public void setGamer(String gamer) {
		this.gamer = gamer;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
