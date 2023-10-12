package com.cooory.sns.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cooory.sns.user.domain.User;
import com.cooory.sns.user.service.UserService;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/signin")
	public Map<String, String> login(
			@RequestParam("email") String email
			, @RequestParam("password") String password
			, HttpSession session) {
		
		User user = userService.getUser(email, password);
		
		Map<String, String> resultMap = new HashMap<>();
		if (user!= null) {
			// 로그인 성공
			resultMap.put("result", "success");
			
			session.setAttribute("email", user.getEmail());
			session.setAttribute("password", user.getPassword());
		} else {
			// 로그인 실패
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicatedEmail(@RequestParam("email") String email) {
		
		boolean isDuplicate = userService.isDuplicatedEmail(email);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}
		
		return resultMap;
	}
	

	@PostMapping("/signup")
	public Map<String, String> join(
		@RequestParam("email") String email
		, @RequestParam("password") String password
		, @RequestParam("name") String name
		, @RequestParam("userName") String userName
		, @RequestParam("phoneNumber") String phoneNumber
		, @RequestParam("gender") String gender
		, @RequestParam("birth") String birth
		, @RequestParam("introduce") String introduce) {
		
		User user = userService.addUser(email, password, name, userName, phoneNumber, gender, birth, introduce);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if (user != null) {
			resultMap.put("result", "success");
		}  else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
}
 