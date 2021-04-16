package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.recopay.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	private EventService es;
	
	
	public EventController() { }

	@Autowired
	public void setEs(EventService es) {
		this.es = es;
	}

	@RequestMapping("/list")
	public String theaterMap(HttpServletRequest request, Model model) {
		es.setIsfinish(); // List 출력 마다 isfinish 값 (이벤트가 끝난지 아닌지 ) check 
		model.addAttribute("list", es.selectAllListOrderedByRemaindayAsc());
		model.addAttribute("table",es.countIsfinished());
		return "event/eventlist";
	}
	
	@RequestMapping("/test")
	public String test(HttpServletRequest request) {
		return "reservation/selectseat";
	}
	
}
