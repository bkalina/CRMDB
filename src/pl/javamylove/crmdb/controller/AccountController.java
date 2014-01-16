package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.javamylove.crmdb.model.WorkerModel;
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
		WorkerModel worker = accService.getWorker((int) session.getAttribute("pracownikId"));
		model.addAttribute("pracownik", worker);
		return "account/account";
	}

	@RequestMapping(value = "/mojekontoEdycja", method = RequestMethod.POST)
	public String editAccount(Model model, HttpSession session,
			WorkerModel worker, @RequestParam("emailOld") String emailOld,
			@RequestParam("numerOld") String numerOld) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		if (emailOld.equals(worker.getEmail())==false) {
			accService.updateEmail(worker);
		}
		if (numerOld.equals(worker.getTelefon())==false) {
			accService.updateNumber(worker);
		}
		return "account/account";
	}

	@RequestMapping(value = "/mojekontoHaslo", method = RequestMethod.POST)
	public String editAccountPassword(Model model, HttpSession session,
			WorkerModel worker) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		if (worker.getHaslo().isEmpty() == false) {
			accService.updatePassword(worker);
		}
		return "account/account";
	}

}
