package com.web.game.forum.service;

import com.web.game.forum.model.ForumBean;
import com.web.game.forum.model.ReplyBean;

public interface ReplyService {
	
	public Boolean insertReply(ReplyBean rReplyBean);
	
	public ReplyBean newBean(String sText, ForumBean fForumBean);

}
