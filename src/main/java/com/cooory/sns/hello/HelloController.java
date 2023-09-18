package com.cooory.sns.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@GetMapping("/hello")
	@ResponseBody
	public String hello() {
		
		return "Hello World";
	}
	
	
	@GetMapping("/hello/hello")
	public String helloJsp() {
		
		return "/hello/hello";
	}
}
