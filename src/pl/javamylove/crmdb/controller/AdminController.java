package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.model.WorkerModel;
import pl.javamylove.crmdb.service.AdminService;

@Controller
public class AdminController {
	
	private AdminService adminService;

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/admin/panel")
	public String showAccount(Model model, HttpSession session) {
		List<WorkerModel> list = adminService.getWorkersList();
		model.addAttribute("list", list);
		return "admin/panel";
	}
}
