package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.domain.ServiceCenterDTO;
import com.spring.recopay.service.ServiceCenterService;

@Controller
@RequestMapping("/servicecenter")
public class ServiceCenterController {
	private ServiceCenterService cs;
	
	@Autowired
	public void setCs(ServiceCenterService cs) {
		this.cs = cs;
	}
	
	public ServiceCenterController() {}
	
	@RequestMapping("")
	public String servicecenterHome(HttpServletRequest request) {
			
		return "servicecenter/servicecenter";
	}
	
	@RequestMapping("/servicecenter")
	public String servicecenter(HttpServletRequest request) {
		
		return "servicecenter/servicecenter";
	}
	
	@RequestMapping("/faq")
	public String faq(HttpServletRequest request) {
		
		return "servicecenter/faq";
	}
	
	@GetMapping("/view")
	public String viewByUid(HttpServletRequest request, int N_uid, Model model) {
		model.addAttribute("list", cs.viewByUid(N_uid));
		return "servicecenter/view";
	}
	
	@RequestMapping("/notice")
	public String notice(HttpServletRequest request, Model model) {
		model.addAttribute("list", cs.viewlist());
		return "servicecenter/notice";
	}
	
	@RequestMapping("/update")
	public String update(int uid, Model model, ServiceCenterDTO dto) {	
		model.addAttribute("list", cs.viewByUid(uid));
		return "servicecenter/update";
	}
	
	@PostMapping("/updateOk")
	public String updateOk(ServiceCenterDTO dto, Model model) {
		model.addAttribute("result", cs.update(dto));
		return "servicecenter/updateOk";
	}
	
	@RequestMapping("/question")
	public String question(HttpServletRequest request) {
		
		return "servicecenter/question";
	}
	@RequestMapping("/write")
	public String write(HttpServletRequest request) {
		
		return "servicecenter/write";
	}
	
	@RequestMapping("/writeOk")
	public String writeOk(HttpServletRequest request, ServiceCenterDTO dto, Model model) {
		model.addAttribute("result", cs.write(dto));
		return "servicecenter/writeOk";
	}
	
	@GetMapping("/deleteOk")
	public String deleteOk(HttpServletRequest request, int uid, Model model) {
		model.addAttribute("result", cs.deleteByUid(uid));
		return "servicecenter/deleteOk";
	}
	
}