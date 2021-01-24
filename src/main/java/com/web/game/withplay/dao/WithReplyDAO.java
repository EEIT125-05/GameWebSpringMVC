package com.web.game.withplay.dao;

import com.web.game.forum.model.ReplyBean;
import com.web.game.withplay.model.WithReplyBean;

public interface WithReplyDAO {
	
	public Boolean insertReply(WithReplyBean rReplyBean);
	
	Boolean delete(Integer iId);

	public WithReplyBean selectOneReply(Integer iNo);

	public Boolean deleteReply(WithReplyBean rReplyBean);
	
	public Boolean updateReply(WithReplyBean rReplyBean);

}
