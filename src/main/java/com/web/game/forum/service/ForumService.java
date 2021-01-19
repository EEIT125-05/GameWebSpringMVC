package com.web.game.forum.service;

import java.util.List;

import com.web.game.forum.model.ForumBean;

public interface ForumService {

	public Boolean insertOrUpdateForum(ForumBean fForumBean);

	public void deleteForum(Integer iNo);
//	public Boolean deleteForum(ForumBean fForumBean);
	
	public Boolean updateForum(ForumBean fForumBean);
	
	public ForumBean selectOneForum(Integer iNo);
	
	public List<ForumBean> selectUserForum(String user);

	public List<ForumBean> selectAllForum();
	
	public List<ForumBean> searchForum(String sCategory, String sSearch, Integer scrollInt);
	
	public List<Object[]> searchHotForums(String sCategory, String sSearch, String sHot, Integer scrollInt);
	
	public void setTime(ForumBean fForumBean);
}
