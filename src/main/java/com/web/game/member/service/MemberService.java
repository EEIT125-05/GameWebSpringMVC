package com.web.game.member.service;

import java.util.List;

import com.web.game.member.model.MemberBean;

public interface MemberService {
	
	Boolean InsertMember(MemberBean mMemberBean);
	
	Boolean DeleteMember(Integer iNo);
	
	Boolean UpdateMember(MemberBean UpdateMB);

	Boolean SigninMember(String sAccount, String sPassword);
	
	MemberBean Selectmember(String sAccount);

	List<MemberBean> getAllMembers();

	String Checkmember(String sAccount);

	String CheckEmail(String sEmail);

	String CheckPhone(String sPhone);
	
	MemberBean get(Integer iNo);
}
