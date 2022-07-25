package com.cmsManagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmsManagement.dao.LogDao;
import com.cmsManagement.model.LoginInfo;

@Service
public class LogDaoServiceImpl implements LogDaoService{
@Autowired
LogDao logdao;
	public int SaveUserIdAndTimeAfterLogin(LoginInfo logininfo) {
	
		return logdao.SaveUserIdAndTimeAfterLogin(logininfo);
	}
	@Override
	public List<LoginInfo> getInfoByID(int userid) {
		// TODO Auto-generated method stub
		return logdao.getInfoByID(userid);
	}
	@Override
	public boolean UpdateUserIdAndTimeAfterLogout(LoginInfo logininfo) {
		// TODO Auto-generated method stub
		return logdao.UpdateUserIdAndTimeAfterLogout(logininfo);
	}
	

}
