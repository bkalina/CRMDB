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
import pl.javamylove.crmdb.service.LoggerService;

@Controller
public class ClientController {

	private LoggerService loggerService;

	@Autowired
	public void setLoggerService(LoggerService loggerService) {
		this.loggerService = loggerService;
	}

	private ClientService clientService;

	@Autowired
	public void setClientService(ClientService clientService) {
		this.clientService = clientService;
	}

	@RequestMapping("/klienci")
	public String showClients(Model model, HttpSession session) {
		List<ClientModel> clList = clientService.getClientsList((int) session
				.getAttribute("pracownikId"));
		model.addAttribute("clientsList", clList);
		return "client/clients";
	}

	@RequestMapping("/dodajKlienta")
	public String addClient(Model model, HttpSession session) {
		model.addAttribute("clientModel", new ClientModel());
		return "client/addClient";
	}

	@RequestMapping(value = "/dodajKlientaDO", method = RequestMethod.POST)
	public String addClientDO(Model model, @Valid ClientModel client,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			return "client/addClient";
		} else {
			System.out.println(client);
			loggerService.log("Created client " + client.getImie() + " "
					+ client.getNazwisko() + " = "
					+ clientService.createClient(client));
			return "client/clientDone";
		}
	}

	@RequestMapping(value = "/edytujKlienta", method = RequestMethod.POST)
	public String editClient(Model model, HttpSession session,
			@RequestParam("klientId") int clientId) {
		session.setAttribute("klientId", clientId);
		ClientModel client = clientService.getClient(clientId);
		model.addAttribute("clientModel", client);
		model.addAttribute("client", client);
		return "client/editClient";
	}

	@RequestMapping(value = "/edytujKlientaDO", method = RequestMethod.POST)
	public String editClientDO(Model model, HttpSession session,
			@Valid ClientModel client, BindingResult result) {
		if (result.hasErrors()) {
			return "client/editClient";
		} else {
			loggerService.log("Updated client " + client.getImie() + " "
					+ client.getNazwisko() + " = "
					+ clientService.updateClient(client));
			session.removeAttribute("klientId");
			return "client/clientDone";
		}
	}

	@RequestMapping(value = "/usunKlientaDO", method = RequestMethod.POST)
	public String deleteClientDO(Model model, HttpSession session,
			@RequestParam("klientId") int clientId) {
		loggerService.log("Delete client id=" + clientId + " "
				+ clientService.deleteClient(clientId));
		session.removeAttribute("klientId");
		return "client/clientDone";
	}
}
