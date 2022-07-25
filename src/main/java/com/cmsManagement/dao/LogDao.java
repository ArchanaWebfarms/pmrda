package com.cmsManagement.dao;

import java.util.List;

import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.LoginInfo;

public interface LogDao {
	List<EntryLogModel> GetData();
	int SaveUserIdAndTimeAfterLogin(LoginInfo logininfo);
	List<LoginInfo> getInfoByID(int userid);
	boolean UpdateUserIdAndTimeAfterLogout(LoginInfo logininfo);

}
