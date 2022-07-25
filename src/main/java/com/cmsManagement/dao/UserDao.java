package com.cmsManagement.dao;
import java.util.List;
import java.util.Set;





import com.cmsManagement.dto.UserDto;
import com.cmsManagement.dto.UserRightsRoles;
import com.cmsManagement.model.Modules;
import com.cmsManagement.model.Permissions;
import com.cmsManagement.model.Roles;
import com.cmsManagement.model.User;
import com.cmsManagement.model.UserOtp;
import com.cmsManagement.model.UserPermissions;

/**
 * @author ujwala_gawari
 *
 */
public interface UserDao {
	
	Roles getRoleByRoleID(int roleID);
	
	//Users	
	
	List<User> findAllUser();
	int saveUser(User user);	
	boolean updateUser(User user);	
	User findUserById(int userId);
	
	boolean deleteUser(int userId);
	//boolean updatePassword(int userId, String newPassword, int updated_By, String update_Date);
	User checkUsername(String username);
	User checkEditedUsername(String username, int user_id);
	//User findById(int id);
	List<User> getUserByUserID(int UserID);
	
	 //Permissions
	 List<Modules> findAllModules();
	
	 List<Permissions> getModulesPermissions(int moduleID);
	 int setUserPermission(UserPermissions userPermissions);
	 boolean updateUserPermission(int userID, int permissionID);
	 void deactivateUserPermission(int userID, int permissionID);
	 List<Permissions> getListOfUserPermissions(int userId);
	 List<User> getUserByRoleID(int roleID);
	 
	 
	 
	 
	 
	 
	 
	
	 User findByUsername(String username);

	List<UserPermissions> getModulesPermissions(int moduleID, int userID);

	List<UserPermissions> getListOfUserPermissions1(int userID);

	Permissions findpermissionById(int permissionID);

	User findUserByEmail(String email);

	void saveUserOtp(UserOtp userOtp);

	UserOtp getUserByOtp(int otp);

	void deleteOtp(int user_id);

	void increaseFailedAttempts(int upCnt, User users);

	
	
	//List<UserPermissions> getPermissionsByModules(int moduleID);
	// List<Permissions> checkUserModule(int userId);
	 //List<Permissions> getUserModulePermissions(int userId, int moduleID);
	 //List<Permissions> checkUserModulePermissions(int userId, int moduleID);
	

	
	
	
	
}

