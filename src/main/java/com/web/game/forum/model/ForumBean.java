package com.web.game.forum.model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "forum")
@Component
public class ForumBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	@Column(columnDefinition = "nvarchar(10)")
	private String sCategory;
	@Column(columnDefinition = "nvarchar(50)")
	private String sAuthor;
	private Date dDate;
	private Time tTime;
	@Column(columnDefinition = "nvarchar(100)")
	private String sTitle;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sText;
	
//	@OneToMany(mappedBy = "fForumBean", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
//	public List<ReplyBean> sReplyBeans = new ArrayList<>();
	
	public ForumBean() {
		super();
	}
	
	public ForumBean(Integer iNo, String sCategory, String sAuthor, Date dDate, Time tTime, String sTitle, String sText) {
		super();
		this.iNo = iNo;
		this.sCategory = sCategory;
		this.sAuthor = sAuthor;
		this.dDate = dDate;
		this.tTime = tTime;
		this.sTitle = sTitle;
		this.sText = sText;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	
	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
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

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsText() {
		return sText;
	}

	public void setsText(String sText) {
		this.sText = sText;
	}

//	public List<ReplyBean> getsReplyBeans() {
//		return sReplyBeans;
//	}
//
//	public void setsReplyBeans(List<ReplyBean> sReplyBeans) {
//		this.sReplyBeans = sReplyBeans;
//	}

}
