package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.spring.recopay.domain.MemberDTO;
import com.spring.recopay.service.MemberService;

@Controller
@RequestMapping("/login")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;
	

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@ResponseBody 
	@RequestMapping(value = "/loginCk/{username}") 
	public String checkSignup(@PathVariable String username, HttpServletRequest request, Model model) { 
		int rowcount = service.checkSignup(username); 
		return String.valueOf(rowcount); 
	}


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
	@RequestMapping(value ="/join", method = RequestMethod.POST)
	public String postRegister(@ModelAttribute MemberDTO memberDTO) throws Exception {
		logger.info("post resister");

		memberDTO.setPassword(bcryptPasswordEncoder.encode(memberDTO.getPassword()));

		service.register(memberDTO);

		return "login/login";

	}
	

//	@GetMapping("/member")
//	public void doMember() {
//		System.out.println("doMember() : access member only");
//		
//	}
//
//	@GetMapping("/admin")
//	public void doAdmin() {
//		System.out.println("doAdmin() : access admin only");
//	}

	@GetMapping("/login")
	public void loginInput(HttpServletRequest request, String error, String logout, Model model) {
		System.out.println("login page 입성");
		
		String uri = request.getHeader("Referer");
		if (!uri.contains("/login")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}
		
		
	}
	
	@PostMapping("/login")
	public void loginInput2(String error, String logout, HttpServletRequest request, Model model) {
		
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
	
//	@GetMapping("/kakaologin.do")
//	public String login(Model model) {
//		return "login/kakaologin";
//	}
//
//	@GetMapping("/kakaoOauth")
//	public String oauth(Model model) {
//		return "login/kakaoOauth";
//	}

	
	
	
	
}
