package com.cmsManagement.dao;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;





import com.cmsManagement.model.Modules;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserOtp;
import com.cmsManagement.model.UserPermissions;
import com.cmsManagement.util.Constants;


@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

	//Users
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAllUser() {
		return (List<User>) getSession().createQuery("from User where state='A' ORDER BY created_date DESC").list();
	}	
	
	public int saveUser(User user) {
		return (int)getSession().save(user);
	}
		
	@Override
	public boolean updateUser(User user) {
		try {
			getSession().update(user);
			return true;
		} catch (Exception exception) {
			return false;
		}	
	}
	
	@Override
	public User findUserById(int userId) {
		return getByKey(userId);
	}

	@Override
	public Permissions findpermissionById(int permissionID) {
		Criteria criteria = getSession().createCriteria(Permissions.class);
		criteria.add(Restrictions.eq("permissionID", permissionID));
		return (Permissions) criteria.uniqueResult();
	}
	
	@Override
	public boolean deleteUser(int userId) {
		try{
			Query  q=  getSession().createQuery("UPDATE User set state ='D'"
					+ " where user_id= :user_id");		
			q.setParameter("user_id", userId);
			q.executeUpdate();
			return true;
		} catch (Exception exception) {
			return false;
		}
	}

	/*@Override
	public boolean updatePassword(int user_id, String newPassword, int updated_By, String update_Date) {
		try{	
		Query  q=  getSession().createQuery("UPDATE User set password ='"+newPassword+"',"
					+ " updated_by='"+updated_By+"', updated_date='"+update_Date+"'"
					+ " where user_id= :user_id");		
			q.setParameter("user_id", user_id);
			q.executeUpdate();
			return true;
		} catch (Exception exception) {
			return false;
		}
	}*/
	
	
	
	@Override
	public User checkUsername(String username) {
		Criteria criteria = getSession().createCriteria(User.class, "user");
		criteria.add(Restrictions.eq("user.username", username));
		return (User) criteria.uniqueResult(); 
	}
	
	@Override
	public User checkEditedUsername(String username, int user_id) {
		Criteria criteria = getSession().createCriteria(User.class, "user");
		criteria.add(Restrictions.eq("user.username", username));	
		criteria.add(Restrictions.eq("user.user_id", user_id));	
		 User user= (User) criteria.uniqueResult();
		 if(user==null){
			   Criteria criteria1 = getSession().createCriteria(User.class, "user");
				criteria1.add(Restrictions.eq("user.username", username));
			 return (User) criteria1.uniqueResult();
		 }else{
			 return null;
		 }
	}
	
	
	
	
	
	
	
	
	//Permissions
	
	@Override
	public boolean updateUserPermission(int userID, int permissionID) {
		try{
			Query  q= (Query) getSession().createQuery("UPDATE UserPermissions set status ='A'"
					+ " where userID.user_id= :userID and permissionID.permissionID= :permissionID");		
			q.setParameter("userID", userID);
			q.setParameter("permissionID", permissionID);
			q.executeUpdate();
		return true;
		}catch (Exception exception) {
			return false;
		}
	}

	@Override
	public void deactivateUserPermission(int userID, int permissionID) {
		System.out.println("userID "+userID);
		Query  q= (Query) getSession().createQuery("UPDATE UserPermissions set status ='D'"
				+ " where userID.user_id= :userID and permissionID.permissionID= :permissionID");		
		q.setParameter("userID", userID);
		q.setParameter("permissionID", permissionID);
		q.executeUpdate();
	}
	
	@Override
	public int setUserPermission(UserPermissions userPermissions) {
		return (int)getSession().save(userPermissions); //persist
	}
	
	@Override
	public List<Permissions> getModulesPermissions(int moduleID) {
		Criteria criteria = getSession().createCriteria(Permissions.class);
		criteria.add(Restrictions.eq("moduleID.module_id", moduleID));
		 return criteria.list();
		
	}
	
	@Override
	public List<Modules> findAllModules() {		
		return (List<Modules>) getSession().createQuery("from Modules where  MODULE_TYPE!='DOWNLOAD'").list();
	}
	
    public User findByUsername(String username){
		 Criteria criteria = getSession().createCriteria(User.class,"user");
			criteria.add(Restrictions.eq("user.username", username));
			criteria.add(Restrictions.eq("user.state", Constants.ACTIVE_STATE));
			List<User> list =  criteria.list();
			if(list.size() > 0){
				return (User) criteria.list().get(0);
			}
			else{
				return null;
			}
	}

	@Override
	public List<User> getUserByRoleID(int roleID) {
		if(roleID==0){
			Criteria criteria = getSession().createCriteria(User.class, "user");
			criteria.add(Restrictions.eq("state", "A"));
			return criteria.list();
		}else{
			Criteria criteria = getSession().createCriteria(User.class, "user");
			criteria.add(Restrictions.eq("user.roleID.role_id", roleID));
			criteria.add(Restrictions.eq("state", "A"));
			return criteria.list();
		}
		
	}

	@Override
	public Roles getRoleByRoleID(int roleID) {
		Criteria criteria = getSession().createCriteria(Roles.class, "role");
		criteria.add(Restrictions.eq("role.role_id", roleID));	
		return (Roles) criteria.uniqueResult();
	}
	
	@Override
	public List<UserPermissions> getModulesPermissions(int moduleID, int userID) {
		Criteria criteria = getSession().createCriteria(UserPermissions.class, "p");
		criteria.add(Restrictions.eq("p.userID.user_id", userID));	
		criteria.createAlias("p.permissionID", "permissionID");
		criteria.add(Restrictions.eq("permissionID.moduleID.module_id", moduleID));	
		 return criteria.list();
	}
	
	@Override
	public List<UserPermissions> getListOfUserPermissions1(int userID) {
		Criteria criteria = getSession().createCriteria(UserPermissions.class, "p");
		criteria.add(Restrictions.eq("p.userID.user_id", userID));	
		criteria.add(Restrictions.eq("p.status", Constants.ACTIVE_STATE));
		return criteria.list();
	}

	@Override
	public List<Permissions> getListOfUserPermissions(int userID) {		
		 SQLQuery query = getSession().createSQLQuery("Select p.ID, p.module_ID, p.NAME, m.module_Type, "
					+ "u.status from permission p, user_permissions u, modules m"
					+ " where p.ID = u.permission_ID and m.ID = p.MODULE_ID and u.status='A' and u.user_ID= :userID ");
		 query.setParameter("userID", userID);
      query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
      return query.list();
	}

	@Override
	public List<User> getUserByUserID(int UserID) {
		Criteria criteria = getSession().createCriteria(User.class, "user");
		criteria.add(Restrictions.eq("user.user_id", UserID));
		return criteria.list();
	}

	@Override
	public User findUserByEmail(String email) {
		Criteria criteria = getSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("state", Constants.ACTIVE_STATE));
		return (User) criteria.uniqueResult();
	}

	@Override
	public void saveUserOtp(UserOtp userOtp) {
		getSession().save(userOtp);		
	}

	@Override
	public UserOtp getUserByOtp(int otp) {
		Criteria criteria = getSession().createCriteria(UserOtp.class);
		criteria.add(Restrictions.eq("otp", otp));
		return (UserOtp) criteria.uniqueResult();
	}

	@Override
	public void deleteOtp(int user_id) {
		 getSession().createQuery("delete from UserOtp where user.user_id="+user_id+"").executeUpdate();
	}

	@Override
	public void increaseFailedAttempts(int upCnt, User users) {		
			Query q=  getSession().createQuery("update User set failed_attempt =:failed_attempt"
					+ " where user_id= :user_id");	
			q.setParameter("failed_attempt", upCnt);
			q.setParameter("user_id", users.getUser_id());
			q.executeUpdate();
		
	}

	
	
	
			
	
	
	
	
	
	
	
	
	
	
	
	

	/*Query  q= (Query) getSession().createQuery("from Permissions where moduleID= :moduleID");
	q.setParameter("moduleID", moduleID);		
	return  q.list();*/
	/*SQLQuery  squery = getSession().createSQLQuery("CALL roleProcedure(?,?,?)").addEntity(Roles.class);
	Query query=	squery.setParameter(0, "getUserWithRole").
			setParameter(1, 0).setParameter(2, null);
		
	List result = query.list();		
	return result;*/

	/*SQLQuery  squery = getSession().createSQLQuery("CALL roleProcedure(?,?,?)").addEntity(Roles.class);
	Query query=	squery.setParameter(0, "getRoleByType").
			setParameter(1, 0).setParameter(2, "dba");
		
	List result = query.list();		
	return result;*/
	
	
	/*SQLQuery  squery = getSession().createSQLQuery("CALL roleProcedure(?,?,?)").addEntity(Roles.class);
		Query query=	squery.setParameter(0, "getRoleByType").
				setParameter(1, 0).setParameter(2, "dba");
			
	List result = query.list();		
	return result;
	Query query = getSession().createSQLQuery("CALL roleProcedure(:pAction)").addEntity(Roles.class)
			.setParameter("pAction", "getAllRole");				
	List result = query.list();
	for(int i=0; i<result.size(); i++){
		Roles roles = (Roles)result.get(i);
		System.out.println("Roles "+i +" "+roles.getRole_type());
	}
		return result;*/
	
	
	
