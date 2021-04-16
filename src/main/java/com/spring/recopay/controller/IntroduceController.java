package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.service.ReservationService;

@Controller
@RequestMapping("/introduce")
public class IntroduceController {


	public IntroduceController() {}
	
	@RequestMapping("")
	public String introduceHome(HttpServletRequest request) {

		return "introduce/homeintro";
	}
	
	
	@RequestMapping("/introduce")
	public String introduce(HttpServletRequest request) {
		
		return "introduce/introduce";
	}
	
	
	@RequestMapping("/chart")
	public String chart(HttpServletRequest request) {
		
		return "introduce/chart";
	}
	
	
	@RequestMapping("/homeintro")
	public String homeintro(HttpServletRequest request) {
		
		return "introduce/homeintro";
	}
	
}
