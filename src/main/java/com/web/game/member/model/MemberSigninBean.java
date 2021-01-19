package com.web.game.member.model;

public class MemberSigninBean {
	String sAccount; 
	String sPassword;
	boolean rememberMe;
	
	public MemberSigninBean() {
		super();
	}

	public MemberSigninBean(String sAccount, String sPassword, boolean rememberMe) {
		super();
		this.sAccount = sAccount;
		this.sPassword = sPassword;
		this.rememberMe = rememberMe;
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

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberSigninBean [sAccount=");
		builder.append(sAccount);
		builder.append(", sPassword=");
		builder.append(sPassword);
		builder.append(", rememberMe=");
		builder.append(rememberMe);
		builder.append("]");
		return builder.toString();
	}
	
}