/*	
	@Override
	public List<Permissions> getUserModulePermissions(int userID, int moduleID) {
		Query  q= (Query) getSession().createQuery("Select p.permissionID, p.moduleID, p.permissiontype, "
				+ "u.status from Permissions p, UserPermissions u"
				+ " where p.permissionID = u.permissionID and u.userID= :userID and p.moduleID= :moduleID");		
		q.setParameter("userID", userID);
		q.setParameter("moduleID", moduleID);
		q.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		List l = q.list();
		System.out.println(l.getClass());
		return l;	
		
		 SQLQuery query = getSession().createSQLQuery("Select p.ID, p.module_ID, p.NAME, "
					+ "u.status from permission p, user_permissions u"
					+ " where p.ID = u.permission_ID and u.user_ID= :userID and p.module_ID= :moduleID");
		 query.setParameter("userID", userID);
		 query.setParameter("moduleID", moduleID);
         query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
         List data = query.list();
         return data;
	}	
	
	
	@Override
	public List<Permissions> checkUserModulePermissions(int userID, int moduleID) {
		Query  q= (Query) getSession().createQuery("Select p.permissionID, p.moduleID, p.permissiontype, "
				+ "u.status from Permissions p, UserPermissions u"
				+ " where p.permissionID = u.permissionID and u.userID= :userID and p.moduleID= :moduleID");		
		q.setParameter("userID", userID);
		q.setParameter("moduleID", moduleID);
		return q.list();
	}	
	
	
	@Override
	public  List<Permissions> checkUserModule(int userID) {		
//		Query  q= (Query) getSession().createQuery("select u.userID, u.permissionID, p.moduleID from UserPermissions u, Permissions p "
//				+ "where u.userID= :userID and p.moduleID= :moduleID");
//		SELECT MODULE_ID from permission, user_permissions where permission.ID = user_permissions.PERMISSION_ID and user_permissions.USER_ID=2;
		Query  q= (Query) getSession().createQuery("SELECT p.moduleID from Permissions p, UserPermissions u"
				+ " where p.permissionID = u.permissionID and u.userID= :userID");		
		q.setParameter("userID", userID);
		return q.list();
	}
	*/
	
	
	/*@Override
	public List<UserPermissions> getPermissionsByModules(int moduleID) {
		Criteria criteria = getSession().createCriteria(UserPermissions.class, "p");
		criteria.createAlias("p.permissionID", "permissionID");
		criteria.createAlias("permissionID.moduleID", "moduleID");
		criteria.setProjection(Projections.property("moduleID.module_type"));
		criteria.add(Restrictions.eq("permissionID.moduleID.module_id", moduleID));	
		 return criteria.list();
	}*/
	
	
	/*@Override
	public List<UserPermissions> getListOfUserPermissions1(int userID) {
		Criteria criteria = getSession().createCriteria(UserPermissions.class);
		criteria.createAlias("permissionID", "permissionID");
		criteria.createAlias("permissionID.moduleID", "moduleID");
		
		ProjectionList projectionList = Projections.projectionList();
		
		projectionList.add(Projections.property("permissionID.permissiontype").as("permissiontype"));
		projectionList.add(Projections.property("moduleID.module_type").as("module_type"));
		criteria.setProjection(projectionList);
		criteria.add(Restrictions.eq("userID.user_id", userID));	
		return criteria.list();
	}*/
}
