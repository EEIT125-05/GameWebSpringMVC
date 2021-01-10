package com.web.game.forum.service;

import java.util.List;

import com.web.game.forum.model.ReplyBean;

public interface ReplyService {
	
	public Boolean insertReply(ReplyBean rReplyBean);
	
	public Boolean updateReply(ReplyBean rReplyBean);
	
	public Boolean deleteReply(ReplyBean rReplyBean);
	
	public ReplyBean newBean(String sText, Integer iForumNo);
	
	public List<ReplyBean> selectForumReply(Integer iForumNo);
	
	public ReplyBean selectOneReply(Integer iNo);

}
