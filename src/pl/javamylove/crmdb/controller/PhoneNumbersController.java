package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.model.PhoneNumberModel;
import pl.javamylove.crmdb.service.PhoneNumberService;

@Controller
public class PhoneNumbersController {
	
	private PhoneNumberService pnService;
	
	@Autowired
	public void setPnService(PhoneNumberService pnService) {
		this.pnService = pnService;
	}

	@RequestMapping("/telefony")
	public String showPhoneNumbers(Model model, HttpSession session){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		List<PhoneNumberModel> pnList = pnService.getNumbersList((int) session.getAttribute("pracownikId"));
		model.addAttribute("numbersList", pnList);
		return "number/numbers";
	}
}