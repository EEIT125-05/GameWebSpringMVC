
package com.web.game.withplay.model;

import java.sql.Blob;
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
import javax.persistence.UniqueConstraint;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name = "WithPlay", uniqueConstraints = {@UniqueConstraint(columnNames = "sNickname") ,@UniqueConstraint(columnNames = "sAccount")})
public class WithPlay {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer iId;

	
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	private String sName;
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	private String sNickname;
	@Column(columnDefinition="VARCHAR(7) NOT NULL")
	private String sGender;
	@Column(columnDefinition="VARCHAR(12) NOT NULL")
	private String sIdcode;
	@Column(columnDefinition="VARCHAR(MAX) NOT NULL")
	private String sGame;
	@Column(columnDefinition="VARCHAR(MAX) NOT NULL")
	private String sComment;
	private Integer iPrice;	
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	private String sAccount;
	private Integer iCount;
	private Integer iStatus;
	public Integer getiStatus() {
		return iStatus;
	}

	public void setiStatus(Integer iStatus) {
		this.iStatus = iStatus;
	}

	@JsonIgnore
	Blob bImage;
	String sFileName;
	@Transient
	MultipartFile mWithImage;
	

	@OneToMany(mappedBy = "WithBean", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	public List<WithReplyBean> sReplyBeans = new ArrayList<>();
	

	
	public Blob getbImage() {
		return bImage;
	}

	public void setbImage(Blob bImage) {
		this.bImage = bImage;
	}

	public String getsFileName() {
		return sFileName;
	}

	public void setsFileName(String sFileName) {
		this.sFileName = sFileName;
	}

	public MultipartFile getmWithImage() {
		return mWithImage;
	}

	public void setmWithImage(MultipartFile mWithImage) {
		this.mWithImage = mWithImage;
	}

	public WithPlay() {
		super();
	}

	public Integer getiId() {
		return iId;
	}
	public void setiId(Integer iId) {
		this.iId = iId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsNickname() {
		return sNickname;
	}
	public void setsNickname(String sNickname) {
		this.sNickname = sNickname;
	}
	public String getsGender() {
		return sGender;
	}
	public void setsGender(String sGender) {
		this.sGender = sGender;
	}
	public String getsIdcode() {
		return sIdcode;
	}
	public void setsIdcode(String sIdcode) {
		this.sIdcode = sIdcode;
	}
	public String getsGame() {
		return sGame;
	}
	public void setsGame(String sGame) {
		this.sGame = sGame;
	}
	public String getsComment() {
		return sComment;
	}
	public void setsComment(String sComment) {
		this.sComment = sComment;
	}
	public Integer getiPrice() {
		return iPrice;
	}
	public void setiPrice(Integer iPrice) {
		this.iPrice = iPrice;
	}
	public String getsAccount() {
		return sAccount;
	}
	public void setsAccount(String sAccount) {
		this.sAccount = sAccount;
	}
	
	public List<WithReplyBean> getsReplyBeans() {
		return sReplyBeans;
	}

	public void setsReplyBeans(List<WithReplyBean> sReplyBeans) {
		this.sReplyBeans = sReplyBeans;
	}

	public WithPlay( String sName, String sNickname, String sGender, String sIdcode, String sGame,
			String sComment, Integer iPrice, String sAccount,Integer iCount,Integer iStatus) {
		super();
		this.sName = sName;
		this.sNickname = sNickname;
		this.sGender = sGender;
		this.sIdcode = sIdcode;
		this.sGame = sGame;
		this.sComment = sComment;
		this.iPrice = iPrice;
		this.sAccount = sAccount;
		this.iCount = iCount;
		this.iStatus = iStatus;
		
	}

	public Integer getiCount() {
		return iCount;
	}

	public void setiCount(Integer iCount) {
		this.iCount = iCount;
	}
	
	
 

	
}
