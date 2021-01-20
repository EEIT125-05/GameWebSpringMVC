package com.web.game.mall.shop;

import com.web.game.mall.model.MallBean;

public class CartItem {

//	private int MallID;
	private int qtyOrdered;
	private MallBean mallbean;
	
	public  CartItem() {

	}

//	public CartItem(int MallID, int qtyOrdered) {
//		this.MallID = MallID;
//		this.qtyOrdered = qtyOrdered;
//	}

//	public int getMallID() {
//		return MallID;
//	}
//
//	public void setMallID(int mallID) {
//		MallID = mallID;
//	}

	public int getQtyOrdered() {
		return qtyOrdered;
	}

	public CartItem(int qtyOrdered, MallBean mallbean) {
	super();
	this.qtyOrdered = qtyOrdered;
	this.mallbean = mallbean;
}

	public MallBean getMallbean() {
		return mallbean;
	}

	public void setMallbean(MallBean mallbean) {
		this.mallbean = mallbean;
	}

	public void setQtyOrdered(int qtyOrdered) {
		this.qtyOrdered = qtyOrdered;
	}

	public String getName() {
		return mallbean.getName();
	}

	public float getPrice() {
		return mallbean.getMoney();
	}

}
