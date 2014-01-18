package pl.javamylove.crmdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.javamylove.crmdb.dao.TeamDAO;
import pl.javamylove.crmdb.model.WorkerModel;

@Service("teamService")
public class TeamService {

	private TeamDAO teamDao;

	@Autowired
	public void setTeamDao(TeamDAO teamDao) {
		this.teamDao = teamDao;
	}

	public List<WorkerModel> getTeamList(int id) {
		return teamDao.getWorkersList(id);
	}

	public boolean createWorker(WorkerModel worker) {
		return teamDao.createWorker(worker);
	}

	public boolean deleteWorker(int workerId) {
		return teamDao.deleteWorker(workerId);
	}

}
