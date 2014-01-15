package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.service.AccountService;

@Controller
public class AccountController {

	private AccountService accService;

	@Autowired
	public void setSchService(AccountService accService) {
		this.accService = accService;
	}

	@RequestMapping("/mojekonto")
	public String showAccount(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		return "account/account";
	}

}
