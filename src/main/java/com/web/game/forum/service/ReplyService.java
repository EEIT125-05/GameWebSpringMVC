package com.web.game.forum.service;

import java.util.List;

import com.web.game.forum.model.ReplyBean;

public interface ReplyService {
	
	public Boolean insertReply(ReplyBean rReplyBean);
	
	public ReplyBean newBean(String sText, Integer iForumNo);
	
	List<ReplyBean> selectForumReply(Integer iForumNo);
	
	ReplyBean selectOneReply(Integer iNo);

}
