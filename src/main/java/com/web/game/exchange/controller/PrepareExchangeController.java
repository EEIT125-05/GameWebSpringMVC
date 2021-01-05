package com.web.game.exchange.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.game.exchange.model.MyGameBean;
import com.web.game.exchange.model.SupportGameBean;
import com.web.game.exchange.service.ExchangeService;
import com.web.game.member.model.MemberBean;

@Controller
//@SessionAttributes({"initOption"})
@SessionAttributes({"changepageparams","user"})
@RequestMapping("/exchange")
public class PrepareExchangeController {

	@Autowired
	ExchangeService service;
	
	@GetMapping("/Index1")
	public String initExchange(Model model,
								@RequestParam Integer number) {
		System.out.println("/Index");
		System.out.println("id"+number);
		
		return "exchange/EXCHomePageGameList";
	}
	
	@GetMapping({"/preparehomepage","/Index"})
	public String search(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "search", defaultValue = "all") String search,
			@RequestParam(value = "searchparams", required = false) String searchparams) {
		
		MemberBean user = (MemberBean) model.getAttribute("user");
		System.out.println("account"+user.getsAccount());
		List<MyGameBean> myGameBeansOption = (List<MyGameBean>) service.getMemberGamesName(user.getsAccount());
		System.out.println("list"+myGameBeansOption);
		model.addAttribute("myGameBeans",myGameBeansOption);
		
		
		
		List<SupportGameBean> list = new ArrayList<SupportGameBean>();
		int count=9;//每頁幾筆
		int p = 0;//共幾頁
		System.out.println("IndexIn");
		if (searchparams == null) {
			System.out.println("searchparams==null");
			list = service.changepage(page);
			p=(list.size()/count)+1;
			search ="all";
		} else{
			System.out.println("searchparams!=null");
			System.out.println("searchparams" + searchparams);
			list = service.changePageByParam(page, search, searchparams);
			p=(list.size()/count)+1;
		}
		model.addAttribute("searchparams", searchparams);
		model.addAttribute("changepageparams", searchparams);
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		model.addAttribute("p",p);
		System.out.println("page"+p);

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
		String sChangePageParams = (String) model.getAttribute("changepageparams");
		System.out.println("sSearch"+sSearch);
		System.out.println("iPage"+iPage);
		System.out.println("sChangePageParams"+sChangePageParams);
		if(sSearch.equals("all")) {
			list = service.changepage(iPage);
		}else {
			list = service.changePageByParam(iPage, sSearch, sChangePageParams);
		}
		supportGame.put("searchparams", sChangePageParams);
		supportGame.put("search", sSearch);
		supportGame.put("list", list);
		System.out.println(list.size());
		
		return supportGame;
	}
	
}
