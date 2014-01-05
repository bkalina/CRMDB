package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.PhoneNumberDAO;
import pl.javamylove.crmdb.model.PhoneNumber;

@Service("phoneNumberService")
public class PhoneNumberService {

	private PhoneNumberDAO pnDao;

	@Autowired
	public void setPnDao(PhoneNumberDAO pnDao) {
		this.pnDao = pnDao;
	}
	
	public List<PhoneNumber> getNumbersList(int id){
		System.out.println("pnService: getNumbersList()");
		return pnDao.getNumbersList(id);
	}
	
	
}
