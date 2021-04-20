package com.spring.recopay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.service.PerformService;

@Controller
@RequestMapping("/perform")
public class PerformController {
	private PerformService ps;
	
	@Autowired
	public void setPs(PerformService ps) {
		this.ps = ps;
	}

	public PerformController() {}
	
	@GetMapping("")
	public String performHome(Model model) {
		model.addAttribute("list", ps.list());
		return "perform/intro";
	}
	
	@RequestMapping("/intro")
	public String performIntro(Model model) {
		model.addAttribute("list", ps.list());
		return "perform/intro";
	}
	
	@RequestMapping("/intro/{uid}")
	public String performDetail(@PathVariable int uid, Model model) {
		model.addAttribute("list", ps.viewByUid(uid));
		return "perform/detail";
	}
	
	@RequestMapping("/genre")
	public String performGenre(Model model) {
		String userid = currentUserName();
		model.addAttribute("list", ps.recByUser(userid));
		return "perform/genre";
	}
	
	// REST 게시판 작성
	@RequestMapping(value = "/rest") 
	public String rest() {
		return "perform/rest";
	}
	
	public static String currentUserName() { 
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal(); 
		return user.getUsername(); 
	}
	
	

	
	
}
