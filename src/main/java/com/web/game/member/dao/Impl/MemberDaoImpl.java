package com.web.game.member.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.game.member.dao.MemberDao;
import com.web.game.member.model.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public Boolean InsertMember(MemberBean InsertMB) {
		Session session = getSession();
		session.save(InsertMB);
		return true;
	}

	@Override
	public Boolean DeleteMember(Integer iNo) {
		Session session = getSession();
		MemberBean DeleteMB = get(iNo);
		if (DeleteMB != null) {
			session.delete(DeleteMB);
		}
		return true;
	}

	@Override
	public Boolean UpdateMember(MemberBean UpdateMB) {
		Session session = getSession();
		session.update(UpdateMB);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean SigninMember(String sAccount, String sPassword) {
		String hql1 = "from MemberBean where sAccount= : sAccount";
		String hql2 = "from MemberBean where sAccount= : sAccount and sPassword=: sPassword";
		Session session = getSession();
		List<MemberBean> SigninAccount = session.createQuery(hql1).setParameter("sAccount", sAccount).getResultList();

		if (SigninAccount.size() > 0) {
			List<MemberBean> SigninPassword = session.createQuery(hql2).setParameter("sAccount", sAccount)
					.setParameter("sPassword", sPassword).getResultList();
			if (SigninPassword.size() > 0) {
				System.out.println("密碼正確");
				return true;
			} else {
				System.out.println("密碼錯誤");
				return false;
			}
		} else {
			System.out.println("帳號錯誤");
			return false;
		}
	}

	@Override
	public MemberBean Selectmember(String sAccount) {
		MemberBean SelectMB = null;
		String hql = "FROM MemberBean WHERE sAccount = :sAccount";
		Session session = getSession();
		SelectMB = (MemberBean) session.createQuery(hql).setParameter("sAccount", sAccount).getSingleResult();
		System.out.println(SelectMB);
		return SelectMB;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<MemberBean> getAllMembers() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		String hql = "FROM MemberBean";
		Session session = getSession();
		Query<MemberBean> query = session.createQuery(hql);
		list = query.getResultList();
		return list;
	}

	@Override
	public MemberBean get(Integer iNo) {
		return factory.getCurrentSession().get(MemberBean.class, iNo);
	}
}
