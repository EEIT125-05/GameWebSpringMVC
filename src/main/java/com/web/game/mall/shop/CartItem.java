package com.web.game.mall.shop;

public class CartItem {

	private int MallID;
	private int qtyOrdered;

	public void CartItem() {

	}

	public CartItem(int MallID, int qtyOrdered) {
		this.MallID = MallID;
		this.qtyOrdered = qtyOrdered;
	}

	public int getMallID() {
		return MallID;
	}

	public void setMallID(int mallID) {
		MallID = mallID;
	}

	public int getQtyOrdered() {
		return qtyOrdered;
	}

	public void setQtyOrdered(int qtyOrdered) {
		this.qtyOrdered = qtyOrdered;
	}

	public String getName() {
		return MallDB.getName(MallID);
	}

	public float getPrice() {
		return MallDB.getPrices(MallID);
	}

}
