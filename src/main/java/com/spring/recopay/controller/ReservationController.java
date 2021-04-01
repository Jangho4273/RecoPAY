package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	public ReservationController() {}
	
	@RequestMapping("")
	public String reservationHome(HttpServletRequest request) {

		return "reservation/reservation";
	}
	
	@RequestMapping("/reservation")
	public String reservation(HttpServletRequest request) {

		return "reservation/reservation";
	}
	
	@RequestMapping("/schedule")
	public String schedule(HttpServletRequest request) {

		 
		return "reservation/schedule";
	}
	
	@RequestMapping("/ticketCheck")
	public String ticketCheck(HttpServletRequest request) {

		return "reservation/ticketCheck";
	}
}
