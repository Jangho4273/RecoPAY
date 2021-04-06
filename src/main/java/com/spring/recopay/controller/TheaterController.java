package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	@RequestMapping("/view")
	public String theaterViewer(HttpServletRequest request) {
		return "theater/view_theater_info";
	}
	
	@RequestMapping("/view/{fcltynm}")
	public String theaterViewerByName(@PathVariable String fcltynm, Model model) {
		model.addAttribute("fcltynm", fcltynm);
		return "/theater/view_theater_info";
	}
}
