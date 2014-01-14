package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String showWelcome(HttpSession session) {
		session.setAttribute("pracownikId", 1);
		System.out.println("MAX inactive time " + session.getMaxInactiveInterval()/60 + "min");
		return "welcome";
	}
	
	@RequestMapping("/wyloguj")
	public String logout(HttpSession session) {
		System.out.println("Logout " + session.getAttribute("pracownikId"));
		return "welcome";
	}
}
