package com.cmsManagement.dao;

import java.util.List;

import javax.transaction.Transactional;

 import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmsManagement.model.EntryLogModel;
import com.cmsManagement.model.LoginInfo;

@Repository
@Transactional
public class LogDaoImpl extends AbstractDao<Integer, EntryLogModel>  implements LogDao{
	@Autowired
	private SessionFactory sessionFactory;

 	
	@Override
	public List<EntryLogModel> GetData() {
		
		return (List<EntryLogModel>) getSession().createQuery("from EntryLogModel ").list();
	}

	@Override
	public int SaveUserIdAndTimeAfterLogin(LoginInfo logininfo) {
		
		return (int) getSession().save(logininfo);
	}

	@Override
	public List<LoginInfo> getInfoByID(int userid) {
		if(userid==0){
			return (List<LoginInfo>) getSession().createQuery("from LoginInfo").list();
		}else{
			return (List<LoginInfo>) getSession().createQuery("from LoginInfo where user_id = '"+userid+"' ").list();
		}
		
	}

	@Override
	public boolean UpdateUserIdAndTimeAfterLogout(LoginInfo logininfo) {
		try {
			 getSession().createQuery("update LoginInfo set logoutTime = '"+logininfo.getLogoutTime()+"' where user_id = '"+logininfo.getUserId()+"' ")
	         
	         .executeUpdate();
			 return true;
	
		     } catch (Exception exception) {
			 return false;
		     }	
	}

}
