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
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		List<ClientModel> clList = clientService.getClientsList((int) session.getAttribute("pracownikId"));
		model.addAttribute("clientsList", clList);
		return "client/clients";
	}
	
	@RequestMapping("/dodajKlienta")
	public String addClient(Model model, HttpSession session){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		model.addAttribute("clientsList", "x");
		return "client/addClient";
	}
	
	@RequestMapping(value="/dodajKlientaDO", method=RequestMethod.POST)
	public String addClientDO(Model model, HttpSession session, ClientModel client, BindingResult result){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
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
			System.out.println(client);
			System.out.println("Created: " + clientService.createClient(client));
		}
		return "client/addClient";
	}
	
	@RequestMapping(value="/edytujKlienta", method=RequestMethod.POST)
	public String editClient(Model model, HttpSession session, @RequestParam("klientId") int clientId){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		session.setAttribute("klientId", clientId);
		ClientModel client = clientService.getClient(clientId);
//		model.addAttribute("klientId", client.getId());
		model.addAttribute("client", client);
		return "client/editClient";
	}
	
	@RequestMapping(value="/edytujKlientaDO", method=RequestMethod.POST)
	public String editClientDO(Model model, HttpSession session, ClientModel client){
		
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		System.out.println("Id: " + session.getAttribute("klientId"));
		System.out.println("Update: " + clientService.updateClient(client));
		System.out.println(client);
		System.out.println(client.getNazwaFirmy());
		session.removeAttribute("klientId");
		System.out.println("Id: " + session.getAttribute("klientId"));
		return "client/clients";
	}
	
	@RequestMapping(value="/usunKlientaDO", method=RequestMethod.POST)
	public String deleteClientDO(Model model, HttpSession session, @RequestParam("klientId") int clientId){
		System.out.println("Id: " + session.getAttribute("pracownikId"));
		System.out.println("Id: " + session.getAttribute("klientId"));
		System.out.println("Delete: " + clientService.deleteClient(clientId));
		session.removeAttribute("klientId");
		System.out.println("Id: " + session.getAttribute("klientId"));
		return "client/clients";
	}
}
