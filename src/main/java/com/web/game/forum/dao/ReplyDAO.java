package com.web.game.forum.dao;

import java.util.List;

import com.web.game.forum.model.ReplyBean;

public interface ReplyDAO {
	
	public Boolean insertReply(ReplyBean rReplyBean);
	
	List<ReplyBean> selectForumReply(Integer iForumNo);

	ReplyBean selectOneReply(Integer iNo);
}
