package pl.javamylove.crmdb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.javamylove.crmdb.model.ClientModel;
import pl.javamylove.crmdb.service.ClientService;

@Controller
public class ClientController {
	
	private ClientService clientService;
	
	@Autowired
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	@RequestMapping("/klienci")
	public String showClients(Model model, HttpSession session){
		System.out.println("Id: " + session.getAttribute("id"));
		List<ClientModel> clList = clientService.getClientsList((int) session.getAttribute("id"));
		model.addAttribute("clientsList", clList);
		return "client/clients";
	}
	
	@RequestMapping("/dodajKlienta")
	public String addClient(Model model, HttpSession session){
		System.out.println("Id: " + session.getAttribute("id"));
		model.addAttribute("clientsList", "x");
		return "client/addClient";
	}
	
	@RequestMapping(value="/dodajKlientaDO", method=RequestMethod.POST)
	public String addClientDO(Model model, HttpSession session, @Valid ClientModel client, BindingResult result){
		System.out.println("Id: " + session.getAttribute("id"));
//		client.setPracownikId((int)session.getAttribute("id"));
		
		if(result.hasErrors()){
			System.out.println("Validation Error!");
//			List<ObjectError> errors = result.getAllErrors();
//			for(ObjectError error:errors){
//				System.out.println(error);
//			}
		}
		else{
			System.out.println("Form validated!");
		}
		return "client/addClient";
	}
}
