package com.web.game.forum.dao;

import java.util.List;

import com.web.game.forum.model.ReplyBean;

public interface ReplyDAO {
	
	public Boolean insertReply(ReplyBean rReplyBean);
	
	public Boolean updateReply(ReplyBean rReplyBean);
	
	public Boolean deleteReply(ReplyBean rReplyBean);
	
	public List<ReplyBean> selectForumReply(Integer iForumNo);

	public ReplyBean selectOneReply(Integer iNo);
}
