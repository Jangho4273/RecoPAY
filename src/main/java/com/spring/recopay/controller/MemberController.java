package com.spring.recopay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.recopay.domain.MemberDTO;
import com.spring.recopay.service.MemberService;

@Controller
@RequestMapping("/login")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	public void setService(MemberService service) {
		this.service = service;
	}

	// 회원가입 get
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postRegister(@ModelAttribute MemberDTO memberDTO) throws Exception {
		logger.info("post resister");

		memberDTO.setPassword(bcryptPasswordEncoder.encode(memberDTO.getPassword()));

		service.register(memberDTO);

		return "login/login";

	}

//	 //로그인
//	 @RequestMapping(value = "/login", method = RequestMethod.GET)
//	 public String login(MemberDTO memberDTO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
//	  logger.info("post login");
//	  
//	  HttpSession session = req.getSession();
//	  
//	  MemberDTO login = service.login(memberDTO);
//	  
//	  if(login == null) {
//	   session.setAttribute("member", null); 
//	   rttr.addFlashAttribute("msg", "loginError");
//	  } else {
//	   session.setAttribute("member", login);
//	  }
//	    
//	  return "indexLogin";
//	 }

//	 //logout
//	 @RequestMapping(value = "/indexLogin", method = RequestMethod.GET)
//	 public String logout(HttpSession session) throws Exception {
//	  logger.info("get logout");
//	  
//	  session.invalidate();
//	    
//	  return "index";
//	 }

	@GetMapping("/member")
	public void doMember() {
		System.out.println("doMember() : access member only");
		
	}

	@GetMapping("/admin")
	public void doAdmin() {
		System.out.println("doAdmin() : access admin only");
	}

	@GetMapping("/login")
	public void loginInput(String error, String logout, Model model) {
		System.out.println("login page 입성");
		
	}
	
	@PostMapping("/login")
	public void loginInput2(String error, String logout, Model model) {
		System.out.println("error: " + error);
		System.out.println("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "로그인 에러, 계정정보 확인해주삼");
		}

		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!");
		}
		
	}

	// 로그인 페이지 이동
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		System.out.println("access Denied : " + auth);
		model.addAttribute("msg", "접근 권한 거부");
	}
	
	//logout
	@GetMapping("/logout")
	public void logoutGET() {
		System.out.println("GET:logout");
	}
	
	@PostMapping("/logout")
	public void logoutPost() {
		System.out.println("POST:logout");
		
	}
	
	@GetMapping("/indexLogin")
	public void indexLogin() {
		System.out.println("POST:logout");
	}

//	@PostMapping("/loginCheck")
//	public String loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//
//		String username = request.getParameter("username");
//		
//		HttpSession session = request.getSession();
//		
//		session.setAttribute("memberId", username);
//		
//		return "index";
//	}
//	
//	@GetMapping("/logoutCheck")
//	public String logoutCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		
//		HttpSession session = request.getSession();
//		
//		session.invalidate();
//		
////		response.sendRedirect("index.jsp");
//		
//		return "index";
//		
//	}
	
	
	
	
}
