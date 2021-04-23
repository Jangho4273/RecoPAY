package com.spring.recopay.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.recopay.domain.CommentDTO;
import com.spring.recopay.service.CommentService;
 
@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
    CommentService commentService;
    
    
    
    @PostMapping("/insert") //댓글 작성 
    private String commentInsert(CommentDTO dto,Model model,HttpServletRequest request){
    	request.setAttribute("uid", dto.getQ_uid());
    	 dto.setWriter(currentUserName());
    	  model.addAttribute("result", commentService.insert(dto));
    
        return "servicecenter/qna/commentwriteOk";
    }
    
    @RequestMapping("/update") //댓글 수정
    @ResponseBody
    private int commentUpdate(@RequestParam int cno, @RequestParam String content){
        
        CommentDTO comment = new CommentDTO();
        comment.setCno(cno);
        comment.setContent(content);
        
        return  commentService.update(comment);
    }
    
    @RequestMapping("/delete/{cno}") //댓글 삭제  
    @ResponseBody
    private int commentDelete(@PathVariable int[] cno){
        
        return  commentService.delete(cno);
    }
    
	public static String currentUserName() { 
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal(); 
		return user.getUsername(); 
	}
    
}