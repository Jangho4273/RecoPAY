package com.spring.recopay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.recopay.domain.PerformDTO;
import com.spring.recopay.domain.ReservationDTO;
import com.spring.recopay.domain.TheaterSeatDTO;
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
	
	@RequestMapping("/schedule")
	public String schedule(HttpServletRequest request) {
		return "reservation/schedule";
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
		List<PerformDTO> dto = rs.viewByUid(uid);

		model.addAttribute("seatlist", ts.getBookedSeatsByNameAndTime(prfTime,dto.get(0).getFcltynm()));
		
		return "reservation/selectseat";
	}
	
	@RequestMapping("/buying")
	@Transactional
	public String buyingTicket(HttpServletRequest request,ReservationDTO dto) {

		
		int result = rs.insertBuyingTicket(dto);
		
		String[] seatList = dto.getSeat().split(", ");
		
		for(int i=0; i<seatList.length; i++) {
			ts.insertSeat(seatList[i], dto.getTheaterName(), "asdqwd" ,dto.getPrfdate());
		}
		
		if(result > 0) {
			return "reservation/reservationOk";
		} else {
			return "reservation/reservationFail";
		}
	}
	
	// 영화관 정보 출력 
	@RequestMapping("/reservation/{uid}")
	public String reservationPerform(@PathVariable int uid, Model model) {
		model.addAttribute("list", rs.viewByUid(uid));
		model.addAttribute("uid", uid);
		
		model.addAttribute("location",ts.getMapCordXY(uid));
		
		//남은 좌석 수의 list 가져오기 
//		List<TheaterSeatDTO> dto = ts.getLeftSeat(uid);
//		System.out.println(dto.get(0).getTotalSeat());
//		if(dto.size() == 0 ) {
//			
//		} else {
//			model.addAttribute("leftseatArr", ts.getLeftSeat(uid));
//		}
		
		
//		List<PerformDTO> dto = rs.list();
//		
//		for (PerformDTO e : dto) {
//			if(e.getUid() == uid) {
//				model.addAttribute("leftseat" , ts.getLeftSeat(e.getFcltynm(), e.getRunday()));
//			}
//		}
		
		
		//String name = (String) model.getAttribute("name");
		//model.addAttribute("map", ts.getMapCordXY(name));
		return "reservation/reservationPerform";
	}
	
	@RequestMapping("/ticketCheck")
	public String ticketCheck(HttpServletRequest request) {

		return "reservation/ticketCheck";
	}
}
