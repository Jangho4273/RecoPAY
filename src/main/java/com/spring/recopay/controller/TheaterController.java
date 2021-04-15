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
	
	@RequestMapping("/map")
	public String theaterMap(HttpServletRequest request) {
		return "theater/map_theater";
	}
	
	@RequestMapping("/list")
	public String theaterList(HttpServletRequest request, Model model) {
		model.addAttribute("list",ts.select());
		return "theater/list_theater";
	}
	
	@RequestMapping("/view/{id}")
	public String theaterViewerByName(HttpServletRequest request, @PathVariable String id, Model model) {
		model.addAttribute("list", ts.viewById(id));
		return "/theater/view_theater_info";
	}
	

}
