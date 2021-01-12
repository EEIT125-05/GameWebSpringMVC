package com.web.game.contest.model;

import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "contest")
public class ContestBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	@Column(columnDefinition = "nvarchar(50)")
	private String sName;
	@Column(columnDefinition = "nvarchar(50)")
	private String sGame;
	private Date dSignStart;
	private Date dSignEnd;
	@Column(columnDefinition = "datetime2(0)")
	private Timestamp tTime;
	@Column(columnDefinition = "nvarchar(100)")
	private String sLocation;
	private Integer iPeople;
	@Column(columnDefinition = "nvarchar(50)")
	private String sHost;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sRule;
	private String sImage;
	@JsonIgnore
	private Blob bRematchImage;
	@JsonIgnore
	private Blob bPreliminariesImage;
	
	@OneToMany(mappedBy = "cContestBean",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<ParticipateBean> lParticipateBeans = new ArrayList<>();
	
	@Transient
	private MultipartFile fImage;

	public ContestBean() {
		super();
	}
	
	public ContestBean(Integer iNo, String sName, String sGame, Date dSignStart, Date dSignEnd, Timestamp tTime,
			String sLocation, Integer iPeople, String sHost, String sRule, String sImage) {
		super();
		this.iNo = iNo;
		this.sName = sName;
		this.sGame = sGame;
		this.dSignStart = dSignStart;
		this.dSignEnd = dSignEnd;
		this.tTime = tTime;
		this.sLocation = sLocation;
		this.iPeople = iPeople;
		this.sHost = sHost;
		this.sRule = sRule;
		this.sImage = sImage;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsGame() {
		return sGame;
	}

	public void setsGame(String sGame) {
		this.sGame = sGame;
	}

	public Date getdSignStart() {
		return dSignStart;
	}

	public void setdSignStart(Date dSignStart) {
		this.dSignStart = dSignStart;
	}

	public Date getdSignEnd() {
		return dSignEnd;
	}

	public void setdSignEnd(Date dSignEnd) {
		this.dSignEnd = dSignEnd;
	}

	public Timestamp gettTime() {
		return tTime;
	}

	public void settTime(Timestamp tTime) {
		this.tTime = tTime;
	}

	public String getsLocation() {
		return sLocation;
	}

	public void setsLocation(String sLocation) {
		this.sLocation = sLocation;
	}

	public Integer getiPeople() {
		return iPeople;
	}

	public void setiPeople(Integer iPeople) {
		this.iPeople = iPeople;
	}

	public String getsHost() {
		return sHost;
	}

	public void setsHost(String sHost) {
		this.sHost = sHost;
	}

	public String getsRule() {
		return sRule;
	}

	public void setsRule(String sRule) {
		this.sRule = sRule;
	}
	
	public String getsImage() {
		return sImage;
	}

	public void setsImage(String sImage) {
		this.sImage = sImage;
	}

	public List<ParticipateBean> getlParticipateBeans() {
		return lParticipateBeans;
	}

	public void setlParticipateBeans(List<ParticipateBean> lParticipateBeans) {
		this.lParticipateBeans = lParticipateBeans;
	}

	public MultipartFile getfImage() {
		return fImage;
	}

	public void setfImage(MultipartFile fImage) {
		this.fImage = fImage;
	}

	public Blob getbRematchImage() {
		return bRematchImage;
	}

	public void setbRematchImage(Blob bRematchImage) {
		this.bRematchImage = bRematchImage;
	}

	public Blob getbPreliminariesImage() {
		return bPreliminariesImage;
	}

	public void setbPreliminariesImage(Blob bPreliminariesImage) {
		this.bPreliminariesImage = bPreliminariesImage;
	}
	
	
}
