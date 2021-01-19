package com.web.game.mall.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.mall.model.MallBean;
import com.web.game.mall.service.MallserviceImpl;

@Controller
@RequestMapping("/mall")
@SessionAttributes("reg_student")
public class MallController {

	@Autowired
	MallserviceImpl ms;

	@GetMapping("/Index")
	public String index() {
		return "mall/MallMainPage";
	}
	@GetMapping("/Inquire")
	public String Inquire() {
		return "/mall/MallInquire_All";
	}
	@GetMapping("/New")
	public String New() {
		return "/mall/MallInsert_new";
	}
	@GetMapping("/Delete")
	public String Delete() {
		return "/mall/MallDelete";
	}
	@GetMapping("/MallDL")
	public String DL() {
		System.out.println("8888888888888");
		return "/mall/MallDL";
	}
	@GetMapping("/Test")
	public String test() {
		System.out.println("8888888888888");
		return "/mall/MallDL";
	}
	@GetMapping("/Addshop")
	public String Addshop() {
		System.out.println("8888888888888");
		return "/mall/MallCart";
	}
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static final String CHARSET_CODE = "UTF-8";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);

		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);

//		if (request.getParameter("callreturn") != null) {
//			Updateshop(request, response);// Update

//		} else if (request.getParameter("strike") != null) {
//			deleteMall(request, response);
//		} else if (request.getParameter("updateto") != null) {
//			request.getParameter("search");
//			System.out.println(request.getParameter("search"));
//			searchMall(request, response);
//		} else if (request.getParameter("submit") != null) {
//			InsertMall(request, response);
//		} else if (request.getParameter("confirm") != null) {
//			ConfirmProcess(request, response);
//		} else {
//			System.out.println("zero");
//		}
//
	}
//更改資料 確認後更改 資料庫可查
	@GetMapping("/update2")
	public String Updateshop(Model model,

			@RequestParam String name, @RequestParam String type, @RequestParam Integer no, @RequestParam String host,
			@RequestParam String number, @RequestParam String level, @RequestParam Float money,
			@RequestParam String pay, @RequestParam String deilvery, @RequestParam String size,
			@RequestParam String origin, @RequestParam String item, @RequestParam String contentment) {

		MallBean reg_student = new MallBean(no, name, type, host, number, level, money, pay, deilvery, size, origin,
				item, contentment);
		model.addAttribute("reg_student", reg_student);

		ms.UpdateStudent(reg_student);
		return "/mall/MallInquire_All_Update";
	}
////新增資料
	@GetMapping("/new")
	public String InsertMall(Model model,

			@RequestParam String name, @RequestParam String type, @RequestParam Integer no, @RequestParam String host,
			@RequestParam String number, @RequestParam String level, @RequestParam Float money,
			@RequestParam String pay, @RequestParam String deilvery, @RequestParam String size,
			@RequestParam String origin, @RequestParam String item, @RequestParam String contentment) {// 新增

		MallBean reg_student = new MallBean(no, name, type, host, number, level, money, pay, deilvery, size, origin,
				item, contentment);
		System.out.println("111111111");
		model.addAttribute("reg_student", reg_student);
		return "/mall/MallInsert_check";

	}
////更改資料顯示頁面跳謝謝頁面
	@GetMapping("/update1")
	public String searchMall(Model model, @RequestParam Integer search) {
		System.out.println(search);

		MallBean good = ms.getMall(search);
		System.out.println(good);
		
		model.addAttribute("good", good);
		return"/mall/MallInquire_All_check" ;
//"mall/MallInquire_All_check"
	}

//    新增確認後跳謝謝頁面
	@GetMapping("/new_check")
	public String ConfirmProcess(Model model ) {

		MallBean studentData = (MallBean) model.getAttribute("reg_student");
		ms.insertStudent(studentData);
		
		return "mall/MallMainPage";

	}
//刪除資料後 顯示以刪除的資訊
	@GetMapping("/delete")
	public String deleteMall(Model model, @RequestParam Integer no) {// 刪除
		ms.deleteMall(no);
		return "mall/MallMainPage";
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
