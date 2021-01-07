package com.web.game.forum.service;

import com.web.game.forum.model.ChildReplyBean;
import com.web.game.forum.model.ReplyBean;

public interface ChildReplyService {
	
	public Boolean insertChildReply(ChildReplyBean cChildReplyBean);
	
	public ChildReplyBean newBean(String sText,ReplyBean rReplyBean);

}
