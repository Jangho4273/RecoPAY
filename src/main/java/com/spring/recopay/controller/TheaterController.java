package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.service.TheaterService;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	private TheaterService ts;
	
	public TheaterController(TheaterService ts) {
		super();
		this.ts = ts;
	}

	@RequestMapping("/view")
	public String theaterViewer(HttpServletRequest request) {
		return "theater/view_theater_info";
	}
	
	@RequestMapping("/list")
	public String theaterList(HttpServletRequest request, Model model) {
		model.addAttribute("list",ts.select());
		return "theater/list_theater";
	}
	
	@RequestMapping("/view/{fcltynm}")
	public String theaterViewerByName(@PathVariable String fcltynm, Model model) {
		model.addAttribute("fcltynm", fcltynm);
		return "/theater/view_theater_info";
	}
}
