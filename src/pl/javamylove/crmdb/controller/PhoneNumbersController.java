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
import pl.javamylove.crmdb.service.LoggerService;
import pl.javamylove.crmdb.service.PhoneNumberService;

@Controller
public class PhoneNumbersController {

	private LoggerService loggerService;

	@Autowired
	public void setLoggerService(LoggerService loggerService) {
		this.loggerService = loggerService;
	}

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
		model.addAttribute("phoneNumberModel", new PhoneNumberModel());
		return "number/addNumber";
	}

	@RequestMapping(value = "/dodajNumerDO", method = RequestMethod.POST)
	public String addNumberDO(Model model, @Valid PhoneNumberModel number,
			BindingResult result) {

		if (result.hasErrors()) {
			return "number/addNumber";
		} else {
			System.out.println(number);
			loggerService.log("Created number " + number.getNumer() + " "
					+ pnService.createNumber(number));
			return "number/numberDone";
		}
	}

	@RequestMapping(value = "/edytujNumer", method = RequestMethod.POST)
	public String editNumber(Model model, HttpSession session,
			@RequestParam("numberId") int numberId) {
		session.setAttribute("numberId", numberId);
		PhoneNumberModel number = pnService.getNumber(numberId);
		model.addAttribute("phoneNumberModel", number);
		model.addAttribute("number", number);
		return "number/editNumber";
	}

	@RequestMapping(value = "/edytujNumerDO", method = RequestMethod.POST)
	public String editNumberDO(Model model, HttpSession session,
			@Valid PhoneNumberModel number, BindingResult result) {
		if (result.hasErrors()) {
			return "number/editNumber";
		} else {
			loggerService.log("Updated number "
					+ number.getNumer()
					+ " = "
					+ pnService.updateNumber(number,
							(int) session.getAttribute("numberId")));
			session.removeAttribute("numberId");
			return "number/numberDone";
		}
	}

	@RequestMapping(value = "/usunNumerDO", method = RequestMethod.POST)
	public String deleteNumberDO(Model model, HttpSession session,
			@RequestParam("numberId") int numberId) {
		loggerService.log("Delete number id=" + numberId + " "
				+ pnService.deleteNumber(numberId));
		session.removeAttribute("numberId");
		return "number/numberDone";
	}
}
