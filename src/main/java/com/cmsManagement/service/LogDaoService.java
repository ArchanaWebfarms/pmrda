package com.cmsManagement.service;

import java.util.List;

import com.cmsManagement.model.LoginInfo;

public interface LogDaoService {
	int SaveUserIdAndTimeAfterLogin(LoginInfo logininfo);
	List<LoginInfo> getInfoByID(int userid);
	boolean UpdateUserIdAndTimeAfterLogout(LoginInfo logininfo);

}
