package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.model.WorkerModel;
import pl.javamylove.crmdb.service.LoggerService;
import pl.javamylove.crmdb.service.WorkerService;

@Controller
public class WelcomeController {
	
	private WorkerService workerService;

	@Autowired
	public void setWorkerService(WorkerService workerService) {
		this.workerService = workerService;
	}
	
	private LoggerService loggerService;
	
	@Autowired
	public void setLoggerService(LoggerService loggerService) {
		this.loggerService = loggerService;
	}

	@RequestMapping("/")
	public String showWelcome(HttpSession session) {
		return "welcome";
	}
	
	@RequestMapping("/login")
	public void loginProcess(HttpSession session) {
		setSessionAttribute(session);
	}

	public WorkerModel getInitData() {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		String username = auth.getName();
		
		if (username.equals("admin")) {
			adminLogin();
		}
		
		System.out.println("|||||||||||||||||||||||||||||||||||");
		System.out.println("User: " + username + " logged in!");
		System.out.println("Authority: " + auth.getAuthorities());
		System.out.println("|||||||||||||||||||||||||||||||||||");
		loggerService.log("User: " + username + " logged in!");

		return workerService.getWorkerId(username);
	}

	public void setSessionAttribute(HttpSession session) {
		WorkerModel worker = getInitData();
		int pracownikId = worker.getId();
		int przelozonyId = worker.getPrzelozonyId();

		if (przelozonyId == 0) {
			session.setAttribute("pracownikId", pracownikId);
			session.setAttribute("id", pracownikId);
		} else {
			session.setAttribute("pracownikId", przelozonyId);
			session.setAttribute("id", pracownikId);
		}
		session.setAttribute("imieNazwisko", worker.getImie()+" "+worker.getNazwisko());
		session.setAttribute("ranga", worker.getRanga());
	}

	public String adminLogin() {
		System.out.println("|||||||||||||||||||||||||||||||||||");
		System.out.println("Admin logged in!");
		System.out.println("|||||||||||||||||||||||||||||||||||");
		return "/admin/panel";
	}
}
