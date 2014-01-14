package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.ScheduleDAO;
import pl.javamylove.crmdb.model.ScheduleModel;

@Service("scheduleService")
public class ScheduleService {

	private ScheduleDAO sDao;

	@Autowired
	public void setSDao(ScheduleDAO sDao) {
		this.sDao = sDao;
	}
	
	public List<ScheduleModel> getScheduleList(int id){
		System.out.println("scheduleService: getScheduleList()");
		return sDao.getScheduleList(id);
	}
	
	
}
