package com.web.game.mall.shop;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




public class MallDB {

	private static Float[] prices;
	private static String[] name;

	public static void setPrices(Float[] price) {
		MallDB.prices = price;
	}

	public static void setName(String[] name) {
		MallDB.name = name;
	}

	public static int size() {
		return prices.length;
	}

	public static float getPrices(int iCno) {
		return prices[iCno - 1];
	}

	public static String getName(int iCno) {
		return name[iCno - 1];
	}

}
