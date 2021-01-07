package com.web.game.forum.model;

import java.sql.Date;
import java.sql.Time;
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
	private Integer iForumNo;
	
//	@ManyToOne
//	@JoinColumn(name = "iForumNo")
//	@JsonIgnore
//	private ForumBean fForumBean;
	
	@OneToMany(mappedBy = "rReplyBean", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<ChildReplyBean> lChildReplyBeans = new ArrayList<>();
	
	public ReplyBean() {
		super();
	}
	
	public ReplyBean(Integer iNo, String sAuthor, Date dDate, Time tTime, String sText, Integer iForumNo) {
		super();
		this.iNo = iNo;
		this.sAuthor = sAuthor;
		this.dDate = dDate;
		this.tTime = tTime;
		this.sText = sText;
		this.iForumNo = iForumNo;
//		this.fForumBean = fForumBean;
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

	public List<ChildReplyBean> getlChildReplyBeans() {
		return lChildReplyBeans;
	}

	public void setlChildReplyBeans(List<ChildReplyBean> lChildReplyBeans) {
		this.lChildReplyBeans = lChildReplyBeans;
	}

	public Integer getiForumNo() {
		return iForumNo;
	}

	public void setiForumNo(Integer iForumNo) {
		this.iForumNo = iForumNo;
	}
	
}
