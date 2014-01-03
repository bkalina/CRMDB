package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String showWelcome(HttpSession session){
		session.setAttribute("id", 1);
		System.out.println("Creation time " + session.getCreationTime());
		System.out.println("Inactive time " + session.getMaxInactiveInterval());
		return "welcome";
	}
}
