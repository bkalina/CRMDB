package pl.javamylove.crmdb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.PanelDAO;
import pl.javamylove.crmdb.model.PanelModel;

@Service("panelService")
public class PanelService {

	private PanelDAO panelDao;

	@Autowired
	public void setPanelDao(PanelDAO panelDao) {
		this.panelDao = panelDao;
	}
	
	public PanelModel getCount(){
		System.out.println("panelService: getPhoneNumberCount()");
		return panelDao.getCount();
	}
}
