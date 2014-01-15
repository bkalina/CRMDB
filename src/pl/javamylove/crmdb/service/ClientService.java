package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.ClientDAO;
import pl.javamylove.crmdb.model.ClientModel;

@Service("clientService")
public class ClientService {

	private ClientDAO clientDao;

	@Autowired
	public void setClientDao(ClientDAO clientDao) {
		this.clientDao = clientDao;
	}

	public List<ClientModel> getClientsList(int id) {
		System.out.println("clientService: getClientsList()");
		return clientDao.getClientsList(id);
	}

	public ClientModel getClient(int klientId) {
		System.out.println("clientService: getClient()");
		return clientDao.getClient(klientId);
	}

	public boolean updateClient(ClientModel client) {
		System.out.println("clientService: updateClient()");
		return clientDao.updateClient(client);
	}
	
	public boolean createClient(ClientModel client){
		return clientDao.createClient(client);
	}
	
	public boolean deleteClient(int clientId){
		return clientDao.deleteClient(clientId);
	}
}
