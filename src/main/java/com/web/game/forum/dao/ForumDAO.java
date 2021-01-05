package com.web.game.forum.dao;

import java.util.List;

import com.web.game.forum.model.ForumBean;

public interface ForumDAO {
	
	public Boolean insertOrUpdateForum(ForumBean fForumBean);

	public Boolean deleteForum(ForumBean fForumBean);
	
	public Boolean updateForum(ForumBean fForumBean);
	
	public ForumBean selectOneForum(Integer iNo);
	
	public List<ForumBean> selectUserForum(String user);

	public List<ForumBean> selectAllForum();
	
	public List<ForumBean> searchForum(String sCategory, String sSearch, Integer scrollInt);

}
