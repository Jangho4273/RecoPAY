package com.spring.recopay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.ReservationDTO;
import com.spring.recopay.service.ReservationService;
import com.spring.recopay.service.TheaterService;

@Controller
@RequestMapping("/reservation")

public class ReservationController {

	private ReservationService rs;
	private TheaterService ts;
	
	
	@Autowired
	public void setRs(ReservationService rs) {
		this.rs = rs;
	}
	
	@Autowired
	public void setTs(TheaterService ts) {
		this.ts = ts;
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
	
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		
		return "reservation/mypage";
	}
	
	
	@RequestMapping(value = "/selectseat", method = RequestMethod.POST)
	public String selectSeat(HttpServletRequest request,Model model) {
		
		// Post 값 받기 
		String prfTime = request.getParameter("prfTime");
		model.addAttribute("prfTime",prfTime);
		String prfPrice = request.getParameter("prfPrice");
		model.addAttribute("prfPrice",prfPrice);
		int uid = Integer.parseInt(request.getParameter("uid"));
		model.addAttribute("list", rs.viewByUid(uid));
		
		
		return "reservation/selectseat";
	}
	
	@RequestMapping("/buying")
	public String buyingTicket(HttpServletRequest request,ReservationDTO dto) {
		
		int result = rs.insertBuyingTicket(dto);
		System.out.println("결과 : " + result);
		
		
		if(result == 1) {
			return "reservation/reservationOk";
		} else {
			return "reservation/reservationFail";
		}
		
		
	}
	
	
	@RequestMapping("/reservation/{uid}")
	public String reservationPerform(@PathVariable int uid, Model model) {
		model.addAttribute("list", rs.viewByUid(uid));
		model.addAttribute("uid", uid);
		//String name = (String) model.getAttribute("name");
		//model.addAttribute("map", ts.getMapCordXY(name));
		return "reservation/reservationPerform";
	}
	
	@RequestMapping("/ticketCheck")
	public String ticketCheck(HttpServletRequest request) {

		return "reservation/ticketCheck";
	}
}
