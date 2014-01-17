package pl.javamylove.crmdb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import pl.javamylove.crmdb.model.ScheduleModel;
import pl.javamylove.crmdb.service.ScheduleService;

@Controller
public class ScheduleController {

	private ScheduleService schService;

	@Autowired
	public void setSchService(ScheduleService schService) {
		this.schService = schService;
	}

	@RequestMapping("/terminarz")
	public String showSchedule(Model model, HttpSession session) {
		List<ScheduleModel> sModel = schService.getTermsList((int) session
				.getAttribute("pracownikId"));
		model.addAttribute("scheduleList", sModel);
		return "schedule/schedule";
	}

	@RequestMapping("/dodajTermin")
	public String addTerm(Model model, HttpSession session) {
		model.addAttribute("scheduleModel", new ScheduleModel());
		SimpleDateFormat form = new SimpleDateFormat("dd-MM-yyyy");
		String data = form.format(new Date());
		model.addAttribute("data", data);
		return "schedule/addTerm";
	}

	@RequestMapping("/dodajTerminDO")
	public String addTermDO(Model model, @Valid ScheduleModel schedule,
			BindingResult result) {

		if (result.hasErrors()) {
			return "schedule/addTerm";
		} else {
			System.out.println(schedule);
			System.out
					.println("Created: " + schService.createTerm(schedule));
			return "schedule/termDone";
		}
	}
	
	@RequestMapping(value="/edytujTermin", method=RequestMethod.POST)
	public String editTerm(Model model, HttpSession session, @RequestParam("termId") int termId){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		session.setAttribute("termId", termId);
		ScheduleModel schedule = schService.getTerm(termId);
		model.addAttribute("scheduleModel", schedule);
		model.addAttribute("schedule", schedule);
		return "schedule/editTerm";
	}
	
	@RequestMapping(value="/edytujTerminDO", method=RequestMethod.POST)
	public String editTermDO(Model model, HttpSession session, @Valid ScheduleModel schedule, BindingResult result){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		System.out.println("Id: " + session.getAttribute("termId"));
		if(result.hasErrors()){
			return "schedule/editTerm";
		}
		else{
			System.out.println(schedule);
			System.out.println("Update: " + schService.updateTerm(schedule));
			session.removeAttribute("termId");
			return "schedule/termDone";
		}
	}
	
	@RequestMapping(value="/usunTerminDO", method=RequestMethod.POST)
	public String deleteTermtDO(Model model, HttpSession session, @RequestParam("termId") int termId){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		System.out.println("Id: " + session.getAttribute("termId"));
		System.out.println("Delete: " + schService.deleteTerm(termId));
		session.removeAttribute("termId");
		return "schedule/termDone";
	}
}
