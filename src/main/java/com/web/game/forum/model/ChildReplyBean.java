package com.web.game.forum.model;

import java.sql.Date;
import java.sql.Time;

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
@Table(name = "childReply")
public class ChildReplyBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	private String sAuthor;
	private Date dDate;
	private Time tTime;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String sText;
	
	@ManyToOne
	@JoinColumn(name = "iParentNo")
	@JsonIgnore
	private ReplyBean rReplyBean;

	public ChildReplyBean() {
		super();
	}
	
	public ChildReplyBean(Integer iNo, String sAuthor, Date dDate, Time tTime, String sText, ReplyBean rReplyBean) {
		super();
		this.iNo = iNo;
		this.sAuthor = sAuthor;
		this.dDate = dDate;
		this.tTime = tTime;
		this.sText = sText;
		this.rReplyBean = rReplyBean;
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

}
