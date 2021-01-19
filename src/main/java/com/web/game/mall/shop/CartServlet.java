package com.web.game.mall.shop;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Formatter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.mall.model.MallBean;
import com.web.game.mall.service.MallserviceImpl;

/**
 * Servlet implementation class CartServlet
 */
//@WebServlet("/mall/CartServlet")
@Controller
@SessionAttributes({ "cart", "user" })
@RequestMapping("/mall")
public class CartServlet extends HttpServlet {
	
	@Autowired
	MallserviceImpl ms;

	@ModelAttribute
	public MallDB Init() {
		
		MallDB MallDB=ms.getMallDB();
		
		return MallDB;
		
	}

	@GetMapping("todo")
	public String todo(Model model, @RequestParam Integer todo, @RequestParam Integer qty) {
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		if (todo != null) {
//			CartItem newCartItem = new CartItem(Integer.parseInt(request.getParameter("todo")),
//					Integer.parseInt(request.getParameter("qty")));
			CartItem newCartItem = new CartItem(todo,qty);
			System.out.println("#############");
			if (theCart == null) { // shopping cart is empty
				System.out.println("!!!!!!!!!!!!!!!");
				theCart = new ArrayList<>();
				theCart.add(newCartItem);
				model.addAttribute("cart", theCart);
			} else {
				boolean found = false;
				System.out.println("!88888888888888!!!");
				Iterator iter = theCart.iterator();
				while (!found && iter.hasNext()) {/////////////
					CartItem aCartItem = (CartItem) iter.next();
//					System.out.println("!666666666666!!!");
//					System.out.println(aCartItem.getMallID());
//					System.out.println(newCartItem.getMallID());
					if (aCartItem.getMallID() == newCartItem.getMallID()) {
						System.out.println("????????????");
						aCartItem.setQtyOrdered(aCartItem.getQtyOrdered() + newCartItem.getQtyOrdered());
						found = true;
					}
					System.out.println("!555555555555555555555");
				}
				
				if (!found) { // Add it to the cart
					System.out.println("!444444444444444!");
					theCart.add(newCartItem);
				}
			}

		}
		System.out.println("7777777777777");
		return "/mall/MallCart";
	}

	
	@GetMapping("/todoadd")
	public String todoadd(Model model,@RequestParam Integer todo) {
		model.addAttribute("todo",todo);
		return "/mall/MallAddCart";
		
	}
	
	@GetMapping("/gotoMyshop")
	public String gotoMyshop() {
		return "/mall/MallCart";
	}
	
	
	
	@GetMapping("/gotoshop")
	public String gothshop() {
		return "/mall/MallMainPage";
	}
	
	
	
	@GetMapping("/minipage")
	public String minipage() {
		return "//mall/MallMainPage";
	}

	@GetMapping("todocart")
	public String todocart(Model model, @RequestParam String todocart, @RequestParam(value="cartIndex",required = false) Integer cartIndex) {
		List<CartItem> theCart = (ArrayList<CartItem>) model.getAttribute("cart");
		if (todocart.equals("remove")) {

			theCart.remove(cartIndex);
			return "/mall/MallCart";

		} else if (todocart.equals("checkout")) {

			float totalPrice = 0;
			Integer totalQtyOrdered = 0;
			for (CartItem item : theCart) {
				float price = item.getPrice();
				int qtyOrdered = item.getQtyOrdered();
				totalPrice += price * qtyOrdered; // 總價
				totalQtyOrdered += qtyOrdered; // 數量
			}
			StringBuilder sb = new StringBuilder();
			Formatter formatter = new Formatter(sb); // Send all output to sb
			formatter.format("%.2f", totalPrice); // 2 decimal places
			model.addAttribute("totalPrice", sb.toString());
			model.addAttribute("totalQtyOrdered", totalQtyOrdered + "");
//		         List<CartItem> theCart = (List<CartItem>) session.getAttribute("cart");
			 System.out.println("1111111111");
			model.getAttribute("user");
			MallBean member = new MallBean();
//		         String account = member.getAccount();//整合時代入insertDeal
			String account = "test";// 未帶入會員帳號前測試用
			ms.insertDeal(theCart, account);
			 System.out.println("222222");
	}return "/mall/MallCheckOut";
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
