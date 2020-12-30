package com.web.game.contest.dao.impl;

import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.game.contest.dao.ContestDAO;
import com.web.game.contest.model.ContestBean;

@Repository
public class ContestDAOImpl implements ContestDAO {
	
	@Autowired
	SessionFactory factory;

	@Override
	public Boolean insertOrUpdateContest(ContestBean cContestBean) {
		Session session = factory.getCurrentSession();
		try {
			session.saveOrUpdate(cContestBean);
			//先sava再拿到pk值,再存檔案名稱

			String sImage ="contest-" + cContestBean.getiNo() + "-" + UUID.randomUUID().toString().replaceAll("-", "");
			String ext = FilenameUtils.getExtension(cContestBean.getfImage().getOriginalFilename());
			System.out.println("fImage.getOriginalFilename(): " + cContestBean.getfImage().getOriginalFilename());

//			System.out.println("進資料庫的sImage: " + sImage + "." + ext);
			//永續物件特性,直接存
			cContestBean.setsImage(sImage + "." + ext);
			
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public Boolean deleteContest(ContestBean cContestBean) {
		Session session = factory.getCurrentSession();
		try {
			session.delete(cContestBean);			
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Boolean updateContest(ContestBean cContestBean) {
		System.out.println("進cdao");
		Session session = factory.getCurrentSession();
		try {
			System.out.println("CONTESTbENA: " + cContestBean);
			session.update(cContestBean);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public ContestBean selectOneContest(Integer iNo) {
		String hql = "from ContestBean where iNo = :iNo";
		Session session = factory.getCurrentSession();
		return (ContestBean)session.createQuery(hql).setParameter("iNo", iNo).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContestBean> selectUserContest(String user) {
		String hql = "from ContestBean where sHost = :user";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("user", user).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContestBean> selectAllContest() {
		String hql = "from ContestBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				.setMaxResults(4)
				.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ContestBean> selectPageContest(Integer pageNo) {
		String hql = "from ContestBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				.setFirstResult((pageNo-1)*2)
				.setMaxResults(2)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ContestBean> searchContests(String sSearch, String sGame, String sSignDate, Integer scrollInt) {
		String hql = "from ContestBean where sName like '%" + sSearch + "%' and sGame like '%" + sGame + "%'" + sSignDate ;
		System.out.println(hql);
		Session session = factory.getCurrentSession();
		return session.createQuery(hql)
				.setFirstResult(scrollInt*4)
				.setMaxResults(4)
				.getResultList();
	}
	
	@Override
	public Integer getTotalPages() {
		String hql = "select count(*) FROM ContestBean";
		Session session = factory.getCurrentSession();
		return (Integer)session.createQuery(hql).getSingleResult();
	}

}
