package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("")
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
	public String performGenre(HttpServletRequest request) {
		return "perform/genre";
	}
	
	@RequestMapping("/review")
	public String performReview(HttpServletRequest request) {
		return "perform/review";
	}
	
	
}
