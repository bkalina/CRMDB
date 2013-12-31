package pl.javamylove.crmdb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NumbersController {

	@RequestMapping("/telefony")
	public String showNumbers(Model model){
		model.addAttribute("id", "1");
		return "number/numbers";
	}
}
