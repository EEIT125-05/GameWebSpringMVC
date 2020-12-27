package com.web.game.member.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iNo;
	@Column(columnDefinition = "nvarchar(Max)",unique = true)
	private String sAccount;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sPassword;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sNickname;
	@Column(columnDefinition = "nvarchar(Max)",unique  = true)
	private String sEmail;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sEname;
	@Column(columnDefinition = "nvarchar(Max)",unique  = true)
	private String sPhone;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sAddress;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sGender;
	@Column(columnDefinition = "nvarchar(Max)")
	private String sBirthday;
	@Column(columnDefinition = "nvarchar(Max)")
	private String registerDate;

	public MemberBean() {
		super();
	}

	public MemberBean(Integer iNo, String sAccount, String sPassword, String sNickname, String sEmail, String sEname,
			String sPhone, String sAddress, String sGender, String sBirthday, String registerDate) {
		super();
		this.iNo = iNo;
		this.sAccount = sAccount;
		this.sPassword = sPassword;
		this.sNickname = sNickname;
		this.sEmail = sEmail;
		this.sEname = sEname;
		this.sPhone = sPhone;
		this.sAddress = sAddress;
		this.sGender = sGender;
		this.sBirthday = sBirthday;
		this.registerDate = registerDate;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getiNo() {
		return iNo;
	}

	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}

	public String getsAccount() {
		return sAccount;
	}

	public void setsAccount(String sAccount) {
		this.sAccount = sAccount;
	}

	public String getsPassword() {
		return sPassword;
	}

	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}

	public String getsNickname() {
		return sNickname;
	}

	public void setsNickname(String sNickname) {
		this.sNickname = sNickname;
	}

	public String getsEmail() {
		return sEmail;
	}

	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}

	public String getsEname() {
		return sEname;
	}

	public void setsEname(String sEname) {
		this.sEname = sEname;
	}

	public String getsPhone() {
		return sPhone;
	}

	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}

	public String getsAddress() {
		return sAddress;
	}

	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}

	public String getsGender() {
		return sGender;
	}

	public void setsGender(String sGender) {
		this.sGender = sGender;
	}

	public String getsBirthday() {
		return sBirthday;
	}

	public void setsBirthday(String sBirthday) {
		this.sBirthday = sBirthday;
	}

}
