package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/servicecenter")
public class ServiceCenterController {
	
	public ServiceCenterController() {}
	
	@RequestMapping("")
	public String servicecenterHome(HttpServletRequest request) {
			
		return "servicecenter/servicecenter";
	}
	
	@RequestMapping("/servicecenter")
	public String servicecenter(HttpServletRequest request) {
		
		return "servicecenter/servicecenter";
	}
	
	@RequestMapping("/faq")
	public String faq(HttpServletRequest request) {
		
		return "servicecenter/faq";
	}
	
	@RequestMapping("/notice")
	public String notice(HttpServletRequest request) {
	
		return "servicecenter/notice";
	}
	
	@RequestMapping("/question")
	public String question(HttpServletRequest request) {
		
		return "servicecenter/question";
	}
}
