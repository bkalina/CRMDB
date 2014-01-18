package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.javamylove.crmdb.model.ClientModel;
import pl.javamylove.crmdb.model.PhoneNumberModel;
import pl.javamylove.crmdb.service.ClientService;
import pl.javamylove.crmdb.service.PhoneNumberService;

@Controller
public class PhoneNumbersController {

	private PhoneNumberService pnService;

	@Autowired
	public void setPnService(PhoneNumberService pnService) {
		this.pnService = pnService;
	}

	private ClientService clService;

	@Autowired
	public void setClService(ClientService clService) {
		this.clService = clService;
	}

	@RequestMapping("/telefony")
	public String showPhoneNumbers(Model model, HttpSession session) {
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		List<PhoneNumberModel> pnList = pnService.getNumbersList((int) session
				.getAttribute("pracownikId"));
		model.addAttribute("numbersList", pnList);
		return "number/numbers";
	}

	@RequestMapping("/dodajNumer")
	public String addNumber(Model model, HttpSession session) {
		List<ClientModel> clList = clService.getClientsList((int) session
				.getAttribute("pracownikId"));
		model.addAttribute("clientsList", clList);
		model.addAttribute("numberModel", new PhoneNumberModel());
		return "number/addNumber";
	}

	@RequestMapping(value = "/dodajNumerDO", method = RequestMethod.POST)
	public String addNumberDO(Model model, @Valid PhoneNumberModel number,
			BindingResult result) {

		if (result.hasErrors()) {
			return "number/addNumber";
		} else {
			System.out.println(number);
			System.out.println("Created: " + pnService.createNumber(number));
			return "number/numberDone";
		}
	}

	@RequestMapping("/szukajKlienta")
	public String searchClient(Model model, String nip) {
		return "number/addNumber";
	}
}
