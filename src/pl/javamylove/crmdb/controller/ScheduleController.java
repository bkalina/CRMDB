package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String showSchedule(Model model, HttpSession session){
		List<ScheduleModel> sModel = schService.getScheduleList((int) session.getAttribute("pracownikId"));
		model.addAttribute("scheduleList", sModel);
		return "schedule/schedule";
	}
}
