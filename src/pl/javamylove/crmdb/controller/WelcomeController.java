package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.javamylove.crmdb.model.WorkerModel;

@Controller
public class WelcomeController {

	@RequestMapping("/")
	public String showWelcome(HttpSession session) {
		session.setAttribute("pracownikId", 1);
		System.out.println("MAX inactive time " + session.getMaxInactiveInterval()/60 + "min");
		return "welcome";
	}
	
//	@RequestMapping(value="/zaloguj", method=RequestMethod.POST)
//	public String login(HttpSession session, @RequestParam("login") String login, @RequestParam("haslo") String password) {
//		if(welcomeService.login(login,password)){
//			WorkerModel worker = welcomeService.getWorkerData(login);
//			if(worker.getPrzelozonyId().isEmpty())
//				session.setAttribute("pracownikId", worker.getId());
//			else
//				session.setAttribute("pracownikId", worker.getPrzelozonyId());
//			return "panel/panel";
//		}
//		else{
//			return "welcome";
//		}
//	}
	
	@RequestMapping("/wyloguj")
	public String logout(HttpSession session) {
		System.out.println("Logout " + session.getAttribute("pracownikId"));
		return "welcome";
	}
}
