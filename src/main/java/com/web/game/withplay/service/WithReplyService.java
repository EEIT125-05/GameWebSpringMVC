package com.web.game.withplay.service;


import com.web.game.withplay.model.WithPlay;
import com.web.game.withplay.model.WithReplyBean;

public interface WithReplyService {
	
	public Boolean insertReply(WithReplyBean rReplyBean);
	
	public WithReplyBean newBean(String sText, WithPlay WithBean);
	
	Boolean delete(Integer iId);

	public WithReplyBean selectOneReply(Integer iNo);

	public Boolean deleteReply(WithReplyBean rReplyBean);

	public Boolean updateReply(WithReplyBean rReplyBean);

}
