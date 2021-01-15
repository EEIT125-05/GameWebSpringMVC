package com.web.game.contest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recordDetail")
public class RecordDetailBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private Integer iContestNo;
	private Integer iGroupNo;
	private Integer iRematchVsNo;//複賽的場次,不是複賽的編號
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sPlayer1;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sPlayer2;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sWin;
	
	public RecordDetailBean() {
		super();
	}

	public RecordDetailBean(Integer iNo, Integer iContestNo, Integer iGroupNo, Integer iRematchVsNo, String sPlayer1,
			String sPlayer2, String sWin) {
		super();
		this.iNo = iNo;
		this.iContestNo = iContestNo;
		this.iGroupNo = iGroupNo;
		this.iRematchVsNo = iRematchVsNo;
		this.sPlayer1 = sPlayer1;
		this.sPlayer2 = sPlayer2;
		this.sWin = sWin;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public Integer getiContestNo() {
		return iContestNo;
	}

	public void setiContestNo(Integer iContestNo) {
		this.iContestNo = iContestNo;
	}

	public Integer getiGroupNo() {
		return iGroupNo;
	}

	public void setiGroupNo(Integer iGroupNo) {
		this.iGroupNo = iGroupNo;
	}

	public Integer getiRematchVsNo() {
		return iRematchVsNo;
	}

	public void setiRematchVsNo(Integer iRematchVsNo) {
		this.iRematchVsNo = iRematchVsNo;
	}

	public String getsPlayer1() {
		return sPlayer1;
	}

	public void setsPlayer1(String sPlayer1) {
		this.sPlayer1 = sPlayer1;
	}

	public String getsPlayer2() {
		return sPlayer2;
	}

	public void setsPlayer2(String sPlayer2) {
		this.sPlayer2 = sPlayer2;
	}

	public String getsWin() {
		return sWin;
	}

	public void setsWin(String sWin) {
		this.sWin = sWin;
	}
	
}
