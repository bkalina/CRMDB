package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.service.TeamService;

@Controller
public class TeamController {

	private TeamService teamService;

	@Autowired
	public void setTeamService(TeamService teamService) {
		this.teamService = teamService;
	}

	@RequestMapping("/mojzespol")
	public String showPanel(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		return "team/team";
	}
}
