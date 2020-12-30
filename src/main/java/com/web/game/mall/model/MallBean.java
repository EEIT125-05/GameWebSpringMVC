package com.web.game.mall.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MalllistTable")
public class MallBean implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private String name;
	private String type;
	private String host;
	private String number;
	private String level;
	private Float money;
	private String pay;
	private String deilvery;
	private String size;
	private String origin;
	private String item;
	private String contentment;

	public MallBean() {
		super();
	}

	public MallBean(Integer no, String name, String type, String host, String number, String level, Float money,
			String pay, String deilvery, String size, String origin, String item, String contentment) {
		super();
		this.no = no;
		this.name = name;
		this.type = type;
		this.host = host;
		this.number = number;
		this.level = level;
		this.money = money;
		this.pay = pay;
		this.deilvery = deilvery;
		this.size = size;
		this.origin = origin;
		this.item = item;
		this.contentment = contentment;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getDeilvery() {
		return deilvery;
	}

	public void setDeilvery(String deilvery) {
		this.deilvery = deilvery;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getContentment() {
		return contentment;
	}

	public void setContentment(String contentment) {
		this.contentment = contentment;
	}

}