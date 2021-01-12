package com.web.game.member.dao.Impl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.NoResultException;
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
		System.out.println("成功儲存");
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
	
//	@Override
//	public MemberBean get(Integer id) {
//		return factory.getCurrentSession().get(Member.class, id);
//	}
	
	@Override
	public MemberBean get(String sAccount) {
		System.out.println("DAO的sAccount=" + sAccount);
		try {
			String hql = "FROM MemberBean WHERE sAccount = :sAccount";
			MemberBean SelectMB = ((Session) factory.getCurrentSession().createQuery(hql)).get(MemberBean.class, sAccount);
			System.out.println("有正常找到資料");
			return SelectMB;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("沒找到資料才會跑這裡");
		System.out.println("DAO找到的sAccount=" + sAccount);
		return null;
	}

	@Override
	public MemberBean Selectmember(String sAccount) {
		System.out.println("DAO的sAccount=" + sAccount);
		try {
			String hql = "FROM MemberBean WHERE sAccount = :sAccount";
			Session session = getSession();
			MemberBean SelectMB = (MemberBean) session.createQuery(hql).setParameter("sAccount", sAccount).getSingleResult();
			System.out.println("有正常找到資料");
			return SelectMB;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("沒找到資料才會跑這裡");
		System.out.println("DAO找到的sAccount=" + sAccount);
		return null;
	}

	@Override
	public String Checkmember(String sAccount) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE sAccount = :sAccount";
		String Account = "";
		try {
			MemberBean MB = (MemberBean) session.createQuery(hql).setParameter("sAccount", sAccount).getSingleResult();
			Account = MB.getsAccount();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
			Account = "Error: 資料庫異常，請檢查資料庫";
		}
		return Account;

	}

	@Override
	public String CheckEmail(String sEmail) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE sEmail = :sEmail";
		String Email = "";
		try {
			MemberBean MB = (MemberBean) session.createQuery(hql).setParameter("sEmail", sEmail).getSingleResult();
			Email = MB.getsAccount();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
			Email = "Error: 資料庫異常，請檢查資料庫";
		}
		return Email;
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

	@Override
	public String CheckPhone(String sPhone) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE sPhone = :sPhone";
		String Phone = "";
		try {
			MemberBean MB = (MemberBean) session.createQuery(hql).setParameter("sPhone", sPhone).getSingleResult();
			Phone = MB.getsAccount();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
			Phone = "Error: 資料庫異常，請檢查資料庫";
		}
		return Phone;
	}

	@Override
	public MemberBean queryMember(String sAccount) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean WHERE sAccount = :sAccount";
		@SuppressWarnings("unchecked")
		List<MemberBean> beans = (List<MemberBean>) session.createQuery(hql).setParameter("sAccount", sAccount)
				.getResultList();
		if (beans.size() > 0) {
			mb = beans.get(0);
		}
		return mb;

	}
}
