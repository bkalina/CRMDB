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
		List<WorkerModel> workers = teamService.getTeamList((int) session.getAttribute("pracownikId"));
		model.addAttribute("workers", workers);
		return "team/team";
	}
	
	@RequestMapping("/dodajCzlonka")
	public String addMember(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		model.addAttribute("workerModel", new WorkerModel());
		return "team/addMember";
	}
	
	@RequestMapping(value="/dodajCzlonkaDO", method=RequestMethod.POST)
	public String addClientDO(Model model, @Valid WorkerModel worker, BindingResult result){
		
		if(result.hasErrors()){
			return "team/addMember";
		}
		else{
			System.out.println(worker);
			System.out.println("Created: " + teamService.createWorker(worker));
			return "team/memberDone";
		}
	}
	
	@RequestMapping(value="/usunCzlonkaDO", method=RequestMethod.POST)
	public String deleteMemberDO(Model model, HttpSession session, @RequestParam("workerId") int workerId){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		System.out.println("Id: " + session.getAttribute("workerId"));
		System.out.println("Delete: " + teamService.deleteWorker(workerId));
		session.removeAttribute("workerId");
		return "team/memberDone";
	}
}
