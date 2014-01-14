package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.PanelDAO;
import pl.javamylove.crmdb.model.ClientModel;
import pl.javamylove.crmdb.model.PanelModel;
import pl.javamylove.crmdb.model.ScheduleModel;

@Service("panelService")
public class PanelService {

	private PanelDAO panelDao;

	@Autowired
	public void setPanelDao(PanelDAO panelDao) {
		this.panelDao = panelDao;
	}
	
	public PanelModel getCount(int id){
		System.out.println("panelService: getPhoneNumberCount()");
		return panelDao.getCount(id);
	}
	
	public List<ScheduleModel> getScheduleList10(int id){
		System.out.println("panelService: getScheduleList10()");
		return panelDao.getScheduleList10(id);
	}
}
