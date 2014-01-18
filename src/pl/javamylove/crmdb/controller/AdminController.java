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

import pl.javamylove.crmdb.model.WorkerModel;
import pl.javamylove.crmdb.service.AdminService;

@Controller
public class AdminController {

	private AdminService adminService;

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "/admin/adminPanel";
	}

	@RequestMapping("/admin/adminPanel")
	public String showAccount(Model model, HttpSession session) {
		List<WorkerModel> list = adminService.getWorkersList();
		model.addAttribute("list", list);
		return "admin/panel";
	}

	@RequestMapping("/admin/dodajPracownika")
	public String addWorker(Model model) {
		model.addAttribute("workerModel", new WorkerModel());
		return "admin/addWorker";
	}

	@RequestMapping(value = "/admin/dodajPracownikaDO", method = RequestMethod.POST)
	public String addWorkerDO(Model model, @Valid WorkerModel worker,
			BindingResult result) {

		if (result.hasErrors()) {
			return "admin/addWorker";
		} else {
			System.out.println("Created team member " + worker.getEmail()
					+ " = " + adminService.createWorker(worker));
			return "admin/workerDone";
		}
	}

	@RequestMapping(value = "/admin/usunPracownikaDO", method = RequestMethod.POST)
	public String deleteWorkerDO(Model model, HttpSession session,
			@RequestParam("workerId") int workerId) {
		System.out.println("Deleted team member id=" + workerId + " = "
				+ adminService.deleteWorker(workerId));
		session.removeAttribute("workerId");
		return "admin/workerDone";
	}
}
