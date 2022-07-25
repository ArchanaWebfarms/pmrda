package com.cmsManagement.service;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cmsManagement.controller.LoginController;
import com.cmsManagement.dao.UserDao;
import com.cmsManagement.model.Modules;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserOtp;
import com.cmsManagement.model.UserPermissions;
import com.cmsManagement.util.Constants;
import com.cmsManagement.util.MethodsHelper;
import com.cmsManagement.util.PasswordEncryptionSHA512;


@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{

	public static final long LOCK_TIME_DURATION =  60 * 60 * 1000; // 60 min
	
	@Autowired
	private UserDao userDao;
	
	//@Autowired
	//private BCryptPasswordEncoder passwordEncoder;	
	
	@Override
	public List<User> findAllUser() {
		return userDao.findAllUser();
	}
	
	public int saveUser(User user){
		//user.setPassword(passwordEncoder.encode(user.getPassword()));
		byte[] salt = null;
		try {
			salt = PasswordEncryptionSHA512.getSalt();
		} catch (NoSuchAlgorithmException e) {}
		user.setPass_salt(salt);
		user.setPassword(PasswordEncryptionSHA512.getSecurePassword(user.getPassword().trim(), salt));		
		user.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		user.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		user.setPass_Status("TEMPORARY");		
		user.setAccount_non_locked(true);
		
		int id= userDao.saveUser(user);
		
		return id;
	}

	@Override
	public boolean updateUser(User user) {
		User users=userDao.findUserById(user.getUser_id());
		users.setUsername(user.getUsername());
		users.setFirstName(user.getFirstName());
		users.setLastName(user.getLastName());
		users.setEmail(user.getEmail());
		users.setAddress(user.getAddress());
		users.setMobileNumber(user.getMobileNumber());
		users.setContactNummber(user.getContactNummber());
		users.setState(Constants.ACTIVE_STATE);
		users.setRoleID(user.getRoleID());
		users.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		users.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		return userDao.updateUser(users);
	}
	
	@Override
	public User findUserById(int userId) {	
		 return userDao.findUserById(userId);
	}


	@Override
	public boolean deleteUser(int userId) {	
		return userDao.deleteUser(userId);
	}
	
	@Override
	public boolean updatePassword(int userId, String newPassword) {
		User users=userDao.findUserById(userId);
		System.err.println("before update users :"+users.toString());
	//	users.setPassword(passwordEncoder.encode(newPassword));
		byte[] salt = null;
		try {
			salt = PasswordEncryptionSHA512.getSalt();
		} catch (NoSuchAlgorithmException e) {}
		users.setPass_salt(salt);
		users.setPassword(PasswordEncryptionSHA512.getSecurePassword(newPassword.trim(), salt));
		users.setUpdated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		users.setUpdated_date(MethodsHelper.getCurrentDateAndTime());
		users.setPass_Status("PERMANENT");
		System.err.println("after update users :"+users.toString());
		return userDao.updateUser(users);
		//return userDao.updatePassword(userId, password, updatedBy, updateDate);		
	}
	
	@Override
	public User checkUsername(String username) {
		 return userDao.checkUsername(username);
	}
	
	@Override
	public User checkEditedUsername(String username, int userId) {
		return userDao.checkEditedUsername(username, userId);
	}

	
	
	
	
	
	
	//Permissions
	
	@Override
	public List<Modules> findAllModules() {		
		return userDao.findAllModules();
	}
	
	
	
	
	
	
	@Override
	public List<Permissions> getModulesPermissions(int moduleID) {
		return userDao.getModulesPermissions(moduleID);
	}
	
	
	
	@Override
	public int setUserPermission(int userID, int permissionID) {
		User user=userDao.findUserById(userID);
		Permissions permission=userDao.findpermissionById(permissionID);
		UserPermissions userPermissions = new UserPermissions() ;
		userPermissions.setUserID(user);
		userPermissions.setPermissionID(permission);
		userPermissions.setCreated_by(LoginController.getCurrentLoggedInUser().getUser().getUser_id());
		userPermissions.setCreated_date(MethodsHelper.getCurrentDateAndTime());
		userPermissions.setUpdated_by(0);
		userPermissions.setStatus(Constants.DEACTIVE_STATE);
		return userDao.setUserPermission(userPermissions);
	}


	@Override
	public boolean updateUserPermission(int userID, int permissionID) {
		return userDao.updateUserPermission(userID, permissionID);
	}
	
	@Override
	public void deactivateUserPermission(int userID, int permissionID) {
		userDao.deactivateUserPermission(userID, permissionID);
	}
	
	@Override
	public List<Permissions> getListOfUserPermissions(int userId) {
		return userDao.getListOfUserPermissions(userId);
	}
	
	
	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public List<User> getUserByRoleID(int roleID) {
		return userDao.getUserByRoleID(roleID);
	}

	@Override
	public Roles getRoleByRoleID(int roleID) {
		return userDao.getRoleByRoleID(roleID);
	}

	
	
	
	@Override
	public List<UserPermissions> getModulesPermissions1(int moduleID, int userID) {
		return userDao.getModulesPermissions(moduleID, userID);
	}

	@Override
	public List<UserPermissions> getListOfUserPermissions1(int userID) {
		return userDao.getListOfUserPermissions1(userID);
	}

	@Override
	public List<User> getUserByUserID(int UserID) {
		 return userDao.getUserByUserID(UserID);
	}

	@Override
	public User findUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}

	@Override
	public void saveUserOtp(User user, int otp) {
		UserOtp userOtp=new UserOtp();		
		userOtp.setOtp(otp);
		userOtp.setUser(user);		
		userDao.saveUserOtp(userOtp);
	}

	@Override
	public UserOtp getUserByOtp(int otp) {
		return userDao.getUserByOtp(otp);
	}

	@Override
	public void changePassword(int id, String password) {
		User users=userDao.findUserById(id);		
	//	users.setPassword(passwordEncoder.encode(password));
		byte[] salt = null;
		try {
			salt = PasswordEncryptionSHA512.getSalt();
		} catch (NoSuchAlgorithmException e) {}
		users.setPass_salt(salt);
		users.setPassword(PasswordEncryptionSHA512.getSecurePassword(password.trim(), salt));
		System.out.println("password :"+password+" salt :"+salt+" encodepassword :"+users.getPassword());
		 userDao.updateUser(users);		
	}

	@Override
	public void deleteOtp(int user_id) {
		userDao.deleteOtp(user_id);
	}

	@Override
	public void increaseFailedAttempts(User users) {
		int upCnt=users.getFailed_attempt()+1;
		userDao.increaseFailedAttempts(upCnt,users);
	}

	@Override
	public void lock(User users) {
		users.setAccount_non_locked(false);
		users.setLock_time(MethodsHelper.getCurrentDateAndTime());		
		
		userDao.updateUser(users);
	}

	@Override
	public void resetFailedLoginAttept(User user) {
		user.setAccount_non_locked(true);
		user.setLock_time(null);	
		user.setFailed_attempt(0);
		
		userDao.updateUser(user);
	}

	@Override
	public boolean unlockWhenTimeExpired(User users) throws ParseException {
		Date userDate=MethodsHelper.convertInDate2(users.getLock_time());
		Date currDate=MethodsHelper.convertInDate2(MethodsHelper.getCurrentDateAndTime1());
		
		long difference_In_Time = currDate.getTime() - userDate.getTime();		
		
		if(difference_In_Time<=LOCK_TIME_DURATION){
			return false;
		}else{
			users.setAccount_non_locked(true);
            users.setLock_time(null);
            users.setFailed_attempt(0);
             
            userDao.updateUser(users);
             
            return true;
		}
	}

	
	
	

	
	/*@Override
	public  List<Permissions> checkUserModule(int userId) {
		 return userDao.checkUserModule(userId);
	}*/

	/*@Override
	public List<Permissions> getUserModulePermissions(int userId, int moduleID) {		
		List list = userDao.getUserModulePermissions(userId, moduleID);
		 return list;
	}
*/
	/*@Override
	public List<Permissions> checkUserModulePermissions(int userId, int moduleID) {		
		return userDao.checkUserModulePermissions(userId, moduleID);
	}
	*/
	
	
	
	
	/*@Override
	public List<UserPermissions> getPermissionsByModules(int moduleID) {
		return userDao.getPermissionsByModules(moduleID);
	}*/
	
}
