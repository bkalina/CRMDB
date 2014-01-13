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
	
	public List<ClientModel> getClientsList(int id){
		System.out.println("clientService: getClientsList()");
		return clientDao.getClientsList(id);
	}
	
	
}
