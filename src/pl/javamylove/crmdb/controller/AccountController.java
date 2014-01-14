package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

	@RequestMapping("/mojekonto")
	public String showAccount(Model model, HttpSession session){
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		return "account/account";
	}
}
