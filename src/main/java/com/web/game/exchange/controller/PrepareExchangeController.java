package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.DemandGameBean;
import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;

@Controller
//@SessionAttributes({"initOption"})
@SessionAttributes({"changepageparams","user","myGameBeans"})
@RequestMapping("/exchange")
public class PrepareExchangeController {

	@Autowired
	ExchangeService exchangeService;
	
	@GetMapping("/wishBoard")
	public String initWishBoard(Model model) {
		return "exchange/EXCWishBoard";
	}

	@GetMapping({"/preparehomepage","/Index"})
	public String addSupportFilter(Model model,
			@RequestParam(required = false) String str,
			@RequestParam(required = false) String condition,
			@RequestParam(required = false) Integer nowPage
			) {
		
//		MemberBean user = (MemberBean) model.getAttribute("user");
//		System.out.println("account"+user.getsAccount());
//		List<MyGameBean> myGameBeansOption = (List<MyGameBean>) service.getMemberGamesName(user.getsAccount());
//		System.out.println("list"+myGameBeansOption);
//		model.addAttribute("myGameBeans",myGameBeansOption);
		System.out.println("addSupportFilterIn");
		System.out.println("str"+str);
		System.out.println("condition"+condition);
		Integer page = 1;
		System.out.println("testNowPage"+nowPage);
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> sessionMap = new HashMap<String, Object>();
		Integer totalPage;
		if(nowPage != null) {
			System.out.println("nowPage!=null");
			sessionMap = (Map<String, Object>) model.getAttribute("sessionMap");
			totalPage = (Integer) sessionMap.get("totalPage");
			String sHQL = (String) sessionMap.get("str");
			list = exchangeService.changeSupportByFilter(nowPage);
		}else {
			System.out.println("nowPage=null");
			page=1;
			String sHql;
			if(condition.equals("all")) {
				sHql="";
			}else {
				sHql = "AND "+ condition+ " like '%" + str + "%'";
			}
			totalPage = exchangeService.getSupportPage(sessionMap)
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		int count=6;//每頁幾筆
		int p = 0;//共幾頁
		System.out.println("IndexIn");
		if (searchparams == null) {
			System.out.println("searchparams==null");
			list = exchangeService.changePage(page);
			if(list.size() % count ==0 ) {
				p=(list.size()/count);
			}else {
			p=(list.size()/count)+1;
			}
			search ="all";
		} else{
			System.out.println("searchparams!=null");
			System.out.println("searchparams" + searchparams);
			list = exchangeService.changePageByParam(page, search, searchparams);
			if(list.size() % count ==0 ) {
				p=(list.size()/count);
			}else {
			p=(list.size()/count)+1;
			}
		}
		model.addAttribute("searchparams", searchparams);
		model.addAttribute("changepageparams", searchparams);
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		model.addAttribute("p",p);
		System.out.println("page"+p);
		System.out.println("list"+list.size());

//		return "exchange/EXCHomePageGameList";
		return "exchange/testhomepage";
	}
	
	@GetMapping("/changepage")
	public @ResponseBody Map<String, Object> searchPage(
											Model model,
											@RequestParam(value="page",defaultValue = "1")Integer iPage,
										    @RequestParam(value="search",defaultValue = "all")String sSearch) {
		
		Map<String, Object> supportGame = new HashMap<String, Object>();
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		@SuppressWarnings("unchecked")
		List<MyGameBean> myGameBean = (List<MyGameBean>) model.getAttribute("myGameBeans");
		String sChangePageParams = (String) model.getAttribute("changepageparams");
		MemberBean mbUser = (MemberBean) model.getAttribute("user");
		System.out.println(mbUser.getsAccount());
		System.out.println("sSearch"+sSearch);
		System.out.println("iPage"+iPage);
		System.out.println("sChangePageParams"+sChangePageParams);
		System.out.println("user");
		if(sSearch.equals("all")) {
			list = exchangeService.changePage(iPage);
		}else {
			list = exchangeService.changePageByParam(iPage, sSearch, sChangePageParams);
		}
		supportGame.put("myGameBeans",myGameBean);
		supportGame.put("mbUser",mbUser);
		supportGame.put("searchparams", sChangePageParams);
		supportGame.put("search", sSearch);
		supportGame.put("list", list);
		System.out.println("size"+supportGame.size());
		
		return supportGame;
	}
	
	@ModelAttribute("myGamesBeans")
	public List<MyGameBean> getMemberGamesName(Model model){
		MemberBean user = (MemberBean) model.getAttribute("user");
		System.out.println("account"+user.getsAccount());
		List<MyGameBean> myGameBeansOption = (List<MyGameBean>) exchangeService.getMemberGamesName(user.getsAccount());
		System.out.println("list"+myGameBeansOption);
		return myGameBeansOption;
	}
	
	
}
