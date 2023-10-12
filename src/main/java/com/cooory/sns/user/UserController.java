package com.cooory.sns.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/post/timeline")
	public String timeline() {
		
		return "post/timeline";
	}
	@GetMapping("/user/signin")
	public String loginInput() {
		
		return "user/signin";
	}
	
	@GetMapping("/user/signup")
	public String joinInput() {
		
		return "/user/signup";
	}
	
	public String logout(HttpSession session) {
		
		session.removeAttribute("userId");
		session.removeAttribute("email");
		
		return "redirect:/user/signin";
	}
}
