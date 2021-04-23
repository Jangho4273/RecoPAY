package com.spring.recopay.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.recopay.domain.FaqDTO;
import com.spring.recopay.domain.QnaDTO;
import com.spring.recopay.domain.CommentDTO;
import com.spring.recopay.domain.ServiceCenterDTO;
import com.spring.recopay.service.FaqService;
import com.spring.recopay.service.QnaService;
import com.spring.recopay.service.CommentService;
import com.spring.recopay.service.ServiceCenterService;

@Controller
@RequestMapping("/servicecenter")
public class ServiceCenterController {
	private ServiceCenterService cs;
	private FaqService fs;
	private QnaService qs;
	private CommentService coms;
	
	
	@Autowired
	public void setCs(ServiceCenterService cs) {
		this.cs = cs;
	}
	
	@Autowired
	public void setfs(FaqService cs, FaqService fs) {
		this.fs = fs;
	}
	@Autowired
	public void setqs(QnaService qs) {
		this.qs = qs;
	}
	
	@Autowired
	public void setComs(CommentService coms) {
		this.coms = coms;
	}
	
	@Inject
	private CommentService commentService;
	
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
	public String faq(HttpServletRequest request, Model model) {
		model.addAttribute("list", fs.viewlist());
		return "servicecenter/faq";
	}
	
	/* Notice 게시판 */
	@GetMapping("/notice/view")
	public String no_viewByUid(HttpServletRequest request, int N_uid, Model model) {
		model.addAttribute("list", cs.viewByUid(N_uid));
		return "servicecenter/notice/view";
	}
	
	@RequestMapping("/notice/notice")
	public String no_notice(HttpServletRequest request, Model model) {
		model.addAttribute("list", cs.viewlist());
		return "servicecenter/notice/notice";
	}
	
	@RequestMapping("/notice/update")
	public String no_update(int uid, Model model, ServiceCenterDTO dto) {	
		model.addAttribute("list", cs.viewByUid(uid));
		return "servicecenter/notice/update";
	}
	
	@PostMapping("/notice/updateOk")
	public String no_updateOk(ServiceCenterDTO dto, Model model) {
		model.addAttribute("result", cs.update(dto));
		return "servicecenter/notice/updateOk";
	}

	@RequestMapping("/notice/write")
	public String no_write(HttpServletRequest request) {
		
		return "servicecenter/notice/write";
	}
	
	@RequestMapping("/notice/writeOk")
	public String no_writeOk(HttpServletRequest request, ServiceCenterDTO dto, Model model) {
		model.addAttribute("result", cs.write(dto));
		return "servicecenter/notice/writeOk";
	}
	
	@GetMapping("/notice/deleteOk")
	public String no_deleteOk(HttpServletRequest request, int uid, Model model) {
		model.addAttribute("result", cs.deleteByUid(uid));
		return "servicecenter/notice/deleteOk";
	}
	
	
	/* faq 게시판 */
	@GetMapping("/faq/view")
	public String fa_viewByUid(HttpServletRequest request, int f_uid, Model model) {
		model.addAttribute("list", fs.viewByUid(f_uid));
		return "servicecenter/faq/view";
	}
	
	@RequestMapping("/faq/faq")
	public String fa_faq(HttpServletRequest request, Model model) {
		model.addAttribute("list", fs.viewlist());
		return "servicecenter/faq/faq";
	}
	
	@RequestMapping("/faq/update")
	public String fa_update(int uid, Model model, ServiceCenterDTO dto) {	
		model.addAttribute("list", fs.viewByUid(uid));
		return "servicecenter/faq/update";
	}
	
	@PostMapping("/faq/updateOk")
	public String fa_updateOk(FaqDTO dto, Model model) {
		model.addAttribute("result", fs.update(dto));
		return "servicecenter/faq/updateOk";
	}
	
	@RequestMapping("/faq/write")
	public String fa_write(HttpServletRequest request) {
		
		return "servicecenter/faq/write";
	}
	
	@RequestMapping("/faq/writeOk")
	public String fa_writeOk(HttpServletRequest request, FaqDTO dto, Model model) {
		model.addAttribute("result", fs.write(dto));
		return "servicecenter/faq/writeOk";
	}
	
	@GetMapping("/faq/deleteOk")
	public String fa_deleteOk(HttpServletRequest request, int uid, Model model) {
		model.addAttribute("result", fs.deleteByUid(uid));
		return "servicecenter/faq/deleteOk";
	}
	
	/* qna 게시판 */
	
	@RequestMapping("/qna/qna")
	public String qna(HttpServletRequest request, Model model) {
		model.addAttribute("list", qs.viewlist());
		return "servicecenter/qna/qna";
	}
	@GetMapping("/qna/view")
	public String qa_viewByUid(HttpServletRequest request, int q_uid, Model model) {
		request.setAttribute("uid", q_uid);
		model.addAttribute("list", qs.viewByUid(q_uid));
		model.addAttribute("commentlist", coms.selectCommentByUid(q_uid));
		return "servicecenter/qna/view";
		
	}
	@RequestMapping("/qna/update")
	public String qa_update(int uid, Model model, ServiceCenterDTO dto) {	
		model.addAttribute("list", qs.viewByUid(uid));
		return "servicecenter/qna/update";
	}
	
	@PostMapping("/qna/updateOk")
	public String qa_updateOk(QnaDTO dto, Model model) {
		model.addAttribute("result", qs.update(dto));
		return "servicecenter/qna/updateOk";
	}
	
	@RequestMapping("/qna/write")
	public String qa_write(HttpServletRequest request) {
		
		return "servicecenter/qna/write";
	}
	
	@RequestMapping("/qna/writeOk")
	public String qa_writeOk(HttpServletRequest request, QnaDTO dto, Model model) {
		model.addAttribute("result", qs.write(dto));
		return "servicecenter/qna/writeOk";
	}
	
	@GetMapping("/qna/deleteOk")
	public String qa_deleteOk(HttpServletRequest request, int uid, Model model) {
		model.addAttribute("result", qs.deleteByUid(uid));
		return "servicecenter/qna/deleteOk";
	}
	
}