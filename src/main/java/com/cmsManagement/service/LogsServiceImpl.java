package com.cmsManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmsManagement.dao.ProjectLogsDao;
import com.cmsManagement.model.ProjectLogs;

@Service
public class LogsServiceImpl implements LogsService{

	@Autowired
	private ProjectLogsDao projectLogsDao;
	
	/*
	 * @Autowired private NewsLogsDao newsLogsDao;
	 * 
	 * @Autowired private TenderLogsDao tenderLogsDao;
	 */

	@Override
	public List<ProjectLogs> getAllProjectLogs() {		
		return projectLogsDao.getAllProjectLogs();
	}
}
