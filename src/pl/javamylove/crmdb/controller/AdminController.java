package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.service.AdminService;

@Component
public class AdminController {
	
	private AdminService adminService;

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping("/admin")
	public String showAccount(Model model, HttpSession session) {
		model.addAttribute("pracownikId", session.getAttribute("pracownikId"));
		return "admin/panel";
	}
}
