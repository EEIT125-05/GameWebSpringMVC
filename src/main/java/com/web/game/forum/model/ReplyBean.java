package com.web.game.forum.model;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "reply")
public class ReplyBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private String sAuthor;
	private Date dDate;
	private Time tTime;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sText;
    private Integer iParentId;
	
	@ManyToOne
	@JoinColumn(name = "iForumNo")
	@JsonIgnore
	private ForumBean fForumBean;
	
	@OneToMany
    @JoinColumn(name="iParentId")
    private List<ReplyBean> lReplyBeans = new ArrayList<>();
	
	public ReplyBean() {
		super();
	}
	
	public ReplyBean(Integer iNo, String sAuthor, Date dDate, Time tTime, String sText, ForumBean fForumBean, Integer iParentId) {
		super();
		this.iNo = iNo;
		this.sAuthor = sAuthor;
		this.dDate = dDate;
		this.tTime = tTime;
		this.sText = sText;
		this.fForumBean = fForumBean;
		this.iParentId = iParentId;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsAuthor() {
		return sAuthor;
	}

	public void setsAuthor(String sAuthor) {
		this.sAuthor = sAuthor;
	}

	public Date getdDate() {
		return dDate;
	}

	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}

	public Time gettTime() {
		return tTime;
	}

	public void settTime(Time tTime) {
		this.tTime = tTime;
	}

	public String getsText() {
		return sText;
	}

	public void setsText(String sText) {
		this.sText = sText;
	}

	public Integer getiParentId() {
		return iParentId;
	}

	public void setiParentId(Integer iParentId) {
		this.iParentId = iParentId;
	}

	public List<ReplyBean> getlReplyBeans() {
		return lReplyBeans;
	}

	public void setlReplyBeans(List<ReplyBean> lReplyBeans) {
		this.lReplyBeans = lReplyBeans;
	}
	
	

}
