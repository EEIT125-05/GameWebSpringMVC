package com.web.game.contest.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "participate")
public class ParticipateBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	@Column(columnDefinition = "nvarchar(50)")
	private String sPlayer;
	@Column(columnDefinition = "nvarchar(50)")
	private String sGameId;
	
	@ManyToOne
	@JsonIgnore
	@JoinColumn( name = "contestNo")
	private ContestBean cContestBean;

	public ParticipateBean() {
		super();
	}
	
	public ParticipateBean(Integer iNo, String sPlayer, String sGameId, ContestBean cContestBean) {
		super();
		this.iNo = iNo;
		this.sPlayer = sPlayer;
		this.sGameId = sGameId;
		this.cContestBean = cContestBean;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsPlayer() {
		return sPlayer;
	}

	public void setsPlayer(String sPlayer) {
		this.sPlayer = sPlayer;
	}

	public String getsGameId() {
		return sGameId;
	}

	public void setsGameId(String sGameId) {
		this.sGameId = sGameId;
	}

	public ContestBean getcContestBean() {
		return cContestBean;
	}

	public void setcContestBean(ContestBean cContestBean) {
		this.cContestBean = cContestBean;
	}
	
	
	
	
}
