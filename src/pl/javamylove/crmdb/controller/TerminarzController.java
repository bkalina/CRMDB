package pl.javamylove.crmdb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TerminarzController {

	@RequestMapping("/terminarz")
	public String showSchedule(Model model){
		model.addAttribute("id", "1");
		return "schedule/schedule";
	}
}
