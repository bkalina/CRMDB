package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.model.WorkerModel;
import pl.javamylove.crmdb.service.TeamService;

@Controller
public class TeamController {

	private TeamService teamService;

	@Autowired
	public void setTeamService(TeamService teamService) {
		this.teamService = teamService;
	}

	@RequestMapping("/mojZespol")
	public String showTeam(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		List<WorkerModel> workers = teamService.getTeamList((int) session.getAttribute("id"));
		model.addAttribute("workers", workers);
		return "team/team";
	}
	
	@RequestMapping("/dodajCzlonka")
	public String addMember(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		model.addAttribute("workerModel", new WorkerModel());
		return "team/addMember";
	}
}
