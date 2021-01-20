package com.web.game.member.dao;

import java.util.List;
import com.web.game.member.model.MemberBean;

public interface MemberDao {

	Boolean InsertMember(MemberBean insertMB);
	
	Boolean DeleteMember(Integer iNo);
	
	Boolean UpdateMember(MemberBean UpdateMB);

	Boolean SigninMember(String sAccount, String sPassword);
	
	MemberBean Selectmember(String sAccount);

	List<MemberBean> getAllMembers();

	MemberBean get(Integer iNo);

	String Checkmember(String sAccount);

	String CheckEmail(String sEmail);

	String CheckPhone(String sPhone);

	MemberBean queryMember(String sAccount);

	MemberBean get(String sAccount);

	MemberBean SearchMail(String sEmail);

}