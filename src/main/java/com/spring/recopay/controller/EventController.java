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
		model.addAttribute("list", es.selectAllListOrderedByRemaindayAsc());
		return "event/eventlist";
	}
	
	
}
