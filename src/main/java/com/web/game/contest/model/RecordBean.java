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
	private Integer iGroupNo;
//	private Integer iGroupMemberNo;
	private Integer iRematchNo;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sPlayers;
	private Integer iWinCount;
	
	public RecordBean() {
		super();
	}

	public RecordBean(Integer iNo, Integer iContestNo, Integer iGroupNo,
			Integer iRematchNo, String sPlayers, Integer iWinCount) {
		
		this.iNo = iNo;
		this.iContestNo = iContestNo;
		this.iGroupNo = iGroupNo;
//		this.iGroupMemberNo = iGroupMemberNo;
		this.iRematchNo = iRematchNo;
		this.sPlayers = sPlayers;
		this.iWinCount = iWinCount;
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

//	public Integer getiGroupMemberNo() {
//		return iGroupMemberNo;
//	}
//
//	public void setiGroupMemberNo(Integer iGroupMemberNo) {
//		this.iGroupMemberNo = iGroupMemberNo;
//	}

	public Integer getiRematchNo() {
		return iRematchNo;
	}

	public void setiRematchNo(Integer iRematchNo) {
		this.iRematchNo = iRematchNo;
	}

	public String getsPlayers() {
		return sPlayers;
	}

	public void setsPlayers(String sPlayers) {
		this.sPlayers = sPlayers;
	}

	public Integer getiWinCount() {
		return iWinCount;
	}

	public void setiWinCount(Integer iWinCount) {
		this.iWinCount = iWinCount;
	}
	
}
