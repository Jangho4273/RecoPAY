package com.spring.recopay;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.recopay.service.ReservationService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private ReservationService rs;
	
	@Autowired
	public void setRs(ReservationService rs) {
		this.rs = rs;
	}

	@RequestMapping(value = {"/", "/index"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String index(Model model) {
		model.addAttribute("list", rs.list());
		return "/index";
	}
	

	@RequestMapping("/theater")
	public String viewTheather(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "theater/view_theater_info";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "login";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}

	
}
