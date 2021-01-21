package com.web.game.mall.service;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.game.mall.dao.MallDAOImpl;
import com.web.game.mall.model.MallBean;
import com.web.game.mall.shop.CartItem;
import com.web.game.mall.shop.MallDB;
@Service
public class MallserviceImpl {

	@Autowired
	SessionFactory Factory;

	@Autowired
	MallDAOImpl dao;

	@Transactional
	public int deleteMall(Integer pno) {

		int count = 0;
		dao.deletemall(pno);
		count++;
		return count;

	}

	@Transactional
	public int UpdateStudent(MallBean mb) {

		int count = 0;
		dao.UpdateMall(mb);
		count++;
		return count;
	}

	@Transactional
	public int insertStudent(MallBean mb) {

		int count = 0;
		dao.insertMall(mb);
		count++;
		return count;
	}

	@Transactional
	public MallDB getMallDB() {

		MallDB md = null;
		md = dao.getMallDB();
		return md;
	}

	@Transactional
	public boolean insertDeal(List<CartItem> List, String account,String sbString) {

		boolean mm = false;
		mm = dao.insertDeal(List, account,sbString);
		return mm;
	}

	@Transactional
	public MallBean getMall(int no) {

		MallBean mb = null;
		mb = dao.getMall(no);
		return mb;
	}

}
