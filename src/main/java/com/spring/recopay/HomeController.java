package com.spring.recopay;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@GetMapping(value = {"/", "/index"})
	public String index(HttpServletRequest request) {
	    logger.debug("###INDEX PAGE###");
	    String rtnPage = "index";
	    String ipAddress = request.getHeader("X-FORWARDED-FOR");
	    if (ipAddress == null) {
	        ipAddress = request.getRemoteAddr();
	    }
	    logger.info(ipAddress + " : " + rtnPage);
	    return rtnPage;
	}
		
	@RequestMapping("/blog")
	public String blog(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "blog";
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
	
	@RequestMapping("/albums-store")
	public String albums_store(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "albums-store";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}
	
	@RequestMapping("/contact")
	public String contact(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "contact";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}
	
	@RequestMapping("/elements")
	public String elements(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "elements";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}
	
	@RequestMapping("/event")
	public String event(HttpServletRequest request) {
		logger.debug("###INDEX PAGE###");
		String rtnPage = "event";
		String ipAddress = request.getHeader("X-FORWARDED-FOR");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}
		logger.info(ipAddress + " : " + rtnPage);
		return rtnPage;
	}
	
	
}
