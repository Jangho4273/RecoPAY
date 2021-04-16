package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	private ReservationService rs;
	
	@Autowired
	public void setRs(ReservationService rs) {
		this.rs = rs;
	}

	public ReservationController() {}
	
	@RequestMapping("")
	public String reservationHome(Model model) {
		model.addAttribute("list", rs.list());
		return "reservation/select";
	}
	
	@RequestMapping("/select")
	public String select(Model model) {
		model.addAttribute("list", rs.list());
		return "reservation/select";
	}
	
	@RequestMapping("/reservation")
	public String reservation(Model model) {
		model.addAttribute("list", rs.list());
		return "reservation/reservation";
	}
	
	@RequestMapping("/reservation/{uid}")
	public String reservationPerform(@PathVariable int uid, Model model) {
		model.addAttribute("list", rs.viewByUid(uid));
		return "reservation/reservationPerform";
	}
	
	@RequestMapping("/ticketCheck")
	public String ticketCheck(HttpServletRequest request) {

		return "reservation/ticketCheck";
	}
}
