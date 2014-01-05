package pl.javamylove.crmdb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.javamylove.crmdb.model.PanelModel;
import pl.javamylove.crmdb.service.PanelService;

@Controller
public class PanelController {

	private PanelService panelService;

	@Autowired
	public void setPanelService(PanelService panelService) {
		this.panelService = panelService;
	}

	@RequestMapping("/panel")
	public String showPanel(Model model, HttpSession session) {
		PanelModel pModel = panelService.getCount((int) session.getAttribute("id"));
		model.addAttribute("count", pModel);
		return "panel/panel";
	}

}
