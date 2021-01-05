package com.web.game.withplay.dao;

import com.web.game.withplay.model.WithReplyBean;

public interface WithReplyDAO {
	
	public Boolean insertReply(WithReplyBean rReplyBean);
	
	Boolean delete(Integer iId);


}
