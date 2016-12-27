package com.zsx.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户
 * @author zsx
 *
 */
@Controller
@RequestMapping("log")
public class LogController {

	@RequestMapping("a")
	public String toLogHtml(HttpServletRequest request, HttpServletResponse response){
		return "logs/log";
	}
	
	@RequestMapping("b")
	public void toLogHtml2(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

		response.sendRedirect(basePath + "logs/log.html");
		
//		request.getRequestDispatcher(basePath + "logs/log.html").forward(request, response);
	}
	
	/*
	@RequestMapping("{date}")
	public void toLogHtml(HttpServletRequest request, HttpServletResponse response){
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logs/log.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	*/
	
}
