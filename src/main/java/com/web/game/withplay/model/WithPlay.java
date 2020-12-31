
package com.web.game.withplay.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	Integer iId;

	
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	String sName;
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	String sNickname;
	@Column(columnDefinition="VARCHAR(7) NOT NULL")
	String sGender;
	@Column(columnDefinition="VARCHAR(12) NOT NULL")
	String sIdcode;
	@Column(columnDefinition="VARCHAR(MAX) NOT NULL")
	String sGame;
	@Column(columnDefinition="VARCHAR(MAX) NOT NULL")
	String sComment;
	Integer iPrice;	
	@Column(columnDefinition="VARCHAR(32) NOT NULL")
	String sAccount;
	@JsonIgnore
	Blob bImage;
	String sFileName;
	@Transient
	MultipartFile mWithImage;
	
	
	
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
	public WithPlay( String sName, String sNickname, String sGender, String sIdcode, String sGame,
			String sComment, Integer iPrice, String sAccount) {
		super();
		this.sName = sName;
		this.sNickname = sNickname;
		this.sGender = sGender;
		this.sIdcode = sIdcode;
		this.sGame = sGame;
		this.sComment = sComment;
		this.iPrice = iPrice;
		this.sAccount = sAccount;
	}


	
	
 

	
}
