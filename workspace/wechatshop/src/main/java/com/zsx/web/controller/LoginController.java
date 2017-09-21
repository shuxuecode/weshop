package com.zsx.web.controller;

import javax.servlet.http.HttpServletRequest;

import com.zsx.web.model.Contants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping("login")
	public String toLoginPage(HttpServletRequest request) {
		request.getSession().setAttribute("userId", "zhao");
		Contants.userId = "zhao";
		return "login/login";
	}

	@RequestMapping("register")
	public String toRegisterPage() {
		Contants.userId = "";
		return "login/register";
	}

}
