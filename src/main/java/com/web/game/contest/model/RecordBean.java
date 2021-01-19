package com.web.game.contest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "record")
public class RecordBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private Integer iContestNo;
	@Column(columnDefinition = "nvarchar(10)")
	private String sType;//預賽複賽
	private Integer iGroundNo;
	private Integer iKnockoutNo;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sPlayers1;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sPlayers2;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sWinner;
	
	public RecordBean() {
		super();
	}

	public RecordBean(Integer iNo, Integer iContestNo, String sType, Integer iGroundNo, Integer iKnockoutNo,
			String sPlayers1, String sPlayers2) {
		super();
		this.iNo = iNo;
		this.iContestNo = iContestNo;
		this.sType = sType;
		this.iGroundNo = iGroundNo;
		this.iKnockoutNo = iKnockoutNo;
		this.sPlayers1 = sPlayers1;
		this.sPlayers2 = sPlayers2;
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

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public Integer getiGroundNo() {
		return iGroundNo;
	}

	public void setiGroundNo(Integer iGroundNo) {
		this.iGroundNo = iGroundNo;
	}

	public Integer getiKnockoutNo() {
		return iKnockoutNo;
	}

	public void setiKnockoutNo(Integer iKnockoutNo) {
		this.iKnockoutNo = iKnockoutNo;
	}

	public String getsPlayers1() {
		return sPlayers1;
	}

	public void setsPlayers1(String sPlayers1) {
		this.sPlayers1 = sPlayers1;
	}

	public String getsPlayers2() {
		return sPlayers2;
	}

	public void setsPlayers2(String sPlayers2) {
		this.sPlayers2 = sPlayers2;
	}

	public String getsWinner() {
		return sWinner;
	}

	public void setsWinner(String sWinner) {
		this.sWinner = sWinner;
	}

}
