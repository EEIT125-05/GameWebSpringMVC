package com.web.game.exchange.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ConsoleList")
public class ConsoleBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer iNo;
	String sConsole;
	
	public ConsoleBean(Integer iNo, String sConsole) {
		super();
		this.iNo = iNo;
		this.sConsole = sConsole;
	}
	public ConsoleBean() {
		super();
	}
	
	public Integer getiNo() {
		return iNo;
	}
	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	public String getsConsole() {
		return sConsole;
	}
	public void setsConsole(String sConsole) {
		this.sConsole = sConsole;
	}
	
	
}
